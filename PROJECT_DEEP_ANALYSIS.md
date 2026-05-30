# Project Deep Analysis: PiggyVault (June 2026)

## 1. Executive Summary
PiggyVault is a feature-rich, gamified savings application built with Flutter. It has successfully moved past the MVP stage but carries significant technical debt in its core data architecture and state management layers. The project is at a critical juncture where refactoring "N-Goals" support is mandatory for further feature expansion.

## 2. Architectural Audit

### 2.1 State Management (Riverpod)
- **God Object Pattern:** `SavingsNotifier` in `lib/core/providers/savings_notifier.dart` is a major bottleneck. It handles:
  - Database transactions for deposits.
  - XP & Level-up logic.
  - Streak calculations.
  - Lootbox drop logic.
  - Achievement validation.
  - Social (Squad) updates.
  - Triggering side-effects (Quests, Bounties).
- **Service Layer:** While services like `XpService`, `StreakService`, and `AchievementService` exist, they are mostly used as utility helpers inside the `SavingsNotifier` transaction rather than being decoupled domain services.

### 2.2 Data Persistence (Drift & Hive)
- **Drift (Relational):**
  - **Schema Version 8:** Current schema is functional but rigid.
  - **The "N-Goals" Blocker:** The `Deposits` table has hardcoded `goalAAmount` and `goalBAmount` columns. This prevents users from saving towards 3 or more goals.
  - **Query Logic:** Much of the complex update logic is embedded in `AppDatabase` methods (e.g., `saveDepositAndUpdateGoals`), making it harder to test independently of the database.
- **Hive (Key-Value):**
  - Used for 5 separate boxes: `milestones_box`, `goal_dependencies_box`, `weekly_challenges_box`, `notifications_box`, and settings.
  - **Risk:** No transactional integrity between Drift and Hive updates. If a deposit succeeds in Drift but fails to update a milestone in Hive, the state becomes inconsistent.

## 3. UI/UX & Design System

### 3.1 Technical Debt in UI
- **Hardcoded Colors:** Approximately 60+ instances of `0xFF...` hex codes remain in the codebase (e.g., `terminal_screen.dart`), bypassing the `AppColors` system.
- **Widget Coupling:** `DualProgressRing` and `SplitSlider` are explicitly designed for exactly two goals. These will need a complete rewrite or replacement for the N-Goals transition.
- **Theme Reactivity:** Localization and Theme switching are handled via providers, which is good, but some widgets use `ref.read` in build methods or long-running callbacks, potentially missing updates.

### 3.2 Gamification Mechanics
- **Complexity:** The system is very deep (Skill Tree, Classes, Lootboxes, Pets, Penalties).
- **Fragmented Logic:** Penalty logic is partially in `SavingsNotifier` and partially in `ShellScaffold` (for the grayscale filter).

## 4. Feature-Specific Analysis

### 4.1 Remote PC Control (`remote_server/`)
- Uses a Node.js server with `robotjs` (native) and a PowerShell fallback for Windows.
- **Security:** Basic SHA-256 challenge-response authentication is implemented.
- **Latency:** Capture loop uses `sharp` for JPEG compression to manage bandwidth.

### 4.2 AI Integration
- `OpenRouterService` and `PriceAnalysisService` handle AI interactions.
- **Stability:** Responses rely on "Respond ONLY with JSON" prompts, which are prone to breakage. No formal schema validation is present for AI responses.

## 5. Quality Assurance
- **Test Coverage:** Extremely low. Only `test/widget_test.dart` exists, and it only verifies that the app can build and find a counter (which isn't even in the app anymore).
- **Linting:** 11 issues remaining, mostly related to `use_build_context_synchronously`.

## 6. Critical Recommendations for Phase 2

1.  **Immediate Refactor: N-Goals Database Schema**
    - Move to a `DepositAllocations` table.
    - Update `SavingsNotifier` to iterate over dynamic allocations.
2.  **Decouple `SavingsNotifier`**
    - Move XP, Streak, and Achievement logic into dedicated `Domain Services` that return "Result" objects.
    - `SavingsNotifier` should only coordinate these services and handle UI state.
3.  **Unified Reward System**
    - Merge `Achievements` and `Badges` into a single `Reward` entity in the database to reduce logic duplication.
4.  **Sync Readiness**
    - Introduce `updatedAt` timestamps and move away from Auto-increment IDs to UUIDs for all tables to prevent sync conflicts.
5.  **Testing Strategy**
    - Implement Unit Tests for `XpService` and `StreakService`.
    - Implement Integration Tests for the deposit flow.
