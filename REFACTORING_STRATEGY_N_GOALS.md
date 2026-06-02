# Refactoring Strategy: Transition to Dynamic N-Goals

## 1. Problem Statement
The current PiggyVault architecture is strictly bound to two goals (`goal_a` and `goal_b`). This limitation is hardcoded at the database, business logic, and UI layers, preventing users from creating more (or fewer) than two active savings goals.

## 2. Phase 1: Database Schema Migration
### 2.1 New Table: `DepositAllocations`
```dart
class DepositAllocations extends Table {
  TextColumn get id => text()();
  TextColumn get depositId => text().references(Deposits, #id)();
  TextColumn get goalId => text().references(Goals, #id)();
  IntColumn get amount => integer()(); // Minor units (kopecks)

  @override
  Set<Column> get primaryKey => {id};
}
```

### 2.2 Table Modification: `Deposits`
*   **Remove:** `goalAAmount`, `goalBAmount`.
*   **Keep:** `amount` (total), `note`, `createdAt`, `isDeleted`.

### 2.3 Migration Script (Drift Schema Version 9)
1.  Create `deposit_allocations` table.
2.  Iterate through all existing `deposits`.
3.  For each deposit:
    *   If `goalAAmount > 0`, create an allocation for `goal_a`.
    *   If `goalBAmount > 0`, create an allocation for `goal_b`.
4.  Drop old `deposits` columns (requires table recreation in SQLite).

## 3. Phase 2: Business Logic Decoupling
### 3.1 `AppDatabase` Methods
*   Refactor `saveDepositAndUpdateGoals` to accept a `List<DepositAllocation>`.
*   Update the transaction logic to loop through allocations and update the corresponding goals' `currentAmount`.

### 3.2 `SavingsNotifier`
*   Change `createDeposit` signature to accept `Map<String, double> goalAllocations` (GoalID -> Percentage).
*   Remove hardcoded references to `goal_a` and `goal_b`.

## 4. Phase 3: UI Generalization
### 4.1 Widget Refactoring
*   **`MultiGoalProgressRing`**: Replace `DualProgressRing`. Uses a single ring with multiple segments or nested rings for all active goals.
*   **`MultiGoalAllocator`**: Replace `SplitSlider`. A list-based UI allowing users to distribute a deposit among N goals (ensuring sum = 100%).

### 4.2 Screen Updates
*   **`DashboardScreen`**: Dynamically list all goals fetched from the `goalsProvider`.
*   **`DepositScreen`**: Use the new `MultiGoalAllocator`.
*   **`Onboarding`**: Update the flow to allow creating 1 to N goals instead of a fixed two-step process.

## 5. Phase 4: Verification & Testing
*   **Unit Tests**: Verify that `SavingsNotifier` correctly calculates allocations for 1, 3, and 5 goals.
*   **Integration Tests**: Ensure the migration of legacy data (Goal A/B) results in correct `DepositAllocations` entries.

---
*Status: Strategy Ready for Implementation*
