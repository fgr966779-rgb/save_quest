# Deep Project Analysis Report - PiggyVault (June 2026)

## 1. Executive Summary
PiggyVault is a feature-rich, gamified savings application. While the functional scope is impressive (AI, Remote Control, Skill Trees, Pets), the core architecture suffers from "MVP debt"—specifically hardcoded limitations and monolithic logic blocks that prevent scaling to a production-grade multi-goal or social application.

## 2. Technical Stack Audit
*   **Framework:** Flutter 3.6.2 (Stable).
*   **State Management:** Riverpod (using a mix of `StateNotifier` and `StreamProvider`). Highly reactive but logic is becoming centralized in "God Notifiers".
*   **Database:** Drift (SQLite) for relational data. Hive for key-value settings.
    *   *Risk:* Mixed storage strategies without a unified transaction layer.
*   **AI:** OpenRouter integration for financial coaching. Reliance on regex/string parsing for JSON responses.
*   **Navigation:** GoRouter. Well-structured.

## 3. Critical Bottlenecks

### 3.1 The "N-Goals" Hardcoding (Highest Priority)
The application is strictly limited to two goals: `goal_a` and `goal_b`.
*   **Database Level:** `Deposits` table (`lib/data/database.dart`) has columns `goalAAmount` and `goalBAmount`.
*   **Logic Level:** `SavingsNotifier` (`lib/core/providers/savings_notifier.dart`) and `AppDatabase` use hardcoded logic for these two IDs.
    *   Example: `AppDatabase.saveDepositAndUpdateGoals` specifically fetches `goal_a` and `goal_b`.
*   **UI Level:**
    *   `DashboardScreen` (`lib/features/dashboard/screens/dashboard_screen.dart`) expects exactly two goals for its `DualProgressRing`.
    *   `DepositScreen` (`lib/features/deposit/screens/deposit_screen.dart`) uses a `SplitSlider` which only supports a binary split.
    *   `Onboarding` flow consists of two separate screens for Goal A and Goal B.
*   **Impact:** Cannot add a 3rd goal. Cannot support dynamic "Squad" goals where multiple people contribute to one of many potential targets.

### 3.2 Monolithic Notifiers (SavingsNotifier)
`SavingsNotifier.createDeposit` is a ~250 line function (lines 75-307).
*   It handles: DB Transactions, XP math, Streak logic, Crit hit rolls, Lootbox drops, Achievement checks, and Squad updates.
*   **Impact:** Extremely high risk of regressions. Hard to unit test specific logic (e.g., "Is the XP multiplier correct?") without mocking the entire database and state.

### 3.3 Data Consistency & Atomicity
*   `WeeklyChallengeService`, `BountyProvider`, and `QuestProvider` are updated *after* the database transaction in `SavingsNotifier` (lines 282-286).
*   If the app crashes or the network fails between the DB commit and the service update, the user "saves money" but gets no rewards/progress.
*   *Solution:* These should ideally be part of a post-commit hook or managed via an Event Bus that ensures retry-ability.

### 3.4 Feature Fragmentation (Gamification)
*   **XP math** is in `XpService`, but **Crit hit logic** and **Lootbox drop rates** are hardcoded in the `SavingsNotifier` deposit method.
*   **Pets** leveling uses a separate calculation heuristic in `pets_screen.dart` compared to player XP.
*   **Squads** and **JointGoals** have their own providers but are largely disconnected from the primary `SavingsNotifier` transaction.

## 4. Code Quality & Technical Debt
*   **Linter:** 11 issues found (3 `use_build_context_synchronously`, 8 unused variables/elements).
*   **Localization:** Large hardcoded map in `l10n.dart`. Not using standard `.arb` files.
*   **ID Strategy:** `UserProfiles` table uses a hardcoded `id: 1`. This blocks multi-account support and complex Cloud Sync.
*   **Duplication:** `Achievements` and `Badges` are handled similarly but stored/managed via separate paths.

## 5. Phase 2 Recommendations

### Phase 2.1: Foundations
1.  **Database Migration:** Move to a dynamic allocation model (`DepositAllocations` table).
2.  **Logic Decoupling:** Move XP, Streak, and Reward logic into pure Domain Services with 100% test coverage.
3.  **Linter Cleanup:** Resolve all 11 warnings to ensure environment stability.

### Phase 2.2: Scaling
1.  **UUID Transition:** Ensure all tables use UUIDs for primary keys to support future Firebase/Supabase sync.
2.  **Unified Reward System:** Merge Badges and Achievements into a single `Reward` entity.
3.  **Standardized L10n:** Move to `.arb` files for better translation management.

---
*Created by Jules, AI Engineer*
