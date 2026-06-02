# PROJECT AUDIT REPORT (JUNE 2026)

## 1. Executive Summary
PiggyVault is a gamified savings application with a hardcore cyberpunk aesthetic. The project has successfully reached MVP status (Phase 1) with a rich feature set including XP systems, streaks, skill trees, and AI-driven insights. However, the current architecture faces scalability bottlenecks that must be addressed before proceeding to Phase 2 (Social & Cloud).

## 2. Architecture Overview
- **UI Framework:** Flutter 3.6.2 (Material 3)
- **State Management:** Riverpod
- **Database:** Drift (SQLite) for relational data, Hive for key-value settings.
- **Navigation:** GoRouter
- **AI Integration:** OpenRouter (DeepSeek)
- **Localization:** In-memory Map in `lib/core/providers/l10n.dart` (UA/EN)

## 3. Technical Debt & Bottlenecks

### 3.1 The "God Object" (SavingsNotifier)
`lib/core/providers/savings_notifier.dart` manages:
- Database transactions
- XP & Level calculations
- Streak logic
- Lootbox drop rates
- Achievement validation
**Risk:** High complexity, difficult to unit test, fragile during modifications.

### 3.2 The N-Goals Scalability Issue
The `Deposits` table in `lib/data/database.dart` has hardcoded columns `goalAAmount` and `goalBAmount`.
**Impact:** Blocks users from having more than two active goals. Requires a many-to-many refactoring with a `DepositAllocations` table.

### 3.3 Data Fragmentation
Mixed use of Drift and Hive for persistent state (e.g., Weekly Challenges in Hive vs. Deposits in Drift).
**Risk:** Lack of transactional atomicity across different storage engines.

### 3.4 Sync & Scalability Concerns
- `UserProfiles` uses a hardcoded ID (1) instead of UUID.
- Lack of `updated_at` and `is_synced` flags in Drift tables.
- Pervasive use of hardcoded colors (`Color(0x...)`) instead of the centralized `AppColors` system.

## 4. Quality Assessment
- **Linter:** 11 active warnings (async gaps, unused variables).
- **Testing:** Minimal coverage (~1 widget test). Critical domain logic (XP, Streaks) is untested.
- **AI Stability:** Prompting relies on string interpolation and "Respond ONLY with JSON" instructions, which can be unstable.

## 5. Strategic Recommendations

### Immediate Actions (Technical Cleanup)
1. **Decompose SavingsNotifier:** Move logic to dedicated domain services (`XpService`, `StreakService`, `AchievementService`).
2. **Database Migration:** Implement `DepositAllocations` to support dynamic N-goals.
3. **Design System Enforcement:** Replace all hardcoded hex colors with `AppColors` references.

### Phase 2 Readiness
1. **UUID Transition:** Migrate primary keys to UUID to avoid collisions during Cloud Sync.
2. **Sync Layer:** Implement `updated_at` tracking and a dedicated `SyncService`.
3. **Firebase Integration:** Introduce Firebase Auth and Cloud Firestore for Social features (Squads).
