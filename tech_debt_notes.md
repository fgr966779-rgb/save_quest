# Технический долг и архитектурные проблемы PiggyVault

## 1. Жесткая привязка к двум целям (Goal Coupling)
Текущая архитектура жестко ограничена поддержкой только двух целей (`goal_a` и `goal_b`). Это пронизывает все слои приложения:

*   **База данных (`lib/data/database.dart`)**:
    *   Таблица `Deposits` содержит явные колонки `goal_a_amount` и `goal_b_amount`.
    *   Методы `saveDepositAndUpdateGoals` и `softDeleteDepositAndUpdateGoals` захардкожены на обновление именно этих двух записей по ID.
*   **Бизнес-логика (`lib/core/providers/savings_notifier.dart`)**:
    *   Метод `createDeposit` принимает `goalAPercent` и вручную вычисляет доли для A и B.
*   **Состояние и Onboarding (`lib/core/providers/providers.dart`)**:
    *   Существуют отдельные провайдеры для каждой цели: `onboardingGoalATitleProvider`, `onboardingGoalBTitleProvider` и т.д.
*   **UI Экраны (`lib/features/onboarding/screens/`)**:
    *   Дублирование кода между `goal_a_setup_screen.dart` и `goal_b_setup_screen.dart`.
*   **Геймификация (`lib/core/services/gamification/achievement_service.dart`)**:
    *   Проверки достижений (например, `halfway_ps5`, `ps5_acquired`) напрямую обращаются к ID `goal_a` и `goal_b`.
*   **Виджеты (`lib/core/widgets/`)**:
    *   `DualProgressRing` и `SplitSlider` принимают ровно два параметра прогресса/названия.

## 2. God Object: `SavingsNotifier`
`SavingsNotifier` в `lib/core/providers/savings_notifier.dart` выполняет слишком много задач:
*   Координация транзакций БД.
*   Расчет XP и уровней (хотя часть вынесена в `XpService`).
*   Логика стриков (через `StreakService`).
*   Начисление кредитов и выпадение лутбоксов.
*   Валидация достижений.
*   Проверка баунти (через `BountyProvider`).
*   Обновление данных отрядов (squads).

Это затрудняет тестирование и нарушает принцип единственной ответственности (SRP).

## 3. Хрупкость интеграции с ИИ
*   **Парсинг ответов (`lib/core/services/price_analysis_service.dart`)**:
    *   Метод `_extractJson` использует поиск подстроки между `{` и `}`, что крайне нестабильно, если ИИ вернет пояснительный текст с фигурными скобками.
    *   Regex `[^0-9.]` в `_toKopecks` может некорректно обрабатывать различные форматы чисел.
*   **Промпты**: Использование текстовых вставок "Respond ONLY with JSON" часто игнорируется моделями, что требует более надежных методов (например, Structured Output или JSON mode).

## 4. Локализация (L10n)
*   **`lib/core/providers/l10n.dart`**: Локализация реализована через гигантскую статическую `Map`. Это:
    *   Увеличивает размер бинарного файла.
    *   Затрудняет совместную работу с переводчиками (нет поддержки стандартных `.arb` файлов).
    *   Не использует стандартные инструменты Flutter для генерации типов.

## 5. Тестирование
*   В проекте отсутствуют тесты для сложных сценариев транзакций в `SavingsNotifier`.
*   Тесты в `test/widget_test.dart` лишь проверяют компиляцию базового провайдера.
