# Inventory of Technical Debt: PiggyVault

This document provides a granular inventory of technical debt and architectural bottlenecks identified during the July 2026 audit.

## 1. Hardcoded Goal Logic (N-Goals)
The application is currently hardcoded to support exactly two goals (`goal_a` and `goal_b`).

### Database (`lib/data/database.dart`)
- **Table `Deposits`**: Contains explicit columns `goalAAmount` and `goalBAmount`.
- **Method `saveDepositAndUpdateGoals`**: Hardcoded to update only `goal_a` and `goal_b`.
- **Method `softDeleteDepositAndUpdateGoals`**: Hardcoded revert logic for `goal_a` and `goal_b`.
- **Schema Version**: 8. Needs migration to version 9 with a `DepositAllocations` table.

### Logic & Services
- **`SavingsNotifier` (`lib/core/providers/savings_notifier.dart`)**:
    - Calculates `goalACents` and `goalBCents` using a single `goalAPercent` parameter.
    - Explicitly fetches `goal_a` and `goal_b` from the database.
- **`AchievementService` (`lib/core/services/gamification/achievement_service.dart`)**:
    - Hardcoded IDs check: `halfway_ps5`, `halfway_monitor`, `ps5_acquired`, `monitor_acquired`.
    - Explicit calls to `db.getGoalById('goal_a')` and `db.getGoalById('goal_b')`.

### UI Components
- **`SplitSlider` (`lib/core/widgets/split_slider.dart`)**: Hardcoded for two-way distribution.
- **`DualProgressRing` (`lib/core/widgets/dual_progress_ring.dart`)**: Hardcoded to display two goals.
- **Onboarding**: Duplicate screens `GoalASetupScreen` and `GoalBSetupScreen`.

---

## 2. God Object: SavingsNotifier
The `SavingsNotifier` in `lib/core/providers/savings_notifier.dart` violates the Single Responsibility Principle.

- **Responsibility Overload**: Handles DB transactions, XP calculation, Streak logic, Critical Hit logic, Lootbox drops, Achievement validation, and Squad updates.
- **Complexity**: The `createDeposit` method is a 200+ line transaction block that is difficult to test in isolation.
- **Dependency**: Directly depends on almost all services in the `core/services/gamification` directory.

---

## 3. Fragile AI Parsing
- **`OpenRouterService` & `PriceAnalysisService`**:
    - Use manual regex/string manipulation (`_extractJson`) to find JSON blocks in AI responses.
    - Lack of robust schema validation for AI-generated data.
    - Risk of failure if the AI model adds conversational noise or changes the output format.

---

## 4. State Management & Data Flow
- **`SettingsService`**: Mixes persistent preferences (locale, theme) with sensitive data (API keys) and volatile game state.
- **L10n**: `lib/core/providers/l10n.dart` uses a manual Map instead of standard Flutter `.arb` files, making localization scaling difficult.
- **Sync Readiness**:
    - `UserProfiles` uses a hardcoded `id: 1`.
    - Most tables lack `updatedAt` and `isSynced` flags.

---

## 5. UI/UX Consistency
- **Duplicate Onboarding Logic**: High code duplication between goal setup screens.
- **Theme Hardcoding**: Occasional use of hex colors in components instead of `AppColors` constants.
- **Linter Warnings**: 11 issues remaining, mostly unused variables and async context usage.
