import 'package:flutter_test/flutter_test.dart';
import 'package:piggyvault/core/services/gamification/xp_service.dart';
import 'package:piggyvault/core/services/gamification/leveling_service.dart';
import 'package:piggyvault/core/services/gamification/streak_service.dart';

void main() {
  group('XpService Tests', () {
    test('XP required for level 1 should be 500', () {
      expect(XpService.xpRequiredForLevel(1), 500);
    });

    test('Streak multiplier calculation', () {
      expect(XpService.calculateStreakMultiplier(1), 1.0);
      expect(XpService.calculateStreakMultiplier(7), 1.25);
      expect(XpService.calculateStreakMultiplier(14), 1.5);
      expect(XpService.calculateStreakMultiplier(30), 2.0);
    });

    test('XP gained calculation with warrior bonus', () {
      final xp = XpService.calculateXpGained(
        baseAmount: 100,
        multiplier: 1.0,
        playerClass: 'warrior',
      );
      expect(xp, 115); // 100 * (1.0 + 0.15)
    });
  });

  group('LevelingService Tests', () {
    test('Level up logic', () {
      final (level, leveledUp) = LevelingService.calculateNewLevel(
        currentLevel: 1,
        totalXp: 600,
      );
      expect(level, 2);
      expect(leveledUp, true);
    });

    test('No level up if XP is insufficient', () {
      final (level, leveledUp) = LevelingService.calculateNewLevel(
        currentLevel: 1,
        totalXp: 400,
      );
      expect(level, 1);
      expect(leveledUp, false);
    });
  });

  group('StreakService Tests', () {
    test('New streak starting from null last date', () {
      final results = StreakService.calculateStreak(
        lastDepositDate: null,
        currentStreak: 0,
        maxStreak: 0,
        freezeTokens: 0,
      );
      expect(results['streak'], 1);
    });

    test('Streak increases on consecutive day', () {
      final yesterday = DateTime.now().subtract(const Duration(days: 1));
      final results = StreakService.calculateStreak(
        lastDepositDate: yesterday,
        currentStreak: 5,
        maxStreak: 5,
        freezeTokens: 0,
      );
      expect(results['streak'], 6);
    });

    test('Freeze token protects streak', () {
      final twoDaysAgo = DateTime.now().subtract(const Duration(days: 2));
      final results = StreakService.calculateStreak(
        lastDepositDate: twoDaysAgo,
        currentStreak: 10,
        maxStreak: 10,
        freezeTokens: 1,
      );
      expect(results['streak'], 10);
      expect(results['freezeUsed'], true);
      expect(results['freezeTokens'], 0);
    });
  });
}
