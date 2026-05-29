# Project Health Analysis: PiggyVault (Phase 1 Review)

## 1. Executive Summary
The project has successfully reached Phase 1 completion with a functional MVP including savings tracking, gamification (XP/Streaks/Skills), and a strong Cyberpunk UI. However, significant technical debt exists regarding the hardcoded two-goal system and the monolithic nature of the core state management.

---

## 2. Core Architecture Issues

### 2.1 The "Two-Goal" Bottleneck (Critical)
The application is currently hardcoded to support exactly two goals ("Goal A" and "Goal B"). This is deeply embedded across all layers:
*   **Data Layer:** `Deposits` table in `database.dart` has explicit `goalAAmount` and `goalBAmount` columns.
*   **Provider Layer:** `SavingsNotifier` contains logic to split totals specifically into two variables.
*   **UI Layer:** `DualProgressRing`, `SplitSlider`, and dashboard widgets are hard-wired for a binary split.
*   **Onboarding:** Separate screens (`goal_a_setup_screen.dart` and `goal_b_setup_screen.dart`) exist instead of a dynamic list-based setup.

**Impact:** Users cannot add a 3rd goal without a full database migration and extensive code refactoring.

### 2.2 SavingsNotifier "God Object"
The `SavingsNotifier.createDeposit` method is a ~250-line "Megafunction" that coordinates:
1.  Minor unit conversion (cents/kopecks).
2.  Drift database transactions.
3.  XP calculation and Level-up loops.
4.  Streak management logic.
5.  Critical hit/Bonus XP rolls.
6.  Lootbox drop chance logic.
7.  Achievement validation.
8.  Squad XP updates.
9.  AI Bounty check triggers.

**Impact:** Low maintainability, high risk of regressions, and extreme difficulty in writing isolated unit tests.

### 2.3 Fragmented Gamification State
Reward data is currently scattered across three different persistence systems:
1.  **Drift:** `UnlockedAchievements` and `UnlockedSkills` tables.
2.  **UserProfile JSON:** Badges are stored as a list of strings inside a JSON blob in the `UserProfiles` table.
3.  **Hive:** Milestones (25%, 50% celebrations) are stored in a separate `milestones_box`.

**Impact:** Inconsistent state management and potential for data desync.

---

## 3. Code Quality & Technical Debt

### 3.1 Static Analysis & Linting
Current `flutter analyze` report shows **11 issues**:
*   **Warnings:** 8 unused local variables, elements, or parameters (e.g., `brightness` in detail screens, `tokensToConsume` in providers).
*   **Infos:** 3 instances of `use_build_context_synchronously` violations in `dashboard_screen.dart` and `settings_screen.dart`.

### 3.2 Testing Coverage (Severely Lacking)
*   **Current State:** Only 1 test exists (`widget_test.dart`), which is a basic compilation smoke test.
*   **Missing:** No unit tests for `XpService`, `StreakService`, `AchievementService`, or the core `createDeposit` logic.

### 3.3 UI Technical Debt
*   **Hardcoded Colors:** Occurrences of `Color(0x...)` found in `terminal_screen.dart` and `neon_avatar_painter.dart` instead of using `AppColors`.
*   **Component Rigidity:** `DualProgressRing` and `SplitSlider` are non-reusable for N-goals.

---

## 4. Prioritized Roadmap for Phase 2

### High Priority (Structural)
1.  **N-Goals Database Refactor:**
    - Introduce `DepositAllocations` join table.
    - Migrate `Deposits` table (Schema v9) to remove `goal_a`/`goal_b` columns.
2.  **Decouple SavingsNotifier:**
    - Extract XP and Level-up logic to a dedicated `DomainService`.
    - Extract Lootbox/Reward logic to a `RewardCoordinator`.
3.  **Unify Rewards System:**
    - Move all Achievements, Badges, and Milestones into a single `UnlockedRewards` Drift table.

### Medium Priority (Quality)
4.  **Implement Unit Test Suite:** Target 80% coverage for domain services.
5.  **Standardize Onboarding:** Replace goal-specific screens with a dynamic multi-goal onboarding flow.
6.  **Lint Cleanup:** Resolve all 11 current analysis warnings.

### Low Priority (Feature Prep)
7.  **Cloud Sync Readiness:** Ensure all tables use UUIDs and have `updated_at` timestamps.
8.  **Centralize Styling:** Move remaining hardcoded terminal/avatar colors to `AppColors`.

---
*Report Generated: June 2026*
