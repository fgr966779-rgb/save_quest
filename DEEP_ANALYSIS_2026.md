# Deep Project Analysis: PiggyVault (June 2026)

## 1. Architectural Overview
The project follows a modular structure with a clear separation of concerns (Core, Data, Features).
- **State Management:** Riverpod (with code generation).
- **Persistence:**
    - **Drift (SQLite):** Main relational storage for Goals, Deposits, and Profiles.
    - **Hive:** Key-value storage for Settings, Notifications, and ephemeral gamification state.
- **UI/UX:** High-fidelity "Cyberpunk" aesthetic using custom painters and heavy haptics.

## 2. Identified Critical Issues (Technical Debt)

### 2.1 The "N-Goals" Bottleneck (High Priority)
The application is currently hardcoded to support exactly two goals: `goal_a` and `goal_b`.
- **Database:** `Deposits` table has explicit `goalAAmount` and `goalBAmount` columns.
- **Logic:** `SavingsNotifier` and `AchievementService` hardcode these IDs.
- **UI:** Multiple screens (Dashboard, Analytics, Onboarding) are duplicated or hard-wired for two goals.
- **Impact:** Prevents users from adding a 3rd goal and makes the code difficult to maintain.

### 2.2 "God Object" - SavingsNotifier
`lib/core/providers/savings_notifier.dart` manages transaction logic, XP calculation, streak processing, achievement validation, and lootbox drops in a single 250-line method.
- **Risk:** High complexity leads to bugs in financial logic. Failure in gamification logic can rollback financial transactions.
- **Recommendation:** Delegate responsibilities to dedicated Domain Services (`XpService`, `StreakService`, `RewardService`).

### 2.3 Data Fragmentation & Sync Risks
- **ID Strategy:** Using `Int` primary keys (e.g., in `UserProfiles`) instead of `UUID` creates conflicts for future cloud synchronization.
- **Missing Metadata:** Tables lack `updatedAt` timestamps, making "Last Write Wins" sync impossible.
- **Storage Splitting:** Rewards are split between Drift and Hive, making atomicity difficult during updates.

### 2.4 Code Duplication
- **Onboarding:** `goal_a_setup_screen.dart` and `goal_b_setup_screen.dart` are nearly identical.
- **UI Logic:** Goal progress calculation is duplicated in several widgets instead of being a shared utility or model method.

## 3. Recommended Refactoring Strategy

1.  **Database Migration (N-Goals):**
    - Introduce `DepositAllocations` table (Many-to-One with Deposits).
    - Remove hardcoded amount columns from `Deposits`.
2.  **Logic Decoupling:**
    - Refactor `SavingsNotifier` to use a strategy pattern or dedicated services for gamification side-effects.
3.  **UI Unification:**
    - Create a universal `GoalCard` and `GoalSetupScreen` that work with any number of goals.
4.  **Sync Readiness:**
    - Migrate all tables to UUID.
    - Add `updatedAt` triggers or manual columns.

---
*Analysis prepared by Jules (AI Senior Engineer)*
