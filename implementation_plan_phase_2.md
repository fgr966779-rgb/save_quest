# Implementation Plan: Phase 2 (Social & Cloud) - REVISED

## Phase 2.1: Foundation & Debt Clearance (Critical Path)

### 1. N-Goals Database Migration
- **Status:** Blocker
- **Tasks:**
  - Create `DepositAllocations` table in `lib/data/database.dart`.
  - Implement Migration Strategy to move data from `goalAAmount`/`goalBAmount` to the new table.
  - Update `AppDatabase` queries to support N-Goals.
  - Refactor `SavingsNotifier.createDeposit` to accept a `Map<String, double>` of goal allocations.

### 2. Architectural De-coupling
- **Status:** High Priority
- **Tasks:**
  - Refactor `SavingsNotifier` by moving business logic into `XpDomainService` and `StreakDomainService`.
  - Create a unified `RewardSystem` to handle both Achievements and Badges.
  - Implement `SyncMetadata` (UUIDs, `updatedAt`) across all Drift tables.

### 3. UI Refactoring for N-Goals
- **Status:** Required for 1 & 2
- **Tasks:**
  - Replace `DualProgressRing` with a dynamic `NGoalProgressList` or a multi-segment ring.
  - Rewrite `SplitSlider` to handle N-way distribution.
  - Clean up hardcoded hex colors in `terminal_screen.dart` and other UI files.

## Phase 2.2: Social & Cloud Sync

### 1. Cloud Infrastructure (Firebase)
- **Tasks:**
  - Initialize Firebase Auth and Firestore.
  - Implement `SyncService` for Offline-First data reconciliation.
  - Transition Squads and Joint Goals from local-only to cloud-backed.

### 2. Social Features (Squads 2.0)
- **Tasks:**
  - Real-time activity feed for Squad members.
  - Joint Goal contribution tracking with Conflict Resolution (Counter CRDT).
  - AI-generated Squad Insights.

## Phase 2.3: Quality & AI Stability

### 1. Robust Testing
- **Tasks:**
  - Achieve 80% coverage for `core/services` (XP, Streaks, Achievements).
  - Implement Golden Tests for critical UI components.

### 2. AI Prompt Engineering
- **Tasks:**
  - Move AI prompts to a structured format (JsonSchema).
  - Implement client-side validation for AI-generated Bounties and Insights.

---
*Last Updated: June 2026*
