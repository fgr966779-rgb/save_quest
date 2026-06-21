import 'dart:math' as math;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' as drift;
import '../../data/database.dart';
import '../providers/providers.dart';
import '../utils/money_utils.dart';
import '../../features/gamification/models/reward_model.dart';
import '../../core/models/avatar_config.dart';
import '../../features/gamification/providers/bounty_provider.dart';
import '../../features/gamification/providers/quest_provider.dart';
import '../services/gamification/xp_service.dart';
import '../services/gamification/streak_service.dart';
import '../services/gamification/leveling_service.dart';
import '../services/gamification/achievement_service.dart';

enum ActionContext {
  standard,
  cli,          // CLI usage -> Hacker XP
  bounty,       // AI Bounties -> Hacker XP
  recovery,     // Paying penalties -> Resilience XP
}
class DepositResult {
  final Deposit deposit;
  final int xpGained;
  final bool leveledUp;
  final int newLevel;
  final int streakCount;
  final bool freezeUsed;
  final bool isCritical;
  final int bonusXp;
  final int earnedCredits;
  final Lootbox? earnedLootbox;
  final List<Reward> newlyUnlockedRewards;
  final int hackerXpGained;
  final int magnateXpGained;
  final int resilienceXpGained;

  DepositResult({
    required this.deposit,
    required this.xpGained,
    required this.leveledUp,
    required this.newLevel,
    required this.streakCount,
    required this.freezeUsed,
    required this.isCritical,
    required this.bonusXp,
    required this.earnedCredits,
    this.earnedLootbox,
    required this.newlyUnlockedRewards,
    required this.hackerXpGained,
    required this.magnateXpGained,
    required this.resilienceXpGained,
  });
}

class SavingsNotifier extends StateNotifier<AsyncValue<void>> {
  final AppDatabase _db;
  final Ref _ref;

  SavingsNotifier(this._db, this._ref) : super(const AsyncValue.data(null));

