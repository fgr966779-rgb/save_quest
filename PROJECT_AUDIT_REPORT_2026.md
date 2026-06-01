# Project Audit Report: PiggyVault (June 2026)

## 1. Executive Summary
PiggyVault is a feature-rich, gamified savings application with a strong cyberpunk aesthetic. While the core functionality is stable, the project suffers from significant technical debt in its core business logic and architectural bottlenecks that will hinder scaling (e.g., adding more than two goals).

---

## 2. Architectural Analysis

### 2.1 The "God Object" Problem: `SavingsNotifier`
The `SavingsNotifier` class in `lib/core/providers/savings_notifier.dart` is currently responsible for:
- Database transactions for deposits.
- XP calculation and Level-up logic.
- Streak maintenance and "Freeze Token" consumption.
- Achievement validation.
- Lootbox drop logic.
- Squad XP updates.
- Credit/Badge management.

**Risk:** High complexity makes it extremely difficult to test and prone to regression. A failure in lootbox logic can roll back the entire deposit transaction.

**Recommendation:** Decouple `SavingsNotifier` into dedicated domain services:
- `XpDomainService`
- `StreakDomainService`
- `AchievementDomainService`
- `EconomyDomainService` (Credits/Lootboxes)

### 2.2 Persistence Fragmentation (Drift vs Hive)
The project uses **Drift** for relational data (Goals, Deposits) and **Hive** for auxiliary state (Milestones, Challenges, Quests).

**Risk:** Atomic transactions cannot span both Drift and Hive. If a deposit is saved in Drift but the app crashes before Hive updates the Weekly Challenge, the user loses progress.

**Recommendation:** Migrate all financial and gamification progress data to Drift tables. Keep Hive only for transient UI settings and local preferences.

---

## 3. Technical Debt: The "N-Goals" Blocker

The application is hardcoded to support exactly two goals: `goal_a` and `goal_b`. This is pervasive across:
- **Database Schema:** `Deposits` table has `goalAAmount` and `goalBAmount` columns.
- **Providers:** `onboardingGoalASplitProvider`, etc.
- **Logic:** `SavingsNotifier` explicitly looks up 'goal_a' and 'goal_b'.
- **UI:** `DualProgressRing`, `SplitSlider`, and `DashboardScreen` are built around the dual-goal concept.

**Refactoring Requirements:**
1. **DB Migration:** Replace `goalAAmount`/`goalBAmount` in `Deposits` with a `DepositAllocations` junction table.
2. **Logic Generalization:** Update `SavingsNotifier` to iterate over an arbitrary list of target goals.
3. **UI Refactor:** Replace `DualProgressRing` with a generic `MultiGoalProgress` widget and `SplitSlider` with a dynamic allocation list.

---

## 4. UI & DX (Developer Experience)

### 4.1 Hardcoded Values
- **Colors:** Over 50 instances of hardcoded `0xFF...` hex colors.
- **Visual Effects:** Neon glow and glitch logic are repeated across multiple widgets instead of using a shared decorator.

### 4.2 Localization
The app uses a Map-based localization system in `l10n.dart`.
- **Pros:** Fast to implement.
- **Cons:** Does not support standard Flutter tools, lacks pluralization support, and becomes unmanageable as the number of keys grows (>1000 lines currently).

**Recommendation:** Transition to `.arb` files and use `flutter_gen` for type-safe translations.

---

## 5. Feature Audit

### 5.1 Remote Control
The Node.js remote control server is robust and well-integrated via WebSockets.
- **Security:** Uses SHA-256 challenge-response.
- **Improvement:** Could be integrated into the "Hacker" skill tree (e.g., earning XP for remote management tasks).

### 5.2 Gamification & Social
- **Pets & Squads:** Database tables and basic UI exist, but core logic (interaction, networking) is missing or local-only.
- **Leaderboard:** Currently local-only or "coming soon".

---

## 6. Prioritized Action Plan

| Priority | Task | Target |
| :--- | :--- | :--- |
| **P0** | **N-Goals Migration** | Database & Core Logic refactor to support >2 goals. |
| **P1** | **SavingsNotifier Decoupling** | Move XP/Streak/Achievement logic to Services. |
| **P1** | **Storage Unification** | Move Weekly Challenges & Milestones to Drift. |
| **P2** | **UI Standardization** | Implement `NeonBoxDecoration` and clean hardcoded colors. |
| **P2** | **L10n Migration** | Move to ARB files. |
| **P3** | **Social Implementation** | Real WebSocket/Backend integration for Alliances. |

---

## 7. Conclusion
PiggyVault has a solid foundation and excellent visual identity. By addressing the P0/P1 technical debt now, the project will be ready for its Phase 2 expansion (Social features and Cloud Sync).
