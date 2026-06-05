import 'package:drift/drift.dart';
import 'connection/connection.dart';

part 'database.g.dart';

typedef Lootbox = Lootboxe;

/// All monetary columns store values in MINOR UNITS (kopecks / cents).
/// 1 UAH = 100 kopecks. Use money_utils.dart for conversion.
class Goals extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  /// Target amount in minor units (kopecks).
  IntColumn get targetAmount => integer()();
  /// Current accumulated amount in minor units (kopecks).
  IntColumn get currentAmount => integer()();
  TextColumn get currency => text()();
  TextColumn get accentColor => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Deposits extends Table {
  TextColumn get id => text()();
  /// Total deposit amount in minor units (kopecks).
  IntColumn get amount => integer()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class DepositAllocations extends Table {
  TextColumn get id => text()();
  TextColumn get depositId => text().references(Deposits, #id)();
  TextColumn get goalId => text().references(Goals, #id)();
  IntColumn get amount => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class UserProfiles extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  IntColumn get xp => integer().withDefault(const Constant(0))();
  IntColumn get level => integer().withDefault(const Constant(1))();
  IntColumn get streakCount => integer().withDefault(const Constant(0))();
  IntColumn get maxStreak => integer().withDefault(const Constant(0))();
  IntColumn get freezeTokens => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastDepositDate => dateTime().nullable()();
  IntColumn get skillPoints => integer().withDefault(const Constant(0))();
  TextColumn get playerClass => text().nullable()();
  TextColumn get currentTheme => text().withDefault(const Constant('default'))();
  TextColumn get avatarConfig => text().nullable()();
  IntColumn get penaltyBalance => integer().withDefault(const Constant(0))();
  IntColumn get hackerXp => integer().withDefault(const Constant(0))();
  IntColumn get magnateXp => integer().withDefault(const Constant(0))();
  IntColumn get resilienceXp => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastBonusClaimDate => dateTime().nullable()();
  IntColumn get bonusStreak => integer().withDefault(const Constant(0))();
  IntColumn get crystalsBalance => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

class UnlockedAchievements extends Table {
  TextColumn get id => text()();
  DateTimeColumn get unlockedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class UnlockedSkills extends Table {
  TextColumn get id => text()();
  DateTimeColumn get unlockedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Lootboxes extends Table {
  TextColumn get id => text()();
  TextColumn get rarity => text()();
  BoolColumn get isOpened => boolean().withDefault(const Constant(false))();
  DateTimeColumn get earnedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Pets extends Table {
  TextColumn get id => text()();
  TextColumn get petType => text()();
  IntColumn get happinessLevel => integer().withDefault(const Constant(100))();
  DateTimeColumn get lastFedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Squads extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get totalXp => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

class SideQuests extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get expiresAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class TransactionTags extends Table {
  TextColumn get id => text()();
  TextColumn get depositId => text()();
  TextColumn get tag => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class VoiceLogs extends Table {
  TextColumn get id => text()();
  TextColumn get depositId => text()();
  TextColumn get filePath => text()();
  DateTimeColumn get recordedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class PenaltyHabits extends Table {
  TextColumn get id => text()();
  TextColumn get habitName => text()();
  IntColumn get penaltyAmount => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class JointGoals extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get targetAmount => integer()(); // minor units
  IntColumn get currentAmount => integer().withDefault(const Constant(0))();
  DateTimeColumn get deadline => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class JointGoalMembers extends Table {
  TextColumn get id => text()();
  TextColumn get goalId => text()();
  TextColumn get memberName => text()();
  IntColumn get contributedAmount => integer().withDefault(const Constant(0))();
  IntColumn get avatarIndex => integer().withDefault(const Constant(0))();
  BoolColumn get isCurrentUser => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class AvoidedPurchases extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get amount => integer()(); // minor units
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [
  Goals, 
  Deposits,
  DepositAllocations,
  UserProfiles, 
  UnlockedAchievements,
  UnlockedSkills,
  Lootboxes,
  Pets,
  Squads,
  SideQuests,
  TransactionTags,
  VoiceLogs,
  PenaltyHabits,
  JointGoals,
  JointGoalMembers,
  AvoidedPurchases
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  AppDatabase.connect(super.connection);

  @override
  int get schemaVersion => 9;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            // Migrate goals: real → integer (kopecks)
            // SQLite does not support ALTER COLUMN, so we recreate the table.
            await customStatement('''
              CREATE TABLE goals_new (
                id TEXT NOT NULL PRIMARY KEY,
                name TEXT NOT NULL,
                target_amount INTEGER NOT NULL,
                current_amount INTEGER NOT NULL,
                currency TEXT NOT NULL,
                accent_color TEXT NOT NULL,
                created_at INTEGER NOT NULL
              )
            ''');
            await customStatement('''
              INSERT INTO goals_new
                SELECT id, name,
                  CAST(ROUND(target_amount * 100) AS INTEGER),
                  CAST(ROUND(current_amount * 100) AS INTEGER),
                  currency, accent_color,
                  created_at
                FROM goals
            ''');
            await customStatement('DROP TABLE goals');
            await customStatement('ALTER TABLE goals_new RENAME TO goals');

            // Migrate deposits: real → integer (kopecks)
            await customStatement('''
              CREATE TABLE deposits_new (
                id TEXT NOT NULL PRIMARY KEY,
                amount INTEGER NOT NULL,
                goal_a_amount INTEGER NOT NULL,
                goal_b_amount INTEGER NOT NULL,
                note TEXT,
                created_at INTEGER NOT NULL,
                is_deleted INTEGER NOT NULL DEFAULT 0
                  CHECK (is_deleted IN (0, 1))
              )
            ''');
            await customStatement('''
              INSERT INTO deposits_new
                SELECT id,
                  CAST(ROUND(amount * 100) AS INTEGER),
                  CAST(ROUND(goal_a_amount * 100) AS INTEGER),
                  CAST(ROUND(goal_b_amount * 100) AS INTEGER),
                  note, created_at, is_deleted
                FROM deposits
            ''');
            await customStatement('DROP TABLE deposits');
            await customStatement('ALTER TABLE deposits_new RENAME TO deposits');
          }
          if (from < 3) {
            await m.addColumn(userProfiles, userProfiles.skillPoints);
            await m.addColumn(userProfiles, userProfiles.playerClass);
            await m.addColumn(userProfiles, userProfiles.currentTheme);
            await m.addColumn(userProfiles, userProfiles.avatarConfig);
            await m.addColumn(userProfiles, userProfiles.penaltyBalance);

            await m.createTable(lootboxes);
            await m.createTable(pets);
            await m.createTable(squads);
            await m.createTable(sideQuests);
            await m.createTable(transactionTags);
            await m.createTable(voiceLogs);
            await m.createTable(penaltyHabits);
          }
          if (from < 4) {
            await m.createTable(unlockedSkills);
          }
          if (from < 5) {
            await m.addColumn(userProfiles, userProfiles.hackerXp);
            await m.addColumn(userProfiles, userProfiles.magnateXp);
            await m.addColumn(userProfiles, userProfiles.resilienceXp);
          }
          if (from < 6) {
            await m.addColumn(userProfiles, userProfiles.lastBonusClaimDate);
            await m.addColumn(userProfiles, userProfiles.bonusStreak);
            await m.addColumn(userProfiles, userProfiles.crystalsBalance);
          }
          if (from < 7) {
            await m.createTable(jointGoals);
            await m.createTable(jointGoalMembers);
          }
          if (from < 8) {
            await m.createTable(avoidedPurchases);
          }
          if (from < 9) {
            // Create the new allocations table
            await m.createTable(depositAllocations);

            // Migrate data from deposits to deposit_allocations
            // Since we're removing columns from deposits, we need the "recreate and copy" strategy again.
            // 1. Insert into deposit_allocations for goal_a
            await customStatement('''
              INSERT INTO deposit_allocations (id, deposit_id, goal_id, amount)
              SELECT id || '_a', id, 'goal_a', goal_a_amount
              FROM deposits WHERE goal_a_amount > 0
            ''');

            // 2. Insert into deposit_allocations for goal_b
            await customStatement('''
              INSERT INTO deposit_allocations (id, deposit_id, goal_id, amount)
              SELECT id || '_b', id, 'goal_b', goal_b_amount
              FROM deposits WHERE goal_b_amount > 0
            ''');

            // 3. Recreate deposits table without goal_a_amount and goal_b_amount
            await customStatement('''
              CREATE TABLE deposits_new (
                id TEXT NOT NULL PRIMARY KEY,
                amount INTEGER NOT NULL,
                note TEXT,
                created_at INTEGER NOT NULL,
                is_deleted INTEGER NOT NULL DEFAULT 0
                  CHECK (is_deleted IN (0, 1))
              )
            ''');

            await customStatement('''
              INSERT INTO deposits_new (id, amount, note, created_at, is_deleted)
              SELECT id, amount, note, created_at, is_deleted
              FROM deposits
            ''');

            await customStatement('DROP TABLE deposits');
            await customStatement('ALTER TABLE deposits_new RENAME TO deposits');
          }
        },
      );

  // ==========================================
  // GOAL QUERIES
  // ==========================================
  Stream<List<Goal>> watchAllGoals() => select(goals).watch();
  Future<List<Goal>> getAllGoals() => select(goals).get();
  Future<Goal?> getGoalById(String id) => (select(goals)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  Future<int> insertGoal(Goal goal) => into(goals).insert(goal, mode: InsertMode.insertOrReplace);
  Future<bool> updateGoal(Goal goal) => update(goals).replace(goal);

  // ==========================================
  // DEPOSIT QUERIES
  // ==========================================
  Stream<List<Deposit>> watchAllDeposits() => 
      (select(deposits)..where((tbl) => tbl.isDeleted.equals(false))..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).watch();
  
  Future<List<Deposit>> getAllDeposits() => 
      (select(deposits)..where((tbl) => tbl.isDeleted.equals(false))..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();

  Future<int> insertDeposit(Deposit deposit) => into(deposits).insert(deposit);
  Future<int> insertAllocation(DepositAllocation allocation) => into(depositAllocations).insert(allocation);

  Future<List<DepositAllocation>> getAllocationsForDeposit(String depositId) =>
      (select(depositAllocations)..where((tbl) => tbl.depositId.equals(depositId))).get();

  // Update a deposit and adjust Goal amounts (within transactions)
  Future<void> saveDepositAndUpdateGoals({
    required Deposit deposit,
    required Map<String, int> allocations,
  }) async {
    await transaction(() async {
      // 1. Insert the deposit
      await insertDeposit(deposit);

      // 2. Insert allocations and update each goal
      for (final entry in allocations.entries) {
        final goalId = entry.key;
        final amount = entry.value;

        // Create allocation record
        await insertAllocation(DepositAllocation(
          id: '${deposit.id}_$goalId',
          depositId: deposit.id,
          goalId: goalId,
          amount: amount,
        ));

        // Update goal balance
        final goal = await getGoalById(goalId);
        if (goal != null) {
          await updateGoal(goal.copyWith(
            currentAmount: goal.currentAmount + amount,
          ));
        }
      }
    });
  }

  // Delete a deposit (soft delete) and revert Goal amounts
  Future<void> softDeleteDepositAndUpdateGoals({
    required String depositId,
  }) async {
    await transaction(() async {
      // 1. Mark deposit as deleted
      await (update(deposits)..where((tbl) => tbl.id.equals(depositId))).write(
        const DepositsCompanion(isDeleted: Value(true)),
      );

      // 2. Load allocations to revert goal balances
      final allocations = await getAllocationsForDeposit(depositId);
      for (final allocation in allocations) {
        final goal = await getGoalById(allocation.goalId);
        if (goal != null) {
          await updateGoal(goal.copyWith(
            currentAmount: (goal.currentAmount - allocation.amount).clamp(0, 999999999),
          ));
        }
      }
    });
  }

  // ==========================================
  // USER PROFILE & STREAK QUERIES
  // ==========================================
  Future<UserProfile?> getUserProfile() => (select(userProfiles)..where((tbl) => tbl.id.equals(1))).getSingleOrNull();
  Stream<UserProfile?> watchUserProfile() => (select(userProfiles)..where((tbl) => tbl.id.equals(1))).watchSingleOrNull();
  Future<int> insertUserProfile(UserProfile profile) => into(userProfiles).insert(profile, mode: InsertMode.insertOrReplace);
  Future<bool> updateUserProfile(UserProfile profile) => update(userProfiles).replace(profile);

  // ==========================================
  // ACHIEVEMENTS QUERIES
  // ==========================================
  Future<List<UnlockedAchievement>> getUnlockedAchievements() => select(unlockedAchievements).get();
  Stream<List<UnlockedAchievement>> watchUnlockedAchievements() => select(unlockedAchievements).watch();
  Future<int> unlockAchievement(String id) => into(unlockedAchievements).insert(
    UnlockedAchievement(id: id, unlockedAt: DateTime.now()),
    mode: InsertMode.insertOrReplace,
  );

  // ==========================================
  // SKILL TREE QUERIES
  // ==========================================
  Future<List<UnlockedSkill>> getUnlockedSkills() => select(unlockedSkills).get();
  Stream<List<UnlockedSkill>> watchUnlockedSkills() => select(unlockedSkills).watch();
  Future<bool> isSkillUnlocked(String id) async {
    final result = await (select(unlockedSkills)..where((t) => t.id.equals(id))).getSingleOrNull();
    return result != null;
  }
  Future<int> unlockSkill(String id) => into(unlockedSkills).insert(
    UnlockedSkill(id: id, unlockedAt: DateTime.now()),
    mode: InsertMode.insertOrReplace,
  );
}

