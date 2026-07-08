# Дорожная карта рефакторинга: Переход к N-Goals и декомпозиция (Июль 2026)

Этот документ описывает технические шаги, необходимые для устранения критического долга "жесткого кодирования целей" и декомпозиции God Object `SavingsNotifier`.

---

## Этап 1: Реформа базы данных (Миграция на Schema v9)

**Цель:** Перейти от колонок `goal_a_amount`/`goal_b_amount` к динамической связи One-to-Many.

1.  **Создание новой таблицы `DepositAllocations`**:
    *   `id` (Text/UUID) — Primary Key.
    *   `depositId` (Text/UUID) — Foreign Key к `Deposits.id`.
    *   `goalId` (Text/UUID) — Foreign Key к `Goals.id`.
    *   `amount` (Int) — Сумма аллокации в копейках.
2.  **Обновление таблицы `Deposits`**:
    *   Добавить колонку `updatedAt` (DateTime).
    *   Добавить колонку `isSynced` (Bool, default false).
    *   *Важно:* Удаление колонок `goal_a_amount` и `goal_b_amount` потребует миграции существующих данных в новую таблицу `DepositAllocations`.
3.  **UUID миграция**:
    *   Изменить первичный ключ `UserProfiles` с `Int` на `Text` (UUID).
    *   Добавить `updatedAt` во все таблицы (`Goals`, `UserProfiles`, `Lootboxes`, и т.д.).

---

## Этап 2: Декомпозиция бизнес-логики (SavingsNotifier)

**Цель:** Разделить процедурный код `createDeposit` на специализированные доменные сервисы.

1.  **XpService**:
    *   Метод `calculateTotalXpGained(deposit, profile, skills, event)`.
    *   Логика расчета критических ударов и множителей.
2.  **StreakService**:
    *   Инкапсуляция логики расчета стриков и использования токенов заморозки.
3.  **AchievementService**:
    *   Вынос проверки условий достижений из транзакции сохранения.
    *   Использование асинхронных слушателей (Riverpod listeners) для уведомлений о разблокировке.
4.  **DepositRepository**:
    *   Выделение методов `insertDepositWithAllocations` и `softDeleteDepositWithAllocations` в отдельный слой репозитория вместо прямого вызова транзакций в Notifier.

---

## Этап 3: Рефакторинг UI-компонентов

**Цель:** Сделать интерфейс независимым от количества целей.

1.  **Unification of Onboarding**:
    *   Создать универсальный `GoalSetupScreen(int index)`.
    *   Использовать `PageView` или динамическую навигацию для настройки N целей.
2.  **Dynamic Widgets**:
    *   **SplitSlider**: Должен принимать `Map<String, double>` (GoalID -> Percent) и рендерить N слайдеров или многосегментный слайдер.
    *   **DualProgressRing**: Переименовать в `MultiProgressRing` и отрисовывать N вложенных дуг на основе списка активных целей.
3.  **Dashboard**:
    *   Заменить хардкодный список карточек целей на динамический `ListView.builder`.

---

## Этап 4: Верификация

1.  **Unit Tests**: Написать тесты для `XpService` и `StreakService` (покрытие > 90%).
2.  **Migration Tests**: Проверить корректность переноса данных `goal_a/b` в `DepositAllocations` при обновлении версии БД.
3.  **Performance Profiling**: Убедиться, что отрисовка N колец в `MultiProgressRing` не приводит к пропуску кадров.

---
*Документ подготовлен для реализации в Фазе 2*
