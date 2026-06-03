# Refactoring Strategy: N-Goals & Architecture Decoupling

This roadmap outlines the steps required to move from the current hardcoded two-goal system to a dynamic, scalable architecture.

## Phase 1: Database Migration (Structural Changes)
1.  **Introduce `DepositAllocations` Table:**
    - `id`: Text (UUID) - Primary Key.
    - `depositId`: Text - Foreign Key to `Deposits`.
    - `goalId`: Text - Foreign Key to `Goals`.
    - `amount`: Int - Amount allocated to this specific goal.
2.  **Update `Deposits` Table:**
    - Mark `goalAAmount` and `goalBAmount` as deprecated.
    - Add `totalAmount` column (already exists as `amount`).
3.  **Data Migration Script:**
    - Create a Drift migration to move data from `goalAAmount`/`goalBAmount` columns into the new `DepositAllocations` table.

## Phase 2: Logic Decoupling (The "God Object" Diet)
1.  **Extract `RewardService`:**
    - Move logic from `SavingsNotifier.createDeposit` that handles achievements and lootboxes into a dedicated service.
2.  **Refactor `SavingsNotifier`:**
    - Update `createDeposit` to accept a `Map<String, double>` of goal IDs and their respective percentages.
    - Loop through the map to create allocations and update goal balances.
    - Use `RewardService` for side-effects.

## Phase 3: UI Unification (UX Scalability)
1.  **Dynamic Onboarding:**
    - Replace `GoalASetupScreen` and `GoalBSetupScreen` with a single `GoalSetupScreen(index)`.
    - Allow users to "Add Another Goal" during setup.
2.  **Universal Dashboard:**
    - Update `DashboardScreen` to fetch all goals from the DB and build a vertical list of `GoalCard` widgets instead of hardcoded A/B references.
    - Refactor `DualProgressRing` to support a list of progress values or replace with a multi-segment progress bar.

## Phase 4: Sync & UUID Migration
1.  **UUID for All:**
    - Migrate `UserProfiles.id` from `Int` to `String` (UUID).
2.  **Timestamps:**
    - Add `updatedAt` to all tables.
    - Update `AppDatabase` to auto-update `updatedAt` on every write.

---
*Prepared by Jules (AI Senior Engineer)*
