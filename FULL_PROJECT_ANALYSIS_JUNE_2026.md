# Full Project Analysis Report - June 2026

## 1. Executive Summary
PiggyVault (Скарбничка) is a gamified savings application built with Flutter, featuring a hardcore cyberpunk aesthetic. While the MVP (Phase 1) is functional and visually impressive, it faces significant architectural bottlenecks that will hinder Phase 2 (Social & Cloud) development. The primary issues are hardcoded goal limitations, "God Object" services, and fragile AI integrations.

---

## 2. Architecture Overview
*   **Framework:** Flutter 3.6.2 (Current).
*   **State Management:** Riverpod (Used for most feature logic).
*   **Database:**
    *   **Drift (SQLite):** Relational data (Goals, Deposits, User Profiles).
    *   **Hive:** Key-Value store (Settings, Milestones, Notifications).
*   **Navigation:** GoRouter.
*   **AI Integration:** OpenRouter (DeepSeek) for coach insights and daily bounties.
*   **Styling:** Custom "Neon" design system with `AppColors` and `AppTypography`.

---

## 3. Inventory of Hardcoded References & Technical Debt

### 3.1 The "N-Goals" Blocker
The system is currently hardcoded to support exactly two goals: `goal_a` and `goal_b`. This is pervasive throughout the stack:
*   **Database Schema (v8):** `Deposits` table has `goalAAmount` and `goalBAmount` columns instead of a relational link to a dynamic number of goals.
*   **Queries:** `AppDatabase` contains hardcoded queries like `getGoalById('goal_a')`.
*   **Logic:** `SavingsNotifier` and `BackupService` manually handle two goals.
*   **UI:** `DashboardScreen`, `GoalDetailScreen`, and `Onboarding` flow are hardcoded for two goals.

### 3.2 Technical Debt in Data Layer
*   **BackupService:** Manually serializes every table. Adding a new table requires manual updates to `PiggyVaultBackup` and `restoreBackup`.
*   **CSV Export/Import:** Hardcoded for two goals; will break if more are added.
*   **Primary Keys:** `UserProfiles` uses a static ID of `1`, which will cause conflicts in multi-device sync scenarios.

---

## 4. God Object Analysis: SavingsNotifier
The `SavingsNotifier.createDeposit` method (lib/core/providers/savings_notifier.dart) is a ~250-line "God Object" that violates the Single Responsibility Principle:
*   **Responsibilities:**
    1.  Database transaction management.
    2.  XP calculation & Level-up logic.
    3.  Streak management.
    4.  Lootbox/Reward drops.
    5.  Achievement validation.
    6.  Squad updates.
    7.  External provider notification (Bounties, Quests).
*   **Risk:** High complexity makes it difficult to test and prone to side-effect bugs.

---

## 5. AI Services Analysis
*   **Parsing Fragility:** `PriceAnalysisService` and `BountyProvider` use regex or basic string slicing (`_extractJson`) to find JSON in AI responses. This is prone to failure if the AI includes extra text or formatting.
*   **Personality Logic:** Hardcoded system prompts in `openrouter_service.dart`.
*   **Reliability:** Falls back to hardcoded catalogs, but the transition isn't always seamless for the user.

---

## 6. Code Duplication & Consistency Issues
*   **Onboarding:** `goal_a_setup_screen.dart` and `goal_b_setup_screen.dart` are 95% identical.
*   **Gamification Storage:** Achievements use Drift, while Milestones use Hive. This creates atomicity risks.
*   **L10n:** Localized values are in a hardcoded Map in `l10n.dart` rather than ARB files, making translation management difficult.

---

## 7. Recommendations & Decoupling Strategy

### 7.1 Immediate Refactoring (Preparation for Phase 2)
1.  **Dynamic Goals Migration:**
    *   Introduce `DepositAllocations` table.
    *   Migrate data from `goalAAmount`/`goalBAmount` to the new table.
    *   Update `SavingsNotifier` to iterate over allocations.
2.  **Service Decoupling:**
    *   Move XP logic to `XpService`.
    *   Move Achievement checks to an asynchronous event-driven system (e.g., `EventsNotifier`).
3.  **Onboarding Consolidation:**
    *   Replace `GoalASetupScreen` and `GoalBSetupScreen` with a single `GoalSetupScreen` that takes a goal index/ID as a parameter.

### 7.2 Scalability for Social Features
1.  **UUID Migration:** Replace `Int` IDs with `UUID` for all primary keys to facilitate Cloud Sync.
2.  **Sync Readiness:** Add `updatedAt` and `isDeleted` (soft delete) to all tables.
3.  **Networking Layer:** Introduce a dedicated `NetworkService` for Squads (Firebase/Supabase) to replace current local mocks.

---
*Report finalized: June 2026*
