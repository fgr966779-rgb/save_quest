# Deep Technical Audit Report: PiggyVault (June 2026)

## 1. Executive Summary
PiggyVault has successfully transitioned from a prototype to a feature-rich gamified savings application. However, the current architecture faces a critical "scaling wall" due to hardcoded data structures and fragmented persistence. Phase 2 (Social & Cloud) requires a fundamental refactoring of the core transaction engine and goal management system.

## 2. Architectural Analysis

### 2.1 Pattern: Feature-First vs. Layered
The project uses a hybrid approach. While top-level folders are feature-based (`lib/features/`), core services and providers are centrally located (`lib/core/`). This lead to some "leakage" where domain logic (XP math, streak rules) is implemented inside StateNotifiers rather than pure domain services.

### 2.2 The "God Object" Problem: `SavingsNotifier`
The `SavingsNotifier.createDeposit` method is the most complex part of the app (~230 lines). It coordinates:
- Database transactions (Drift)
- XP calculation (`XpService`)
- Streak logic (`StreakService`)
- Lootbox RNG
- Archetype XP (Hacker/Magnate/Resilience)
- Cyber-Market Credits calculation
- Achievement/Badge validation (`AchievementService`)
- Squad updates
- Daily Quest completion
- Bounty checks

**Risk:** High maintenance cost, difficult to unit test, and impossible to reuse for other deposit types (e.g., Joint Goals).

## 3. Data Persistence & Integrity

### 3.1 Hardcoded N-Goals (Critical Bottleneck)
The application is strictly limited to 2 goals by its database schema and UI:
- **Drift Table `Deposits`**: Contains `goalAAmount` and `goalBAmount` columns.
- **Drift Table `AppDatabase`**: `saveDepositAndUpdateGoals` and `softDeleteDepositAndUpdateGoals` are hardcoded to update `'goal_a'` and `'goal_b'`.
- **UI Components**: `DualProgressRing`, `SplitSlider`, and `DashboardScreen` are designed specifically for two goals.
- **Reference Count**: There are over 100 hardcoded references to `goal_a` and `goal_b` across the codebase.

### 3.2 Storage Fragmentation
Data is split across two incompatible storage engines:
1. **Drift (Relational)**: Deposits, Goals, Profiles, Achievements, Pets, Squads.
2. **Hive (Key-Value)**: Settings, Weekly Challenges, Goal Dependencies, Milestones, Notifications.

**Risk:** **Atomicity Violation.** It is impossible to wrap a Drift transaction and a Hive write in a single atomic operation. If a deposit succeeds in Drift but the Weekly Challenge update fails in Hive, the app state becomes inconsistent.

## 4. Technical Debt & Code Quality

### 4.1 Linter & Testing
- **Lints**: 11 active issues (mostly `use_build_context_synchronously` and `unused_local_variable`).
- **Tests**: Only 1 compilation smoke test exists (`test/widget_test.dart`). 0% coverage for business logic (XP, Streaks, Money Utils).

### 4.2 Reward System Duplication
There is a functional overlap between `Achievements` (Drift), `Badges` (UserProfile JSON), and `Milestones` (Hive). This makes the progression system hard to track and display in a unified way.

### 4.3 AI Stability
AI-driven features (Bounties, Price Analysis) rely on `OpenRouterService`. The parsing logic uses string replacement and regex to extract JSON from the AI response.
**Risk:** Fragility. If the model changes its output format slightly, these features will break or fall back to "DECRYPT ERROR" states frequently.

## 5. Phase 2 Recommendations (Prioritized)

### 1. N-Goals Refactoring (Priority: High)
- Migrate `Deposits` to use a One-to-Many relationship with a new `DepositAllocations` table.
- Abstract the "Goal" concept to support 1 to N goals.

### 2. Logic Extraction (Priority: High)
- Move XP, Lootbox, and Credit logic from `SavingsNotifier` into a `DepositOrchestrator` domain service.

### 3. Persistence Consolidation (Priority: Medium)
- Migrate Weekly Challenges and Goal Dependencies from Hive to Drift to ensure transactional integrity.

### 4. Testing Infrastructure (Priority: Medium)
- Implement unit tests for `XpService`, `StreakService`, and `MoneyUtils`.
- Implement integration tests for the deposit flow.

### 5. UI Theme & Color Unification (Priority: Low)
- Replace 50+ hardcoded `Color(0x...)` instances with a centralized `AppTheme` extension.

---
*End of Report - Prepared by Jules (AI Senior Engineer)*