  // ==========================================
  // TRANSACTION: CONFIRM DEPOSIT
  // All amounts arrive as display doubles (e.g. 250.50 UAH).
  // We convert to kopecks (int) before touching the DB.
  // ==========================================
  Future<DepositResult?> createDeposit({
    required double amount,
    required Map<String, double> goalAllocations, // goalId -> percent (0.0-100.0)
    String? note,
    CyberEvent? activeEvent,
    ActionContext context = ActionContext.standard,
  }) async {
    state = const AsyncValue.loading();
    try {
      final int totalCents = displayToCents(amount);
      final depositId = const Uuid().v4();
      final now = DateTime.now();

      final deposit = Deposit(
        id: depositId,
        amount: totalCents,
        goalAAmount: 0, // Deprecated
        goalBAmount: 0, // Deprecated
        note: note,
        createdAt: now,
        isDeleted: false,
        updatedAt: now,
        isSynced: false,
      );

      // ----------------------------------------
      // Single atomic transaction: savings + gamification
      // ----------------------------------------
      late UserProfile updatedProfile;
      List<Reward> newlyUnlocked = [];
      late int xpGained;
      late bool leveledUp;
      late int finalLevel;
      late int newStreak;
      late bool freezeUsed;
      late bool isCritical;
      late int bonusXp;
      late int earnedCredits;
      late int hackerXpInc;
      late int magnateXpInc;
      late int resilienceXpInc;
      Lootbox? earnedLootbox;

      await _db.transaction(() async {
        // 1. Save deposit and allocations
        await _db.into(_db.deposits).insert(deposit);

        int remainingCents = totalCents;
        final goalIds = goalAllocations.keys.toList();

        for (int i = 0; i < goalIds.length; i++) {
          final gid = goalIds[i];
          final percent = goalAllocations[gid]!;

          int allocCents;
          if (i == goalIds.length - 1) {
            allocCents = remainingCents; // Ensure no rounding drift
          } else {
            allocCents = (totalCents * percent / 100.0).round();
            remainingCents -= allocCents;
          }

          await _db.into(_db.depositAllocations).insert(DepositAllocationsCompanion.insert(
            id: const Uuid().v4(),
            depositId: depositId,
            goalId: gid,
            amount: allocCents,
            createdAt: now,
          ));

          // Update goal balance
          final goal = await _db.getGoalById(gid);
          if (goal != null) {
            await _db.updateGoal(goal.copyWith(
              currentAmount: goal.currentAmount + allocCents,
              updatedAt: drift.Value(now),
            ));
          }
        }

        // 2. Load or create user profile
        var profile = await _db.getUserProfile();
        final effectiveProfile = profile ?? UserProfile(
          id: 1, xp: 0, level: 1, streakCount: 0, maxStreak: 0, freezeTokens: 0, 
          skillPoints: 0, playerClass: null, currentTheme: 'default', avatarConfig: null,
          penaltyBalance: 0, hackerXp: 0, magnateXp: 0, resilienceXp: 0,
          lastBonusClaimDate: null, bonusStreak: 0, crystalsBalance: 0,
          isSynced: false,
        );

        // 3. Load unlocked skills
        final unlockedSkillList = await _db.getUnlockedSkills();
        final unlockedSkillIds = unlockedSkillList.map((s) => s.id).toSet();

        // 4. Streak calculation
        final streakResults = StreakService.calculateStreak(
          lastDepositDate: effectiveProfile.lastDepositDate,
          currentStreak: effectiveProfile.streakCount,
          maxStreak: effectiveProfile.maxStreak,
          freezeTokens: effectiveProfile.freezeTokens,
          playerClass: effectiveProfile.playerClass,
          unlockedSkillIds: unlockedSkillIds,
        );

        newStreak = streakResults['streak'] as int;
        final maxStreak = streakResults['maxStreak'] as int;
        freezeUsed = streakResults['freezeUsed'] as bool;
        final currentFreezes = streakResults['freezeTokens'] as int;

        // 5. XP calculation
        double multiplier = XpService.calculateStreakMultiplier(newStreak);
        if (activeEvent != null && activeEvent.isActive) {
          multiplier *= activeEvent.xpMultiplier;
        }

        xpGained = XpService.calculateXpGained(
          baseAmount: 100,
          multiplier: multiplier,
          playerClass: effectiveProfile.playerClass,
          hasXpBoostSkill: unlockedSkillIds.contains('magnate_xp_boost'),
        );

        // Critical Hit logic
        double baseCritChance = effectiveProfile.playerClass == 'mage' ? 0.25 : 0.10;
        if (unlockedSkillIds.contains('hacker_crit_boost')) {
          baseCritChance += 0.10;
        }
        isCritical = math.Random().nextDouble() < baseCritChance;
        bonusXp = isCritical ? xpGained : 0;

        final (level, hasLeveledUp) = LevelingService.calculateNewLevel(
          currentLevel: effectiveProfile.level,
          totalXp: effectiveProfile.xp + xpGained + bonusXp,
        );
        leveledUp = hasLeveledUp;
        finalLevel = level;

        final newSkillPoints = LevelingService.calculateSkillPoints(
          effectiveProfile.level, finalLevel, effectiveProfile.skillPoints);

        // 5a. Credits + Skill XP
        double creditsMulti = activeEvent?.isActive == true ? activeEvent!.creditsMultiplier : 1.0;
        earnedCredits = ((totalCents ~/ 1000) * creditsMulti).toInt();
        
        hackerXpInc = (context == ActionContext.cli ? 150 : 0) + (context == ActionContext.bounty ? 300 : 0);
        magnateXpInc = (totalCents >= 50000 ? 250 : (totalCents >= 10000 ? 100 : 0)) + (totalCents ~/ 500);
        resilienceXpInc = (context == ActionContext.recovery ? 200 : 0) +
                          (newStreak > 1 && newStreak % 7 == 0 ? 100 : 0) +
                          (newStreak >= 30 ? 50 : 0);

        // 5b. Squads update
        final squads = await _db.select(_db.squads).get();
        if (squads.isNotEmpty) {
          final squad = squads.first;
          await (_db.update(_db.squads)..where((t) => t.id.equals(squad.id))).write(
            SquadsCompanion(
              totalXp: drift.Value(squad.totalXp + xpGained + bonusXp),
              updatedAt: drift.Value(now),
            ),
          );
        }

        // 6. Achievements
        final unlockedList = await _db.getUnlockedAchievements();
        final unlockedIds = unlockedList.map((e) => e.id).toSet();

        // Lootbox logic
        final rnd = math.Random().nextDouble();
        if (rnd < 0.25) {
          earnedLootbox = Lootbox(
              id: const Uuid().v4(),
              rarity: rnd < 0.05 ? 'rare' : 'common',
              isOpened: false,
              earnedAt: now,
              isSynced: false);
          await _db.into(_db.lootboxes).insert(earnedLootbox!);
        }

        final allDeps = await _db.getAllDeposits();
        final goalsNow = await _db.getAllGoals();
        int totalSavedCents = goalsNow.fold(0, (sum, g) => sum + g.currentAmount);

        newlyUnlocked = await AchievementService.validateRewards(
          db: _db,
          newStreak: newStreak,
          totalSavedCents: totalSavedCents,
          depositAmountCents: totalCents,
          totalDepositsCount: allDeps.length,
          depositsToday: 1, // Simplified
          currentLevel: finalLevel,
          freezeUsed: freezeUsed,
          goalAPercent: goalAllocations['goal_a'] ?? 0.0,
          now: now,
          unlockedIds: unlockedIds,
        );

        final existingConfig = effectiveProfile.avatarConfig != null
            ? AvatarConfig.fromJson(effectiveProfile.avatarConfig!)
            : const AvatarConfig();

        final updatedConfig = existingConfig.copyWith(
          credits: existingConfig.credits + earnedCredits,
          badges: [...existingConfig.badges, ...newlyUnlocked.where((r) => r.type == RewardType.badge).map((r) => r.id)],
        );

        updatedProfile = UserProfile(
          id: effectiveProfile.id,
          xp: effectiveProfile.xp + xpGained + bonusXp,
          level: finalLevel,
          streakCount: newStreak,
          maxStreak: maxStreak,
          freezeTokens: currentFreezes + (leveledUp ? 1 : 0),
          lastDepositDate: now,
          skillPoints: newSkillPoints,
          playerClass: effectiveProfile.playerClass,
          currentTheme: effectiveProfile.currentTheme,
          avatarConfig: updatedConfig.toJson(),
          penaltyBalance: effectiveProfile.penaltyBalance,
          hackerXp: effectiveProfile.hackerXp + hackerXpInc,
          magnateXp: effectiveProfile.magnateXp + magnateXpInc,
          resilienceXp: effectiveProfile.resilienceXp + resilienceXpInc,
          lastBonusClaimDate: effectiveProfile.lastBonusClaimDate,
          bonusStreak: effectiveProfile.bonusStreak,
          crystalsBalance: effectiveProfile.crystalsBalance,
          updatedAt: now,
          isSynced: false,
        );
        await _db.insertUserProfile(updatedProfile);
      }); // end transaction

      // Check Bounty
      await _ref.read(bountyProvider.notifier).checkDeposit(amount);

      // Complete Daily Quest: deposit_any
      _ref.read(questProvider.notifier).completeQuest('deposit_any');

      state = const AsyncValue.data(null);
      return DepositResult(
        deposit: deposit,
        xpGained: xpGained,
        leveledUp: leveledUp,
        newLevel: finalLevel,
        streakCount: newStreak,
        freezeUsed: freezeUsed,
        isCritical: isCritical,
        bonusXp: bonusXp,
        earnedCredits: earnedCredits,
        earnedLootbox: earnedLootbox,
        newlyUnlockedRewards: newlyUnlocked,
        hackerXpGained: hackerXpInc,
        magnateXpGained: magnateXpInc,
        resilienceXpGained: resilienceXpInc,
      );
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  // ==========================================
  // TRANSACTION: REVERT DEPOSIT
  // ==========================================
  Future<bool> deleteDeposit(Deposit deposit) async {
    final now = DateTime.now();
    if (now.difference(deposit.createdAt).inHours >= 24) {
      return false;
    }

    state = const AsyncValue.loading();
    try {
      await _db.softDeleteDepositAndUpdateGoals(deposit.id);
      state = const AsyncValue.data(null);
      return true;
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }
}

final savingsNotifierProvider = StateNotifierProvider<SavingsNotifier, AsyncValue<void>>((ref) {
  return SavingsNotifier(ref.watch(databaseProvider), ref);
});
