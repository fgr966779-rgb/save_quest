# Full Project Analysis Report - PiggyVault (July 2026)

## 1. Executive Summary
PiggyVault is a Flutter-based personal finance gamification app that has successfully reached its Phase 1 (MVP) milestones. The core loop of "Deposit -> XP/Progression -> Rewards" is functional. However, the project faces significant architectural bottlenecks that will hinder scaling in Phase 2 (Social & Cloud Sync), primarily due to hardcoded logic for exactly two goals and a centralized coordinator ("God Object") that handles too many responsibilities.

## 2. Technical Stack
- **Framework:** Flutter 3.x
- **State Management:** Riverpod (StateNotifier, AsyncValue, StreamProvider)
- **Database:** Drift (SQLite) for structured data, Hive for Key-Value settings and ephemeral data.
- **AI Integration:** OpenRouter (DeepSeek) for financial coaching and daily bounties.
- **Architecture:** Feature-first structure with an attempt at Clean Architecture (Core/Data/Features).

## 3. Detailed Component Analysis

### 3.1 Data Layer (`lib/data/database.dart`)
- **Strengths:** Use of UUIDs for most primary keys is excellent for future cloud synchronization. Migration strategy is well-documented up to version 8.
- **Critical Debt:** The `Deposits` table hardcodes `goalAAmount` and `goalBAmount`. This is the root of the "N-Goals" problem.
- **Missing Features:** Lack of `updated_at` and `is_synced` columns across tables will make conflict resolution during cloud sync difficult.

### 3.2 Business Logic (`lib/core/providers/savings_notifier.dart`)
- **God Object Pattern:** `SavingsNotifier` coordinates database transactions, streak calculations, XP gains, level-ups, achievement validation, lootbox drops, and bounty checks.
- **Refactoring Progress:** Some logic (XP, Streaks, Achievements) has been successfully extracted into services in `lib/core/services/gamification/`, but the notifier still acts as the primary orchestrator, making it a "God Object."
- **N-Goals Coupling:** The `createDeposit` method still takes a `goalAPercent` parameter and explicitly updates two hardcoded goals.

### 3.3 UI Layer
- **Code Duplication:** Onboarding screens (`goal_a_setup_screen.dart` and `goal_b_setup_screen.dart`) are ~95% identical.
- **Widget Specialization:** Widgets like `DualProgressRing` and `SplitSlider` are hardcoded for two-goal comparisons.
- **Localization:** `lib/core/providers/l10n.dart` uses a massive hardcoded `Map` instead of standard `.arb` files, which will become unmanageable as the app grows.

### 3.4 AI Integration
- **Fragile Parsing:** `BountyNotifier` and `PriceAnalysisService` rely on `indexOf('{')` and string replacements to extract JSON from AI responses. This lacks robust validation and schema enforcement.
- **Fallback Logic:** High reliance on static fallback catalogs when AI fails or API keys are missing.

### 3.5 Social Features (Squads & Joint Goals)
- **Status:** UI and local storage are implemented.
- **Sync Readiness:** Data models are stable, but the logic is entirely local. Transitioning to real-time sync (Firestore/Supabase) will require a significant rewrite of the `JointGoalsProvider`.

## 4. Technical Debt Inventory

| Category | Issue | Impact | Priority |
| :--- | :--- | :--- | :--- |
| **Architecture** | Hardcoded 2-Goal Logic | Prevents users from adding a 3rd goal. | Critical |
| **Logic** | SavingsNotifier God Object | High risk of regression; difficult to test. | High |
| **UI** | Onboarding Duplication | Maintenance burden; inconsistent UX. | Medium |
| **Data** | Missing Sync Metadata | Blocks Phase 2 Cloud Sync features. | High |
| **AI** | Brittle JSON Parsing | Frequent crashes or fallback triggers on AI updates. | Medium |
| **Testing** | Minimal Test Coverage | Low confidence in refactoring stability. | High |

## 5. Phase 2 Roadmap & Recommendations

### 5.1 Immediate Refactoring (Step 1)
- **N-Goals Database Migration:** Implement the `DepositAllocations` table and migrate existing `goal_a/b` data.
- **Generalize Widgets:** Refactor `SplitSlider` and `ProgressRings` to accept a `List<Goal>`.
- **Unify Onboarding:** Create a single `GoalSetupScreen` that can be pushed multiple times.

### 5.2 Cloud Sync Preparation (Step 2)
- **Schema Update:** Add `updated_at` (DateTime) and `is_synced` (Boolean) to all tables.
- **UUID Uniformity:** Ensure `UserProfiles` and other remaining tables use UUIDs.

### 5.3 AI Stability (Step 3)
- **Structured Output:** Use regex-based JSON extraction or specialized prompt engineering to ensure stable JSON responses.
- **Schema Validation:** Implement a validation layer for AI-generated JSON before parsing into models.

### 5.4 Test-Driven Refactoring (Continuous)
- **Unit Tests:** Implement tests for `XpService`, `StreakService`, and the new `DepositAllocations` logic.
- **Integration Tests:** Verify the full deposit flow from UI to Database.

---
*Report Compiled by Jules, July 2026*
