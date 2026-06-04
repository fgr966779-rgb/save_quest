# Стратегия рефакторинга: Переход на динамические цели (N-Goals)

Эта стратегия описывает шаги по устранению жесткой привязки к двум целям (`goal_a` и `goal_b`) и переходу на масштабируемую систему.

## 1. Изменения в базе данных (Drift)

### 1.1 Новая таблица `DepositAllocations`
```dart
class DepositAllocations extends Table {
  TextColumn get id => text()();
  TextColumn get depositId => text().references(Deposits, #id)();
  TextColumn get goalId => text().references(Goals, #id)();
  /// Сумма в копейках.
  IntColumn get amount => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
```

### 1.2 Изменение таблицы `Deposits`
*   Удалить `goalAAmount` и `goalBAmount`.
*   Добавить миграцию для переноса существующих данных из `Deposits` в `DepositAllocations`.

### 1.3 Миграция (AppDatabase)
```dart
// В методе onUpgrade
if (from < 9) {
  await m.createTable(depositAllocations);

  // Перенос данных:
  // Для каждого депозита создаем две записи в DepositAllocations:
  // 1. {depositId: id, goalId: 'goal_a', amount: goalAAmount}
  // 2. {depositId: id, goalId: 'goal_b', amount: goalBAmount}

  // После переноса удаляем колонки из Deposits (через пересоздание таблицы в SQLite)
}
```

## 2. Изменения в Logic Layer

### 2.1 SavingsNotifier
*   Изменить сигнатуру `createDeposit`:
    ```dart
    Future<DepositResult?> createDeposit({
      required double totalAmount,
      required Map<String, double> allocations, // Map<GoalId, Percentage>
      String? note,
      // ...
    })
    ```
*   Внутри метода итерировать по `allocations` для обновления `Goals` и вставки в `DepositAllocations`.

### 2.2 Data Layer (AppDatabase)
*   Обновить `saveDepositAndUpdateGoals` для принятия списка аллокаций.

## 3. Изменения в UI Layer

### 3.1 Deposit Screen
*   Заменить `SplitSlider` (который завязан на 2 значения) на динамический список слайдеров или селектор целей с вводом суммы.
*   Добавить возможность выбора активных целей для конкретного депозита.

### 3.2 Dashboard
*   `DualProgressRing` должен быть заменен на `MultiProgressRing` или систему отдельных индикаторов для каждой цели.
*   Карточки целей должны генерироваться на основе `watchAllGoals()`, а не быть захардкоженными.

### 3.3 Onboarding
*   Заменить последовательные экраны Goal A / Goal B на один экран с возможностью добавления N целей (минимум 1).

## 4. План реализации

1.  **Спринт 1:** Миграция БД и обновление `AppDatabase` методов доступа.
2.  **Спринт 2:** Рефакторинг `SavingsNotifier` и бизнес-логики распределения XP.
3.  **Спринт 3:** Обновление UI: Dashboard и Onboarding.
4.  **Спринт 4:** Тестирование и удаление устаревшего кода.
