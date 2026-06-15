# Implementation Plan: Phase 2 (Social, Cloud & Refactoring)

## 1. Архитектурный рефакторинг (Подготовка к масштабированию) 🏗️

### 1.1 Переход на Динамические Цели (N-Goals)
**Цель:** Уйти от жесткой привязки `goal_a` / `goal_b` во всем приложении.
*   **БД (Drift):**
    - Удалить `goalAAmount`, `goalBAmount` из таблицы `Deposits`.
    - Создать таблицу `DepositAllocations(id, depositId, goalId, amount)`.
    - Выполнить миграцию существующих данных из `Deposits` в `DepositAllocations`.
*   **Domain:** Обновить `SavingsNotifier.createDeposit` для работы со списком аллокаций (`Map<String, double>`).
*   **UI:**
    - Рефакторинг `DualProgressRing` для поддержки отрисовки N колец.
    - Рефакторинг `SplitSlider` (или замена на `MultiGoalSlider`) для распределения средств между N целями.
    - Объединение `GoalASetupScreen` и `GoalBSetupScreen` в единый динамический флоу.

### 1.2 Декомпозиция "God Object" (SavingsNotifier)
*   Вынести расчет XP в `XpService`.
*   Вынести логику наград и достижений в `AchievementService`.
*   Интегрировать `WeeklyChallengeService` в транзакцию депозита для обеспечения атомарности.

### 1.3 Оптимизация для Синхронизации (Sync Readiness)
*   **БД:** Добавить колонку `updatedAt` (DateTime) во все таблицы.
*   **БД:** Перейти на UUID для `UserProfiles` и других оставшихся таблиц.
*   **Service:** Создать базовый `SyncService` для отслеживания локальных изменений.

---

## 2. Облачная синхронизация (Firebase + CRDT Lite) ☁️

### 2.1 Интеграция Firebase
*   Настройка **Firebase Auth** (Anonymous -> Google/Email).
*   Настройка **Cloud Firestore** для хранения данных Squads и совместных целей.

### 2.2 Синхронизация данных
*   Реализация стратегии "Offline First" с фоновой синхронизацией.
*   Разрешение конфликтов по принципу "Last Write Wins" для персональных данных.

---

## 3. Социальные функции (Squads 2.0) 👥

### 3.1 Реализация Squads
*   **Real-time Feed:** Лента активности участников.
*   **Joint Goals Sync:** Синхронизация прогресса совместных целей в реальном времени.
*   **Squad AI Coach:** Интеграция AI-аналитики для командных достижений.

---

## 4. AI & Надежность 🤖

### 4.1 Стандартизация AI Интеграции
*   Переход на **Structured Output** в промптах для `PriceAnalysisService`.
*   Внедрение валидации JSON-схем на стороне Dart для предотвращения падений при некорректных ответах моделей.

---

## 5. Дорожная карта Фазы 2 (Обновлено)

1.  **Неделя 1:** Рефакторинг БД (N-Goals) + Миграция + Декомпозиция `SavingsNotifier`.
2.  **Неделя 2:** Унификация UI (Onboarding & Deposit) + Подготовка UUID/UpdatedAt.
3.  **Неделя 3:** Подключение Firebase + Синхронизация персональных данных.
4.  **Неделя 4:** Squads + Joint Goals + AI Group Insights.

---
*План обновлен: Июль 2026 (на основе глубокого анализа)*
