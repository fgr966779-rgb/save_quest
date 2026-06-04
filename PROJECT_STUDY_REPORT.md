# Project Audit & Analysis Report: PiggyVault (June 2026)

## 1. Executive Summary
PiggyVault has evolved into a feature-rich "Hardcore Cyberpunk" savings app. While the UI and gamification depth are impressive, the underlying architecture has reached a "scaling wall." The primary blocker for Phase 2 (Social & Cloud) is the pervasive hardcoding of a two-goal system ("N-Goals" issue).

## 2. Architectural Analysis

### 2.1 The "N-Goals" Scaling Wall (Critical Blocker 🚨)
The system is architecturally locked to exactly two goals. This logic is hardcoded at every layer:
*   **Database:** `Deposits` table has `goalAAmount` and `goalBAmount` columns.
*   **Data Access:** `AppDatabase` methods like `saveDepositAndUpdateGoals` explicitly update `goal_a` and `goal_b` by ID.
*   **State Management:** `SavingsNotifier` math is hardcoded to `goalAPercent`.
*   **UI:** `AnalyticsScreen`, `HistoryScreen`, and `DepositScreen` are designed around two specific progress rings and comparison cards.
*   **Backup:** `BackupService` CSV export logic is hardcoded to fetch and name exactly two goals.

### 2.2 God Object: `SavingsNotifier` (High Complexity ⚠️)
The `createDeposit` method (~250 lines) has too many responsibilities:
1.  Database transaction coordination.
2.  XP calculation & Level-up logic.
3.  Streak management.
4.  Critical hit RNG.
5.  Lootbox drop logic.
6.  Achievement/Badge validation.
7.  Provider-based bounty/quest completion triggers.
*Impact:* High risk of bugs during modification and extreme difficulty for unit testing.

### 2.3 Fragmented Gamification State (Consistency Risk ⚠️)
User progress and rewards are scattered across multiple storage systems:
*   **Drift (Relational):** `UnlockedAchievements`, `Lootboxes`, `UnlockedSkills`.
*   **Hive (Key-Value):** `milestones_box`, `weekly_challenges_box`.
*   **JSON in Drift:** `UserProfile.avatarConfig` (stores badges and credits).
*   **Ephemeral:** `DailyBonusProvider`.
*Impact:* Potential atomicity issues. A transaction might succeed in Drift but fail in Hive, leading to desynced state.

## 3. Technical Debt & Redundancies

### 3.1 Code Duplication
*   **Onboarding:** `GoalASetupScreen` and `GoalBSetupScreen` are ~90% identical. They should be a single generic component.
*   **Services:** `AchievementService` and `DailyBonusProvider` have overlapping logic for streak-based rewards.

### 3.2 Backup Service
*   Manual JSON serialization in `BackupService` for every table makes the backup system fragile. Adding a new table requires manual updates in 4-5 places within the service.

### 3.3 AI Integration
*   `OpenRouterService` relies on text-based prompts and basic string parsing. It lacks structured output validation (JsonSchema), which may cause UI crashes if the LLM returns malformed responses.

## 4. Code Health Audit (Linter Results)
The project is currently stable with 11 non-breaking issues:
*   **Async Gaps:** `use_build_context_synchronously` in `DashboardScreen` and `SettingsScreen`.
*   **Unused Variables:** Found in `GoalDetailScreen`, `PriceAnalysisScreen`, and `DailyBonusProvider`.
*   **Unused Private Methods:** Found in `PetsScreen`.

## 5. Recommended Roadmap for Phase 2

### Priority 1: N-Goals Refactoring
1.  **DB Migration:** Move to `DepositAllocations` table (DepositID, GoalID, Amount).
2.  **Logic Update:** Refactor `SavingsNotifier` to iterate over an allocation map rather than hardcoded variables.
3.  **UI:** Update `DepositScreen` and `Dashboard` to support N goals via horizontal scroll or lists.

### Priority 2: Service Decomposition
1.  Extract `XpDomainService`, `StreakDomainService`, and `RewardDomainService`.
2.  Refactor `SavingsNotifier` to be a pure "Orchestrator" of these services.

### Priority 3: Sync Preparation
1.  Add `updated_at` and `deleted_at` (Soft Delete) to all tables.
2.  Replace any remaining `Int` primary keys with `UUID` (e.g., `UserProfiles`).

### Priority 4: Gamification Consolidation
1.  Move all reward-related data (Badges, Achievements, Milestones) into a unified Drift-backed `Rewards` system.

---
*Report generated: June 2026*
