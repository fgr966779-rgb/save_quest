# Project Audit & Deep Analysis: PiggyVault (SaveQuest)
**Date:** June 2026
**Status:** Phase 1 Complete | Phase 2 Initiation

## 1. Executive Summary
PiggyVault is a feature-rich personal finance gamification app built with Flutter. It successfully implements a core loop of savings, XP gain, and RPG-style progression. However, the project has reached a critical bottleneck where its architectural "shortcut" (hardcoded 2-goal system) prevents further scaling and social features (Squads/Joint Goals).

## 2. Architectural Analysis

### 2.1 Technology Stack
- **Framework:** Flutter 3.6.x (Dart 3.6.x)
- **State Management:** Riverpod (StateNotifier pattern)
- **Persistence:** Drift (SQLite) for structured data, Hive for settings/key-value
- **Navigation:** GoRouter
- **AI Integration:** OpenRouter (DeepSeek V3/V4)

### 2.2 Project Structure
The project follows a feature-first organization:
- `lib/core/`: Shared services (AI, Gamification logic), providers, constants, and global widgets.
- `lib/data/`: Database definitions and persistence services.
- `lib/features/`: Functional modules (Dashboard, Deposit, Gamification, Onboarding, Remote Control).

## 3. Technical Debt Inventory

### 3.1 The "N-Goals" Bottleneck (Critical)
The most significant debt. The system is hardcoded for exactly two goals (`goal_a` and `goal_b`).
- **Database:** Table `Deposits` contains `goalAAmount` and `goalBAmount` columns.
- **Logic:** `SavingsNotifier` manually calculates splits for exactly two goals.
- **Service Layer:** `AchievementService` and `MilestoneService` have hardcoded checks for `goal_a` and `goal_b`.
- **UI:** Widgets like `DualProgressRing` and `SplitSlider` are limited to binary data.

### 3.2 SavingsNotifier God Object
`lib/core/providers/savings_notifier.dart` is becoming a "God Object." It coordinates:
- Database transactions for savings.
- XP/Leveling logic (partially delegated).
- Streak management.
- Achievement triggering.
- Bounty/Quest completion.
- Lootbox drop logic.
- Avatar config updates.

### 3.3 UI Duplication (High)
Onboarding screens (`goal_a_setup_screen.dart` and `goal_b_setup_screen.dart`) are nearly identical copies. This increases maintenance cost and risk of UI inconsistency.

### 3.4 AI Parsing Fragility (Medium)
Communication with OpenRouter relies on raw string manipulation and "Respond ONLY with JSON" prompts.
- **Risk:** AI "hallucinations" or minor formatting errors (e.g., Markdown blocks) often break parsing, reverting the app to fallback/offline logic.

### 3.5 Sync & Scalability (Medium)
- **Primary Keys:** Some tables use static IDs (e.g., `UserProfiles.id = 1`) or autoincrement integers, which will conflict in a multi-device sync environment.
- **Metadata:** Tables lack `updatedAt` and `isSynced` flags required for a robust "Offline First" synchronization strategy.

## 4. Phase 2 Strategic Roadmap

### Step 1: Database & Logic Refactor (N-Goals)
- Transition to `DepositAllocations` table (Many-to-One: Deposits -> Goals).
- Generalize `SavingsNotifier` to accept a map of `goalId -> amount`.
- Unify Onboarding into a single reusable `GoalSetupScreen`.

### Step 2: Cloud Sync & Social (Squads)
- Integrate Firebase Auth & Firestore.
- Implement a Sync Service using "Last Write Wins" or Counter CRDT for joint goals.
- Transform local-only Squads/Joint Goals into real-time collaborative features.

### Step 3: Architecture Hardening
- Decompose `SavingsNotifier` into domain-specific services.
- Move localization from `l10n.dart` (Hardcoded Map) to standard `.arb` files.
- Implement structured output validation for AI responses (JsonSchema or robust retry logic).

## 5. Conclusion
PiggyVault has a strong "visual soul" and engaging gamification. By resolving the hardcoded N-Goals limitation and cleaning up the God Object in `SavingsNotifier`, the project will be ready for social scaling and cloud synchronization.
