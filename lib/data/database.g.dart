// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GoalsTable extends Goals with TableInfo<$GoalsTable, Goal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _targetAmountMeta =
      const VerificationMeta('targetAmount');
  @override
  late final GeneratedColumn<int> targetAmount = GeneratedColumn<int>(
      'target_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentAmountMeta =
      const VerificationMeta('currentAmount');
  @override
  late final GeneratedColumn<int> currentAmount = GeneratedColumn<int>(
      'current_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accentColorMeta =
      const VerificationMeta('accentColor');
  @override
  late final GeneratedColumn<String> accentColor = GeneratedColumn<String>(
      'accent_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        targetAmount,
        currentAmount,
        currency,
        accentColor,
        createdAt,
        updatedAt,
        isSynced
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(Insertable<Goal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('target_amount')) {
      context.handle(
          _targetAmountMeta,
          targetAmount.isAcceptableOrUnknown(
              data['target_amount']!, _targetAmountMeta));
    } else if (isInserting) {
      context.missing(_targetAmountMeta);
    }
    if (data.containsKey('current_amount')) {
      context.handle(
          _currentAmountMeta,
          currentAmount.isAcceptableOrUnknown(
              data['current_amount']!, _currentAmountMeta));
    } else if (isInserting) {
      context.missing(_currentAmountMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('accent_color')) {
      context.handle(
          _accentColorMeta,
          accentColor.isAcceptableOrUnknown(
              data['accent_color']!, _accentColorMeta));
    } else if (isInserting) {
      context.missing(_accentColorMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Goal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Goal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      targetAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}target_amount'])!,
      currentAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_amount'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      accentColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}accent_color'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }
}

class Goal extends DataClass implements Insertable<Goal> {
  final String id;
  final String name;

  /// Target amount in minor units (kopecks).
  final int targetAmount;

  /// Current accumulated amount in minor units (kopecks).
  final int currentAmount;
  final String currency;
  final String accentColor;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isSynced;
  const Goal(
      {required this.id,
      required this.name,
      required this.targetAmount,
      required this.currentAmount,
      required this.currency,
      required this.accentColor,
      required this.createdAt,
      this.updatedAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['target_amount'] = Variable<int>(targetAmount);
    map['current_amount'] = Variable<int>(currentAmount);
    map['currency'] = Variable<String>(currency);
    map['accent_color'] = Variable<String>(accentColor);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      id: Value(id),
      name: Value(name),
      targetAmount: Value(targetAmount),
      currentAmount: Value(currentAmount),
      currency: Value(currency),
      accentColor: Value(accentColor),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory Goal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Goal(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      targetAmount: serializer.fromJson<int>(json['targetAmount']),
      currentAmount: serializer.fromJson<int>(json['currentAmount']),
      currency: serializer.fromJson<String>(json['currency']),
      accentColor: serializer.fromJson<String>(json['accentColor']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'targetAmount': serializer.toJson<int>(targetAmount),
      'currentAmount': serializer.toJson<int>(currentAmount),
      'currency': serializer.toJson<String>(currency),
      'accentColor': serializer.toJson<String>(accentColor),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  Goal copyWith(
          {String? id,
          String? name,
          int? targetAmount,
          int? currentAmount,
          String? currency,
          String? accentColor,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          bool? isSynced}) =>
      Goal(
        id: id ?? this.id,
        name: name ?? this.name,
        targetAmount: targetAmount ?? this.targetAmount,
        currentAmount: currentAmount ?? this.currentAmount,
        currency: currency ?? this.currency,
        accentColor: accentColor ?? this.accentColor,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
      );
  Goal copyWithCompanion(GoalsCompanion data) {
    return Goal(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      targetAmount: data.targetAmount.present
          ? data.targetAmount.value
          : this.targetAmount,
      currentAmount: data.currentAmount.present
          ? data.currentAmount.value
          : this.currentAmount,
      currency: data.currency.present ? data.currency.value : this.currency,
      accentColor:
          data.accentColor.present ? data.accentColor.value : this.accentColor,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Goal(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('targetAmount: $targetAmount, ')
          ..write('currentAmount: $currentAmount, ')
          ..write('currency: $currency, ')
          ..write('accentColor: $accentColor, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, targetAmount, currentAmount,
      currency, accentColor, createdAt, updatedAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Goal &&
          other.id == this.id &&
          other.name == this.name &&
          other.targetAmount == this.targetAmount &&
          other.currentAmount == this.currentAmount &&
          other.currency == this.currency &&
          other.accentColor == this.accentColor &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class GoalsCompanion extends UpdateCompanion<Goal> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> targetAmount;
  final Value<int> currentAmount;
  final Value<String> currency;
  final Value<String> accentColor;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const GoalsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.targetAmount = const Value.absent(),
    this.currentAmount = const Value.absent(),
    this.currency = const Value.absent(),
    this.accentColor = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalsCompanion.insert({
    required String id,
    required String name,
    required int targetAmount,
    required int currentAmount,
    required String currency,
    required String accentColor,
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        targetAmount = Value(targetAmount),
        currentAmount = Value(currentAmount),
        currency = Value(currency),
        accentColor = Value(accentColor),
        createdAt = Value(createdAt);
  static Insertable<Goal> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? targetAmount,
    Expression<int>? currentAmount,
    Expression<String>? currency,
    Expression<String>? accentColor,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (targetAmount != null) 'target_amount': targetAmount,
      if (currentAmount != null) 'current_amount': currentAmount,
      if (currency != null) 'currency': currency,
      if (accentColor != null) 'accent_color': accentColor,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<int>? targetAmount,
      Value<int>? currentAmount,
      Value<String>? currency,
      Value<String>? accentColor,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? rowid}) {
    return GoalsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      targetAmount: targetAmount ?? this.targetAmount,
      currentAmount: currentAmount ?? this.currentAmount,
      currency: currency ?? this.currency,
      accentColor: accentColor ?? this.accentColor,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (targetAmount.present) {
      map['target_amount'] = Variable<int>(targetAmount.value);
    }
    if (currentAmount.present) {
      map['current_amount'] = Variable<int>(currentAmount.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (accentColor.present) {
      map['accent_color'] = Variable<String>(accentColor.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('targetAmount: $targetAmount, ')
          ..write('currentAmount: $currentAmount, ')
          ..write('currency: $currency, ')
          ..write('accentColor: $accentColor, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DepositsTable extends Deposits with TableInfo<$DepositsTable, Deposit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DepositsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _goalAAmountMeta =
      const VerificationMeta('goalAAmount');
  @override
  late final GeneratedColumn<int> goalAAmount = GeneratedColumn<int>(
      'goal_a_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _goalBAmountMeta =
      const VerificationMeta('goalBAmount');
  @override
  late final GeneratedColumn<int> goalBAmount = GeneratedColumn<int>(
      'goal_b_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        amount,
        goalAAmount,
        goalBAmount,
        note,
        createdAt,
        isDeleted,
        updatedAt,
        isSynced
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'deposits';
  @override
  VerificationContext validateIntegrity(Insertable<Deposit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('goal_a_amount')) {
      context.handle(
          _goalAAmountMeta,
          goalAAmount.isAcceptableOrUnknown(
              data['goal_a_amount']!, _goalAAmountMeta));
    } else if (isInserting) {
      context.missing(_goalAAmountMeta);
    }
    if (data.containsKey('goal_b_amount')) {
      context.handle(
          _goalBAmountMeta,
          goalBAmount.isAcceptableOrUnknown(
              data['goal_b_amount']!, _goalBAmountMeta));
    } else if (isInserting) {
      context.missing(_goalBAmountMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Deposit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Deposit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      goalAAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}goal_a_amount'])!,
      goalBAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}goal_b_amount'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $DepositsTable createAlias(String alias) {
    return $DepositsTable(attachedDatabase, alias);
  }
}

class Deposit extends DataClass implements Insertable<Deposit> {
  final String id;

  /// Total deposit amount in minor units (kopecks).
  final int amount;

  /// Amount allocated to Goal A in minor units (kopecks).
  final int goalAAmount;

  /// Amount allocated to Goal B in minor units (kopecks).
  final int goalBAmount;
  final String? note;
  final DateTime createdAt;
  final bool isDeleted;
  final DateTime? updatedAt;
  final bool isSynced;
  const Deposit(
      {required this.id,
      required this.amount,
      required this.goalAAmount,
      required this.goalBAmount,
      this.note,
      required this.createdAt,
      required this.isDeleted,
      this.updatedAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['amount'] = Variable<int>(amount);
    map['goal_a_amount'] = Variable<int>(goalAAmount);
    map['goal_b_amount'] = Variable<int>(goalBAmount);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  DepositsCompanion toCompanion(bool nullToAbsent) {
    return DepositsCompanion(
      id: Value(id),
      amount: Value(amount),
      goalAAmount: Value(goalAAmount),
      goalBAmount: Value(goalBAmount),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
      isDeleted: Value(isDeleted),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory Deposit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Deposit(
      id: serializer.fromJson<String>(json['id']),
      amount: serializer.fromJson<int>(json['amount']),
      goalAAmount: serializer.fromJson<int>(json['goalAAmount']),
      goalBAmount: serializer.fromJson<int>(json['goalBAmount']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'amount': serializer.toJson<int>(amount),
      'goalAAmount': serializer.toJson<int>(goalAAmount),
      'goalBAmount': serializer.toJson<int>(goalBAmount),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  Deposit copyWith(
          {String? id,
          int? amount,
          int? goalAAmount,
          int? goalBAmount,
          Value<String?> note = const Value.absent(),
          DateTime? createdAt,
          bool? isDeleted,
          Value<DateTime?> updatedAt = const Value.absent(),
          bool? isSynced}) =>
      Deposit(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        goalAAmount: goalAAmount ?? this.goalAAmount,
        goalBAmount: goalBAmount ?? this.goalBAmount,
        note: note.present ? note.value : this.note,
        createdAt: createdAt ?? this.createdAt,
        isDeleted: isDeleted ?? this.isDeleted,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
      );
  Deposit copyWithCompanion(DepositsCompanion data) {
    return Deposit(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      goalAAmount:
          data.goalAAmount.present ? data.goalAAmount.value : this.goalAAmount,
      goalBAmount:
          data.goalBAmount.present ? data.goalBAmount.value : this.goalBAmount,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Deposit(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('goalAAmount: $goalAAmount, ')
          ..write('goalBAmount: $goalBAmount, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amount, goalAAmount, goalBAmount, note,
      createdAt, isDeleted, updatedAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Deposit &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.goalAAmount == this.goalAAmount &&
          other.goalBAmount == this.goalBAmount &&
          other.note == this.note &&
          other.createdAt == this.createdAt &&
          other.isDeleted == this.isDeleted &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class DepositsCompanion extends UpdateCompanion<Deposit> {
  final Value<String> id;
  final Value<int> amount;
  final Value<int> goalAAmount;
  final Value<int> goalBAmount;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  final Value<bool> isDeleted;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const DepositsCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.goalAAmount = const Value.absent(),
    this.goalBAmount = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DepositsCompanion.insert({
    required String id,
    required int amount,
    required int goalAAmount,
    required int goalBAmount,
    this.note = const Value.absent(),
    required DateTime createdAt,
    this.isDeleted = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        amount = Value(amount),
        goalAAmount = Value(goalAAmount),
        goalBAmount = Value(goalBAmount),
        createdAt = Value(createdAt);
  static Insertable<Deposit> custom({
    Expression<String>? id,
    Expression<int>? amount,
    Expression<int>? goalAAmount,
    Expression<int>? goalBAmount,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
    Expression<bool>? isDeleted,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (goalAAmount != null) 'goal_a_amount': goalAAmount,
      if (goalBAmount != null) 'goal_b_amount': goalBAmount,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DepositsCompanion copyWith(
      {Value<String>? id,
      Value<int>? amount,
      Value<int>? goalAAmount,
      Value<int>? goalBAmount,
      Value<String?>? note,
      Value<DateTime>? createdAt,
      Value<bool>? isDeleted,
      Value<DateTime?>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? rowid}) {
    return DepositsCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      goalAAmount: goalAAmount ?? this.goalAAmount,
      goalBAmount: goalBAmount ?? this.goalBAmount,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      isDeleted: isDeleted ?? this.isDeleted,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (goalAAmount.present) {
      map['goal_a_amount'] = Variable<int>(goalAAmount.value);
    }
    if (goalBAmount.present) {
      map['goal_b_amount'] = Variable<int>(goalBAmount.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DepositsCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('goalAAmount: $goalAAmount, ')
          ..write('goalBAmount: $goalBAmount, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DepositAllocationsTable extends DepositAllocations
    with TableInfo<$DepositAllocationsTable, DepositAllocation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DepositAllocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _depositIdMeta =
      const VerificationMeta('depositId');
  @override
  late final GeneratedColumn<String> depositId = GeneratedColumn<String>(
      'deposit_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _goalIdMeta = const VerificationMeta('goalId');
  @override
  late final GeneratedColumn<String> goalId = GeneratedColumn<String>(
      'goal_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, depositId, goalId, amount, updatedAt, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'deposit_allocations';
  @override
  VerificationContext validateIntegrity(Insertable<DepositAllocation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('deposit_id')) {
      context.handle(_depositIdMeta,
          depositId.isAcceptableOrUnknown(data['deposit_id']!, _depositIdMeta));
    } else if (isInserting) {
      context.missing(_depositIdMeta);
    }
    if (data.containsKey('goal_id')) {
      context.handle(_goalIdMeta,
          goalId.isAcceptableOrUnknown(data['goal_id']!, _goalIdMeta));
    } else if (isInserting) {
      context.missing(_goalIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DepositAllocation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DepositAllocation(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      depositId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deposit_id'])!,
      goalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}goal_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $DepositAllocationsTable createAlias(String alias) {
    return $DepositAllocationsTable(attachedDatabase, alias);
  }
}

class DepositAllocation extends DataClass
    implements Insertable<DepositAllocation> {
  final String id;
  final String depositId;
  final String goalId;
  final int amount;
  final DateTime? updatedAt;
  final bool isSynced;
  const DepositAllocation(
      {required this.id,
      required this.depositId,
      required this.goalId,
      required this.amount,
      this.updatedAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['deposit_id'] = Variable<String>(depositId);
    map['goal_id'] = Variable<String>(goalId);
    map['amount'] = Variable<int>(amount);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  DepositAllocationsCompanion toCompanion(bool nullToAbsent) {
    return DepositAllocationsCompanion(
      id: Value(id),
      depositId: Value(depositId),
      goalId: Value(goalId),
      amount: Value(amount),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory DepositAllocation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DepositAllocation(
      id: serializer.fromJson<String>(json['id']),
      depositId: serializer.fromJson<String>(json['depositId']),
      goalId: serializer.fromJson<String>(json['goalId']),
      amount: serializer.fromJson<int>(json['amount']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'depositId': serializer.toJson<String>(depositId),
      'goalId': serializer.toJson<String>(goalId),
      'amount': serializer.toJson<int>(amount),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  DepositAllocation copyWith(
          {String? id,
          String? depositId,
          String? goalId,
          int? amount,
          Value<DateTime?> updatedAt = const Value.absent(),
          bool? isSynced}) =>
      DepositAllocation(
        id: id ?? this.id,
        depositId: depositId ?? this.depositId,
        goalId: goalId ?? this.goalId,
        amount: amount ?? this.amount,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
      );
  DepositAllocation copyWithCompanion(DepositAllocationsCompanion data) {
    return DepositAllocation(
      id: data.id.present ? data.id.value : this.id,
      depositId: data.depositId.present ? data.depositId.value : this.depositId,
      goalId: data.goalId.present ? data.goalId.value : this.goalId,
      amount: data.amount.present ? data.amount.value : this.amount,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DepositAllocation(')
          ..write('id: $id, ')
          ..write('depositId: $depositId, ')
          ..write('goalId: $goalId, ')
          ..write('amount: $amount, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, depositId, goalId, amount, updatedAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DepositAllocation &&
          other.id == this.id &&
          other.depositId == this.depositId &&
          other.goalId == this.goalId &&
          other.amount == this.amount &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class DepositAllocationsCompanion extends UpdateCompanion<DepositAllocation> {
  final Value<String> id;
  final Value<String> depositId;
  final Value<String> goalId;
  final Value<int> amount;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const DepositAllocationsCompanion({
    this.id = const Value.absent(),
    this.depositId = const Value.absent(),
    this.goalId = const Value.absent(),
    this.amount = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DepositAllocationsCompanion.insert({
    required String id,
    required String depositId,
    required String goalId,
    required int amount,
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        depositId = Value(depositId),
        goalId = Value(goalId),
        amount = Value(amount);
  static Insertable<DepositAllocation> custom({
    Expression<String>? id,
    Expression<String>? depositId,
    Expression<String>? goalId,
    Expression<int>? amount,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (depositId != null) 'deposit_id': depositId,
      if (goalId != null) 'goal_id': goalId,
      if (amount != null) 'amount': amount,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DepositAllocationsCompanion copyWith(
      {Value<String>? id,
      Value<String>? depositId,
      Value<String>? goalId,
      Value<int>? amount,
      Value<DateTime?>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? rowid}) {
    return DepositAllocationsCompanion(
      id: id ?? this.id,
      depositId: depositId ?? this.depositId,
      goalId: goalId ?? this.goalId,
      amount: amount ?? this.amount,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (depositId.present) {
      map['deposit_id'] = Variable<String>(depositId.value);
    }
    if (goalId.present) {
      map['goal_id'] = Variable<String>(goalId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DepositAllocationsCompanion(')
          ..write('id: $id, ')
          ..write('depositId: $depositId, ')
          ..write('goalId: $goalId, ')
          ..write('amount: $amount, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, UserProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _xpMeta = const VerificationMeta('xp');
  @override
  late final GeneratedColumn<int> xp = GeneratedColumn<int>(
      'xp', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
      'level', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _streakCountMeta =
      const VerificationMeta('streakCount');
  @override
  late final GeneratedColumn<int> streakCount = GeneratedColumn<int>(
      'streak_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _maxStreakMeta =
      const VerificationMeta('maxStreak');
  @override
  late final GeneratedColumn<int> maxStreak = GeneratedColumn<int>(
      'max_streak', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _freezeTokensMeta =
      const VerificationMeta('freezeTokens');
  @override
  late final GeneratedColumn<int> freezeTokens = GeneratedColumn<int>(
      'freeze_tokens', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastDepositDateMeta =
      const VerificationMeta('lastDepositDate');
  @override
  late final GeneratedColumn<DateTime> lastDepositDate =
      GeneratedColumn<DateTime>('last_deposit_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _skillPointsMeta =
      const VerificationMeta('skillPoints');
  @override
  late final GeneratedColumn<int> skillPoints = GeneratedColumn<int>(
      'skill_points', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _playerClassMeta =
      const VerificationMeta('playerClass');
  @override
  late final GeneratedColumn<String> playerClass = GeneratedColumn<String>(
      'player_class', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _currentThemeMeta =
      const VerificationMeta('currentTheme');
  @override
  late final GeneratedColumn<String> currentTheme = GeneratedColumn<String>(
      'current_theme', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('default'));
  static const VerificationMeta _avatarConfigMeta =
      const VerificationMeta('avatarConfig');
  @override
  late final GeneratedColumn<String> avatarConfig = GeneratedColumn<String>(
      'avatar_config', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _penaltyBalanceMeta =
      const VerificationMeta('penaltyBalance');
  @override
  late final GeneratedColumn<int> penaltyBalance = GeneratedColumn<int>(
      'penalty_balance', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _hackerXpMeta =
      const VerificationMeta('hackerXp');
  @override
  late final GeneratedColumn<int> hackerXp = GeneratedColumn<int>(
      'hacker_xp', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _magnateXpMeta =
      const VerificationMeta('magnateXp');
  @override
  late final GeneratedColumn<int> magnateXp = GeneratedColumn<int>(
      'magnate_xp', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _resilienceXpMeta =
      const VerificationMeta('resilienceXp');
  @override
  late final GeneratedColumn<int> resilienceXp = GeneratedColumn<int>(
      'resilience_xp', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastBonusClaimDateMeta =
      const VerificationMeta('lastBonusClaimDate');
  @override
  late final GeneratedColumn<DateTime> lastBonusClaimDate =
      GeneratedColumn<DateTime>('last_bonus_claim_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _bonusStreakMeta =
      const VerificationMeta('bonusStreak');
  @override
  late final GeneratedColumn<int> bonusStreak = GeneratedColumn<int>(
      'bonus_streak', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _crystalsBalanceMeta =
      const VerificationMeta('crystalsBalance');
  @override
  late final GeneratedColumn<int> crystalsBalance = GeneratedColumn<int>(
      'crystals_balance', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        xp,
        level,
        streakCount,
        maxStreak,
        freezeTokens,
        lastDepositDate,
        skillPoints,
        playerClass,
        currentTheme,
        avatarConfig,
        penaltyBalance,
        hackerXp,
        magnateXp,
        resilienceXp,
        lastBonusClaimDate,
        bonusStreak,
        crystalsBalance,
        updatedAt,
        isSynced
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(Insertable<UserProfile> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('xp')) {
      context.handle(_xpMeta, xp.isAcceptableOrUnknown(data['xp']!, _xpMeta));
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    }
    if (data.containsKey('streak_count')) {
      context.handle(
          _streakCountMeta,
          streakCount.isAcceptableOrUnknown(
              data['streak_count']!, _streakCountMeta));
    }
    if (data.containsKey('max_streak')) {
      context.handle(_maxStreakMeta,
          maxStreak.isAcceptableOrUnknown(data['max_streak']!, _maxStreakMeta));
    }
    if (data.containsKey('freeze_tokens')) {
      context.handle(
          _freezeTokensMeta,
          freezeTokens.isAcceptableOrUnknown(
              data['freeze_tokens']!, _freezeTokensMeta));
    }
    if (data.containsKey('last_deposit_date')) {
      context.handle(
          _lastDepositDateMeta,
          lastDepositDate.isAcceptableOrUnknown(
              data['last_deposit_date']!, _lastDepositDateMeta));
    }
    if (data.containsKey('skill_points')) {
      context.handle(
          _skillPointsMeta,
          skillPoints.isAcceptableOrUnknown(
              data['skill_points']!, _skillPointsMeta));
    }
    if (data.containsKey('player_class')) {
      context.handle(
          _playerClassMeta,
          playerClass.isAcceptableOrUnknown(
              data['player_class']!, _playerClassMeta));
    }
    if (data.containsKey('current_theme')) {
      context.handle(
          _currentThemeMeta,
          currentTheme.isAcceptableOrUnknown(
              data['current_theme']!, _currentThemeMeta));
    }
    if (data.containsKey('avatar_config')) {
      context.handle(
          _avatarConfigMeta,
          avatarConfig.isAcceptableOrUnknown(
              data['avatar_config']!, _avatarConfigMeta));
    }
    if (data.containsKey('penalty_balance')) {
      context.handle(
          _penaltyBalanceMeta,
          penaltyBalance.isAcceptableOrUnknown(
              data['penalty_balance']!, _penaltyBalanceMeta));
    }
    if (data.containsKey('hacker_xp')) {
      context.handle(_hackerXpMeta,
          hackerXp.isAcceptableOrUnknown(data['hacker_xp']!, _hackerXpMeta));
    }
    if (data.containsKey('magnate_xp')) {
      context.handle(_magnateXpMeta,
          magnateXp.isAcceptableOrUnknown(data['magnate_xp']!, _magnateXpMeta));
    }
    if (data.containsKey('resilience_xp')) {
      context.handle(
          _resilienceXpMeta,
          resilienceXp.isAcceptableOrUnknown(
              data['resilience_xp']!, _resilienceXpMeta));
    }
    if (data.containsKey('last_bonus_claim_date')) {
      context.handle(
          _lastBonusClaimDateMeta,
          lastBonusClaimDate.isAcceptableOrUnknown(
              data['last_bonus_claim_date']!, _lastBonusClaimDateMeta));
    }
    if (data.containsKey('bonus_streak')) {
      context.handle(
          _bonusStreakMeta,
          bonusStreak.isAcceptableOrUnknown(
              data['bonus_streak']!, _bonusStreakMeta));
    }
    if (data.containsKey('crystals_balance')) {
      context.handle(
          _crystalsBalanceMeta,
          crystalsBalance.isAcceptableOrUnknown(
              data['crystals_balance']!, _crystalsBalanceMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfile(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      xp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}xp'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])!,
      streakCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}streak_count'])!,
      maxStreak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_streak'])!,
      freezeTokens: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}freeze_tokens'])!,
      lastDepositDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_deposit_date']),
      skillPoints: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}skill_points'])!,
      playerClass: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}player_class']),
      currentTheme: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}current_theme'])!,
      avatarConfig: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}avatar_config']),
      penaltyBalance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}penalty_balance'])!,
      hackerXp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hacker_xp'])!,
      magnateXp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}magnate_xp'])!,
      resilienceXp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}resilience_xp'])!,
      lastBonusClaimDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}last_bonus_claim_date']),
      bonusStreak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bonus_streak'])!,
      crystalsBalance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}crystals_balance'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }
}

class UserProfile extends DataClass implements Insertable<UserProfile> {
  final int id;
  final int xp;
  final int level;
  final int streakCount;
  final int maxStreak;
  final int freezeTokens;
  final DateTime? lastDepositDate;
  final int skillPoints;
  final String? playerClass;
  final String currentTheme;
  final String? avatarConfig;
  final int penaltyBalance;
  final int hackerXp;
  final int magnateXp;
  final int resilienceXp;
  final DateTime? lastBonusClaimDate;
  final int bonusStreak;
  final int crystalsBalance;
  final DateTime? updatedAt;
  final bool isSynced;
  const UserProfile(
      {required this.id,
      required this.xp,
      required this.level,
      required this.streakCount,
      required this.maxStreak,
      required this.freezeTokens,
      this.lastDepositDate,
      required this.skillPoints,
      this.playerClass,
      required this.currentTheme,
      this.avatarConfig,
      required this.penaltyBalance,
      required this.hackerXp,
      required this.magnateXp,
      required this.resilienceXp,
      this.lastBonusClaimDate,
      required this.bonusStreak,
      required this.crystalsBalance,
      this.updatedAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['xp'] = Variable<int>(xp);
    map['level'] = Variable<int>(level);
    map['streak_count'] = Variable<int>(streakCount);
    map['max_streak'] = Variable<int>(maxStreak);
    map['freeze_tokens'] = Variable<int>(freezeTokens);
    if (!nullToAbsent || lastDepositDate != null) {
      map['last_deposit_date'] = Variable<DateTime>(lastDepositDate);
    }
    map['skill_points'] = Variable<int>(skillPoints);
    if (!nullToAbsent || playerClass != null) {
      map['player_class'] = Variable<String>(playerClass);
    }
    map['current_theme'] = Variable<String>(currentTheme);
    if (!nullToAbsent || avatarConfig != null) {
      map['avatar_config'] = Variable<String>(avatarConfig);
    }
    map['penalty_balance'] = Variable<int>(penaltyBalance);
    map['hacker_xp'] = Variable<int>(hackerXp);
    map['magnate_xp'] = Variable<int>(magnateXp);
    map['resilience_xp'] = Variable<int>(resilienceXp);
    if (!nullToAbsent || lastBonusClaimDate != null) {
      map['last_bonus_claim_date'] = Variable<DateTime>(lastBonusClaimDate);
    }
    map['bonus_streak'] = Variable<int>(bonusStreak);
    map['crystals_balance'] = Variable<int>(crystalsBalance);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      id: Value(id),
      xp: Value(xp),
      level: Value(level),
      streakCount: Value(streakCount),
      maxStreak: Value(maxStreak),
      freezeTokens: Value(freezeTokens),
      lastDepositDate: lastDepositDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastDepositDate),
      skillPoints: Value(skillPoints),
      playerClass: playerClass == null && nullToAbsent
          ? const Value.absent()
          : Value(playerClass),
      currentTheme: Value(currentTheme),
      avatarConfig: avatarConfig == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarConfig),
      penaltyBalance: Value(penaltyBalance),
      hackerXp: Value(hackerXp),
      magnateXp: Value(magnateXp),
      resilienceXp: Value(resilienceXp),
      lastBonusClaimDate: lastBonusClaimDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastBonusClaimDate),
      bonusStreak: Value(bonusStreak),
      crystalsBalance: Value(crystalsBalance),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory UserProfile.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfile(
      id: serializer.fromJson<int>(json['id']),
      xp: serializer.fromJson<int>(json['xp']),
      level: serializer.fromJson<int>(json['level']),
      streakCount: serializer.fromJson<int>(json['streakCount']),
      maxStreak: serializer.fromJson<int>(json['maxStreak']),
      freezeTokens: serializer.fromJson<int>(json['freezeTokens']),
      lastDepositDate: serializer.fromJson<DateTime?>(json['lastDepositDate']),
      skillPoints: serializer.fromJson<int>(json['skillPoints']),
      playerClass: serializer.fromJson<String?>(json['playerClass']),
      currentTheme: serializer.fromJson<String>(json['currentTheme']),
      avatarConfig: serializer.fromJson<String?>(json['avatarConfig']),
      penaltyBalance: serializer.fromJson<int>(json['penaltyBalance']),
      hackerXp: serializer.fromJson<int>(json['hackerXp']),
      magnateXp: serializer.fromJson<int>(json['magnateXp']),
      resilienceXp: serializer.fromJson<int>(json['resilienceXp']),
      lastBonusClaimDate:
          serializer.fromJson<DateTime?>(json['lastBonusClaimDate']),
      bonusStreak: serializer.fromJson<int>(json['bonusStreak']),
      crystalsBalance: serializer.fromJson<int>(json['crystalsBalance']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'xp': serializer.toJson<int>(xp),
      'level': serializer.toJson<int>(level),
      'streakCount': serializer.toJson<int>(streakCount),
      'maxStreak': serializer.toJson<int>(maxStreak),
      'freezeTokens': serializer.toJson<int>(freezeTokens),
      'lastDepositDate': serializer.toJson<DateTime?>(lastDepositDate),
      'skillPoints': serializer.toJson<int>(skillPoints),
      'playerClass': serializer.toJson<String?>(playerClass),
      'currentTheme': serializer.toJson<String>(currentTheme),
      'avatarConfig': serializer.toJson<String?>(avatarConfig),
      'penaltyBalance': serializer.toJson<int>(penaltyBalance),
      'hackerXp': serializer.toJson<int>(hackerXp),
      'magnateXp': serializer.toJson<int>(magnateXp),
      'resilienceXp': serializer.toJson<int>(resilienceXp),
      'lastBonusClaimDate': serializer.toJson<DateTime?>(lastBonusClaimDate),
      'bonusStreak': serializer.toJson<int>(bonusStreak),
      'crystalsBalance': serializer.toJson<int>(crystalsBalance),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  UserProfile copyWith(
          {int? id,
          int? xp,
          int? level,
          int? streakCount,
          int? maxStreak,
          int? freezeTokens,
          Value<DateTime?> lastDepositDate = const Value.absent(),
          int? skillPoints,
          Value<String?> playerClass = const Value.absent(),
          String? currentTheme,
          Value<String?> avatarConfig = const Value.absent(),
          int? penaltyBalance,
          int? hackerXp,
          int? magnateXp,
          int? resilienceXp,
          Value<DateTime?> lastBonusClaimDate = const Value.absent(),
          int? bonusStreak,
          int? crystalsBalance,
          Value<DateTime?> updatedAt = const Value.absent(),
          bool? isSynced}) =>
      UserProfile(
        id: id ?? this.id,
        xp: xp ?? this.xp,
        level: level ?? this.level,
        streakCount: streakCount ?? this.streakCount,
        maxStreak: maxStreak ?? this.maxStreak,
        freezeTokens: freezeTokens ?? this.freezeTokens,
        lastDepositDate: lastDepositDate.present
            ? lastDepositDate.value
            : this.lastDepositDate,
        skillPoints: skillPoints ?? this.skillPoints,
        playerClass: playerClass.present ? playerClass.value : this.playerClass,
        currentTheme: currentTheme ?? this.currentTheme,
        avatarConfig:
            avatarConfig.present ? avatarConfig.value : this.avatarConfig,
        penaltyBalance: penaltyBalance ?? this.penaltyBalance,
        hackerXp: hackerXp ?? this.hackerXp,
        magnateXp: magnateXp ?? this.magnateXp,
        resilienceXp: resilienceXp ?? this.resilienceXp,
        lastBonusClaimDate: lastBonusClaimDate.present
            ? lastBonusClaimDate.value
            : this.lastBonusClaimDate,
        bonusStreak: bonusStreak ?? this.bonusStreak,
        crystalsBalance: crystalsBalance ?? this.crystalsBalance,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
      );
  UserProfile copyWithCompanion(UserProfilesCompanion data) {
    return UserProfile(
      id: data.id.present ? data.id.value : this.id,
      xp: data.xp.present ? data.xp.value : this.xp,
      level: data.level.present ? data.level.value : this.level,
      streakCount:
          data.streakCount.present ? data.streakCount.value : this.streakCount,
      maxStreak: data.maxStreak.present ? data.maxStreak.value : this.maxStreak,
      freezeTokens: data.freezeTokens.present
          ? data.freezeTokens.value
          : this.freezeTokens,
      lastDepositDate: data.lastDepositDate.present
          ? data.lastDepositDate.value
          : this.lastDepositDate,
      skillPoints:
          data.skillPoints.present ? data.skillPoints.value : this.skillPoints,
      playerClass:
          data.playerClass.present ? data.playerClass.value : this.playerClass,
      currentTheme: data.currentTheme.present
          ? data.currentTheme.value
          : this.currentTheme,
      avatarConfig: data.avatarConfig.present
          ? data.avatarConfig.value
          : this.avatarConfig,
      penaltyBalance: data.penaltyBalance.present
          ? data.penaltyBalance.value
          : this.penaltyBalance,
      hackerXp: data.hackerXp.present ? data.hackerXp.value : this.hackerXp,
      magnateXp: data.magnateXp.present ? data.magnateXp.value : this.magnateXp,
      resilienceXp: data.resilienceXp.present
          ? data.resilienceXp.value
          : this.resilienceXp,
      lastBonusClaimDate: data.lastBonusClaimDate.present
          ? data.lastBonusClaimDate.value
          : this.lastBonusClaimDate,
      bonusStreak:
          data.bonusStreak.present ? data.bonusStreak.value : this.bonusStreak,
      crystalsBalance: data.crystalsBalance.present
          ? data.crystalsBalance.value
          : this.crystalsBalance,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfile(')
          ..write('id: $id, ')
          ..write('xp: $xp, ')
          ..write('level: $level, ')
          ..write('streakCount: $streakCount, ')
          ..write('maxStreak: $maxStreak, ')
          ..write('freezeTokens: $freezeTokens, ')
          ..write('lastDepositDate: $lastDepositDate, ')
          ..write('skillPoints: $skillPoints, ')
          ..write('playerClass: $playerClass, ')
          ..write('currentTheme: $currentTheme, ')
          ..write('avatarConfig: $avatarConfig, ')
          ..write('penaltyBalance: $penaltyBalance, ')
          ..write('hackerXp: $hackerXp, ')
          ..write('magnateXp: $magnateXp, ')
          ..write('resilienceXp: $resilienceXp, ')
          ..write('lastBonusClaimDate: $lastBonusClaimDate, ')
          ..write('bonusStreak: $bonusStreak, ')
          ..write('crystalsBalance: $crystalsBalance, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      xp,
      level,
      streakCount,
      maxStreak,
      freezeTokens,
      lastDepositDate,
      skillPoints,
      playerClass,
      currentTheme,
      avatarConfig,
      penaltyBalance,
      hackerXp,
      magnateXp,
      resilienceXp,
      lastBonusClaimDate,
      bonusStreak,
      crystalsBalance,
      updatedAt,
      isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfile &&
          other.id == this.id &&
          other.xp == this.xp &&
          other.level == this.level &&
          other.streakCount == this.streakCount &&
          other.maxStreak == this.maxStreak &&
          other.freezeTokens == this.freezeTokens &&
          other.lastDepositDate == this.lastDepositDate &&
          other.skillPoints == this.skillPoints &&
          other.playerClass == this.playerClass &&
          other.currentTheme == this.currentTheme &&
          other.avatarConfig == this.avatarConfig &&
          other.penaltyBalance == this.penaltyBalance &&
          other.hackerXp == this.hackerXp &&
          other.magnateXp == this.magnateXp &&
          other.resilienceXp == this.resilienceXp &&
          other.lastBonusClaimDate == this.lastBonusClaimDate &&
          other.bonusStreak == this.bonusStreak &&
          other.crystalsBalance == this.crystalsBalance &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfile> {
  final Value<int> id;
  final Value<int> xp;
  final Value<int> level;
  final Value<int> streakCount;
  final Value<int> maxStreak;
  final Value<int> freezeTokens;
  final Value<DateTime?> lastDepositDate;
  final Value<int> skillPoints;
  final Value<String?> playerClass;
  final Value<String> currentTheme;
  final Value<String?> avatarConfig;
  final Value<int> penaltyBalance;
  final Value<int> hackerXp;
  final Value<int> magnateXp;
  final Value<int> resilienceXp;
  final Value<DateTime?> lastBonusClaimDate;
  final Value<int> bonusStreak;
  final Value<int> crystalsBalance;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  const UserProfilesCompanion({
    this.id = const Value.absent(),
    this.xp = const Value.absent(),
    this.level = const Value.absent(),
    this.streakCount = const Value.absent(),
    this.maxStreak = const Value.absent(),
    this.freezeTokens = const Value.absent(),
    this.lastDepositDate = const Value.absent(),
    this.skillPoints = const Value.absent(),
    this.playerClass = const Value.absent(),
    this.currentTheme = const Value.absent(),
    this.avatarConfig = const Value.absent(),
    this.penaltyBalance = const Value.absent(),
    this.hackerXp = const Value.absent(),
    this.magnateXp = const Value.absent(),
    this.resilienceXp = const Value.absent(),
    this.lastBonusClaimDate = const Value.absent(),
    this.bonusStreak = const Value.absent(),
    this.crystalsBalance = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    this.id = const Value.absent(),
    this.xp = const Value.absent(),
    this.level = const Value.absent(),
    this.streakCount = const Value.absent(),
    this.maxStreak = const Value.absent(),
    this.freezeTokens = const Value.absent(),
    this.lastDepositDate = const Value.absent(),
    this.skillPoints = const Value.absent(),
    this.playerClass = const Value.absent(),
    this.currentTheme = const Value.absent(),
    this.avatarConfig = const Value.absent(),
    this.penaltyBalance = const Value.absent(),
    this.hackerXp = const Value.absent(),
    this.magnateXp = const Value.absent(),
    this.resilienceXp = const Value.absent(),
    this.lastBonusClaimDate = const Value.absent(),
    this.bonusStreak = const Value.absent(),
    this.crystalsBalance = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
  });
  static Insertable<UserProfile> custom({
    Expression<int>? id,
    Expression<int>? xp,
    Expression<int>? level,
    Expression<int>? streakCount,
    Expression<int>? maxStreak,
    Expression<int>? freezeTokens,
    Expression<DateTime>? lastDepositDate,
    Expression<int>? skillPoints,
    Expression<String>? playerClass,
    Expression<String>? currentTheme,
    Expression<String>? avatarConfig,
    Expression<int>? penaltyBalance,
    Expression<int>? hackerXp,
    Expression<int>? magnateXp,
    Expression<int>? resilienceXp,
    Expression<DateTime>? lastBonusClaimDate,
    Expression<int>? bonusStreak,
    Expression<int>? crystalsBalance,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (xp != null) 'xp': xp,
      if (level != null) 'level': level,
      if (streakCount != null) 'streak_count': streakCount,
      if (maxStreak != null) 'max_streak': maxStreak,
      if (freezeTokens != null) 'freeze_tokens': freezeTokens,
      if (lastDepositDate != null) 'last_deposit_date': lastDepositDate,
      if (skillPoints != null) 'skill_points': skillPoints,
      if (playerClass != null) 'player_class': playerClass,
      if (currentTheme != null) 'current_theme': currentTheme,
      if (avatarConfig != null) 'avatar_config': avatarConfig,
      if (penaltyBalance != null) 'penalty_balance': penaltyBalance,
      if (hackerXp != null) 'hacker_xp': hackerXp,
      if (magnateXp != null) 'magnate_xp': magnateXp,
      if (resilienceXp != null) 'resilience_xp': resilienceXp,
      if (lastBonusClaimDate != null)
        'last_bonus_claim_date': lastBonusClaimDate,
      if (bonusStreak != null) 'bonus_streak': bonusStreak,
      if (crystalsBalance != null) 'crystals_balance': crystalsBalance,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  UserProfilesCompanion copyWith(
      {Value<int>? id,
      Value<int>? xp,
      Value<int>? level,
      Value<int>? streakCount,
      Value<int>? maxStreak,
      Value<int>? freezeTokens,
      Value<DateTime?>? lastDepositDate,
      Value<int>? skillPoints,
      Value<String?>? playerClass,
      Value<String>? currentTheme,
      Value<String?>? avatarConfig,
      Value<int>? penaltyBalance,
      Value<int>? hackerXp,
      Value<int>? magnateXp,
      Value<int>? resilienceXp,
      Value<DateTime?>? lastBonusClaimDate,
      Value<int>? bonusStreak,
      Value<int>? crystalsBalance,
      Value<DateTime?>? updatedAt,
      Value<bool>? isSynced}) {
    return UserProfilesCompanion(
      id: id ?? this.id,
      xp: xp ?? this.xp,
      level: level ?? this.level,
      streakCount: streakCount ?? this.streakCount,
      maxStreak: maxStreak ?? this.maxStreak,
      freezeTokens: freezeTokens ?? this.freezeTokens,
      lastDepositDate: lastDepositDate ?? this.lastDepositDate,
      skillPoints: skillPoints ?? this.skillPoints,
      playerClass: playerClass ?? this.playerClass,
      currentTheme: currentTheme ?? this.currentTheme,
      avatarConfig: avatarConfig ?? this.avatarConfig,
      penaltyBalance: penaltyBalance ?? this.penaltyBalance,
      hackerXp: hackerXp ?? this.hackerXp,
      magnateXp: magnateXp ?? this.magnateXp,
      resilienceXp: resilienceXp ?? this.resilienceXp,
      lastBonusClaimDate: lastBonusClaimDate ?? this.lastBonusClaimDate,
      bonusStreak: bonusStreak ?? this.bonusStreak,
      crystalsBalance: crystalsBalance ?? this.crystalsBalance,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (xp.present) {
      map['xp'] = Variable<int>(xp.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (streakCount.present) {
      map['streak_count'] = Variable<int>(streakCount.value);
    }
    if (maxStreak.present) {
      map['max_streak'] = Variable<int>(maxStreak.value);
    }
    if (freezeTokens.present) {
      map['freeze_tokens'] = Variable<int>(freezeTokens.value);
    }
    if (lastDepositDate.present) {
      map['last_deposit_date'] = Variable<DateTime>(lastDepositDate.value);
    }
    if (skillPoints.present) {
      map['skill_points'] = Variable<int>(skillPoints.value);
    }
    if (playerClass.present) {
      map['player_class'] = Variable<String>(playerClass.value);
    }
    if (currentTheme.present) {
      map['current_theme'] = Variable<String>(currentTheme.value);
    }
    if (avatarConfig.present) {
      map['avatar_config'] = Variable<String>(avatarConfig.value);
    }
    if (penaltyBalance.present) {
      map['penalty_balance'] = Variable<int>(penaltyBalance.value);
    }
    if (hackerXp.present) {
      map['hacker_xp'] = Variable<int>(hackerXp.value);
    }
    if (magnateXp.present) {
      map['magnate_xp'] = Variable<int>(magnateXp.value);
    }
    if (resilienceXp.present) {
      map['resilience_xp'] = Variable<int>(resilienceXp.value);
    }
    if (lastBonusClaimDate.present) {
      map['last_bonus_claim_date'] =
          Variable<DateTime>(lastBonusClaimDate.value);
    }
    if (bonusStreak.present) {
      map['bonus_streak'] = Variable<int>(bonusStreak.value);
    }
    if (crystalsBalance.present) {
      map['crystals_balance'] = Variable<int>(crystalsBalance.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('xp: $xp, ')
          ..write('level: $level, ')
          ..write('streakCount: $streakCount, ')
          ..write('maxStreak: $maxStreak, ')
          ..write('freezeTokens: $freezeTokens, ')
          ..write('lastDepositDate: $lastDepositDate, ')
          ..write('skillPoints: $skillPoints, ')
          ..write('playerClass: $playerClass, ')
          ..write('currentTheme: $currentTheme, ')
          ..write('avatarConfig: $avatarConfig, ')
          ..write('penaltyBalance: $penaltyBalance, ')
          ..write('hackerXp: $hackerXp, ')
          ..write('magnateXp: $magnateXp, ')
          ..write('resilienceXp: $resilienceXp, ')
          ..write('lastBonusClaimDate: $lastBonusClaimDate, ')
          ..write('bonusStreak: $bonusStreak, ')
          ..write('crystalsBalance: $crystalsBalance, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }
}

class $UnlockedAchievementsTable extends UnlockedAchievements
    with TableInfo<$UnlockedAchievementsTable, UnlockedAchievement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnlockedAchievementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unlockedAtMeta =
      const VerificationMeta('unlockedAt');
  @override
  late final GeneratedColumn<DateTime> unlockedAt = GeneratedColumn<DateTime>(
      'unlocked_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, unlockedAt, updatedAt, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unlocked_achievements';
  @override
  VerificationContext validateIntegrity(
      Insertable<UnlockedAchievement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('unlocked_at')) {
      context.handle(
          _unlockedAtMeta,
          unlockedAt.isAcceptableOrUnknown(
              data['unlocked_at']!, _unlockedAtMeta));
    } else if (isInserting) {
      context.missing(_unlockedAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UnlockedAchievement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnlockedAchievement(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      unlockedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}unlocked_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $UnlockedAchievementsTable createAlias(String alias) {
    return $UnlockedAchievementsTable(attachedDatabase, alias);
  }
}

class UnlockedAchievement extends DataClass
    implements Insertable<UnlockedAchievement> {
  final String id;
  final DateTime unlockedAt;
  final DateTime? updatedAt;
  final bool isSynced;
  const UnlockedAchievement(
      {required this.id,
      required this.unlockedAt,
      this.updatedAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['unlocked_at'] = Variable<DateTime>(unlockedAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  UnlockedAchievementsCompanion toCompanion(bool nullToAbsent) {
    return UnlockedAchievementsCompanion(
      id: Value(id),
      unlockedAt: Value(unlockedAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory UnlockedAchievement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnlockedAchievement(
      id: serializer.fromJson<String>(json['id']),
      unlockedAt: serializer.fromJson<DateTime>(json['unlockedAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'unlockedAt': serializer.toJson<DateTime>(unlockedAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  UnlockedAchievement copyWith(
          {String? id,
          DateTime? unlockedAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          bool? isSynced}) =>
      UnlockedAchievement(
        id: id ?? this.id,
        unlockedAt: unlockedAt ?? this.unlockedAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
      );
  UnlockedAchievement copyWithCompanion(UnlockedAchievementsCompanion data) {
    return UnlockedAchievement(
      id: data.id.present ? data.id.value : this.id,
      unlockedAt:
          data.unlockedAt.present ? data.unlockedAt.value : this.unlockedAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnlockedAchievement(')
          ..write('id: $id, ')
          ..write('unlockedAt: $unlockedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, unlockedAt, updatedAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnlockedAchievement &&
          other.id == this.id &&
          other.unlockedAt == this.unlockedAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class UnlockedAchievementsCompanion
    extends UpdateCompanion<UnlockedAchievement> {
  final Value<String> id;
  final Value<DateTime> unlockedAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const UnlockedAchievementsCompanion({
    this.id = const Value.absent(),
    this.unlockedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UnlockedAchievementsCompanion.insert({
    required String id,
    required DateTime unlockedAt,
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        unlockedAt = Value(unlockedAt);
  static Insertable<UnlockedAchievement> custom({
    Expression<String>? id,
    Expression<DateTime>? unlockedAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (unlockedAt != null) 'unlocked_at': unlockedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UnlockedAchievementsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? unlockedAt,
      Value<DateTime?>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? rowid}) {
    return UnlockedAchievementsCompanion(
      id: id ?? this.id,
      unlockedAt: unlockedAt ?? this.unlockedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (unlockedAt.present) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnlockedAchievementsCompanion(')
          ..write('id: $id, ')
          ..write('unlockedAt: $unlockedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UnlockedSkillsTable extends UnlockedSkills
    with TableInfo<$UnlockedSkillsTable, UnlockedSkill> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnlockedSkillsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unlockedAtMeta =
      const VerificationMeta('unlockedAt');
  @override
  late final GeneratedColumn<DateTime> unlockedAt = GeneratedColumn<DateTime>(
      'unlocked_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, unlockedAt, updatedAt, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unlocked_skills';
  @override
  VerificationContext validateIntegrity(Insertable<UnlockedSkill> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('unlocked_at')) {
      context.handle(
          _unlockedAtMeta,
          unlockedAt.isAcceptableOrUnknown(
              data['unlocked_at']!, _unlockedAtMeta));
    } else if (isInserting) {
      context.missing(_unlockedAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UnlockedSkill map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnlockedSkill(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      unlockedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}unlocked_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $UnlockedSkillsTable createAlias(String alias) {
    return $UnlockedSkillsTable(attachedDatabase, alias);
  }
}

class UnlockedSkill extends DataClass implements Insertable<UnlockedSkill> {
  final String id;
  final DateTime unlockedAt;
  final DateTime? updatedAt;
  final bool isSynced;
  const UnlockedSkill(
      {required this.id,
      required this.unlockedAt,
      this.updatedAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['unlocked_at'] = Variable<DateTime>(unlockedAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  UnlockedSkillsCompanion toCompanion(bool nullToAbsent) {
    return UnlockedSkillsCompanion(
      id: Value(id),
      unlockedAt: Value(unlockedAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory UnlockedSkill.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnlockedSkill(
      id: serializer.fromJson<String>(json['id']),
      unlockedAt: serializer.fromJson<DateTime>(json['unlockedAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'unlockedAt': serializer.toJson<DateTime>(unlockedAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  UnlockedSkill copyWith(
          {String? id,
          DateTime? unlockedAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          bool? isSynced}) =>
      UnlockedSkill(
        id: id ?? this.id,
        unlockedAt: unlockedAt ?? this.unlockedAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
      );
  UnlockedSkill copyWithCompanion(UnlockedSkillsCompanion data) {
    return UnlockedSkill(
      id: data.id.present ? data.id.value : this.id,
      unlockedAt:
          data.unlockedAt.present ? data.unlockedAt.value : this.unlockedAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnlockedSkill(')
          ..write('id: $id, ')
          ..write('unlockedAt: $unlockedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, unlockedAt, updatedAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnlockedSkill &&
          other.id == this.id &&
          other.unlockedAt == this.unlockedAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class UnlockedSkillsCompanion extends UpdateCompanion<UnlockedSkill> {
  final Value<String> id;
  final Value<DateTime> unlockedAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const UnlockedSkillsCompanion({
    this.id = const Value.absent(),
    this.unlockedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UnlockedSkillsCompanion.insert({
    required String id,
    required DateTime unlockedAt,
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        unlockedAt = Value(unlockedAt);
  static Insertable<UnlockedSkill> custom({
    Expression<String>? id,
    Expression<DateTime>? unlockedAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (unlockedAt != null) 'unlocked_at': unlockedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UnlockedSkillsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? unlockedAt,
      Value<DateTime?>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? rowid}) {
    return UnlockedSkillsCompanion(
      id: id ?? this.id,
      unlockedAt: unlockedAt ?? this.unlockedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (unlockedAt.present) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnlockedSkillsCompanion(')
          ..write('id: $id, ')
          ..write('unlockedAt: $unlockedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LootboxesTable extends Lootboxes
    with TableInfo<$LootboxesTable, Lootboxe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LootboxesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _rarityMeta = const VerificationMeta('rarity');
  @override
  late final GeneratedColumn<String> rarity = GeneratedColumn<String>(
      'rarity', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isOpenedMeta =
      const VerificationMeta('isOpened');
  @override
  late final GeneratedColumn<bool> isOpened = GeneratedColumn<bool>(
      'is_opened', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_opened" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _earnedAtMeta =
      const VerificationMeta('earnedAt');
  @override
  late final GeneratedColumn<DateTime> earnedAt = GeneratedColumn<DateTime>(
      'earned_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, rarity, isOpened, earnedAt, updatedAt, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lootboxes';
  @override
  VerificationContext validateIntegrity(Insertable<Lootboxe> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('rarity')) {
      context.handle(_rarityMeta,
          rarity.isAcceptableOrUnknown(data['rarity']!, _rarityMeta));
    } else if (isInserting) {
      context.missing(_rarityMeta);
    }
    if (data.containsKey('is_opened')) {
      context.handle(_isOpenedMeta,
          isOpened.isAcceptableOrUnknown(data['is_opened']!, _isOpenedMeta));
    }
    if (data.containsKey('earned_at')) {
      context.handle(_earnedAtMeta,
          earnedAt.isAcceptableOrUnknown(data['earned_at']!, _earnedAtMeta));
    } else if (isInserting) {
      context.missing(_earnedAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Lootboxe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Lootboxe(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      rarity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rarity'])!,
      isOpened: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_opened'])!,
      earnedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}earned_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $LootboxesTable createAlias(String alias) {
    return $LootboxesTable(attachedDatabase, alias);
  }
}

class Lootboxe extends DataClass implements Insertable<Lootboxe> {
  final String id;
  final String rarity;
  final bool isOpened;
  final DateTime earnedAt;
  final DateTime? updatedAt;
  final bool isSynced;
  const Lootboxe(
      {required this.id,
      required this.rarity,
      required this.isOpened,
      required this.earnedAt,
      this.updatedAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['rarity'] = Variable<String>(rarity);
    map['is_opened'] = Variable<bool>(isOpened);
    map['earned_at'] = Variable<DateTime>(earnedAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  LootboxesCompanion toCompanion(bool nullToAbsent) {
    return LootboxesCompanion(
      id: Value(id),
      rarity: Value(rarity),
      isOpened: Value(isOpened),
      earnedAt: Value(earnedAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory Lootboxe.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Lootboxe(
      id: serializer.fromJson<String>(json['id']),
      rarity: serializer.fromJson<String>(json['rarity']),
      isOpened: serializer.fromJson<bool>(json['isOpened']),
      earnedAt: serializer.fromJson<DateTime>(json['earnedAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'rarity': serializer.toJson<String>(rarity),
      'isOpened': serializer.toJson<bool>(isOpened),
      'earnedAt': serializer.toJson<DateTime>(earnedAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  Lootboxe copyWith(
          {String? id,
          String? rarity,
          bool? isOpened,
          DateTime? earnedAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          bool? isSynced}) =>
      Lootboxe(
        id: id ?? this.id,
        rarity: rarity ?? this.rarity,
        isOpened: isOpened ?? this.isOpened,
        earnedAt: earnedAt ?? this.earnedAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
      );
  Lootboxe copyWithCompanion(LootboxesCompanion data) {
    return Lootboxe(
      id: data.id.present ? data.id.value : this.id,
      rarity: data.rarity.present ? data.rarity.value : this.rarity,
      isOpened: data.isOpened.present ? data.isOpened.value : this.isOpened,
      earnedAt: data.earnedAt.present ? data.earnedAt.value : this.earnedAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Lootboxe(')
          ..write('id: $id, ')
          ..write('rarity: $rarity, ')
          ..write('isOpened: $isOpened, ')
          ..write('earnedAt: $earnedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, rarity, isOpened, earnedAt, updatedAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Lootboxe &&
          other.id == this.id &&
          other.rarity == this.rarity &&
          other.isOpened == this.isOpened &&
          other.earnedAt == this.earnedAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class LootboxesCompanion extends UpdateCompanion<Lootboxe> {
  final Value<String> id;
  final Value<String> rarity;
  final Value<bool> isOpened;
  final Value<DateTime> earnedAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const LootboxesCompanion({
    this.id = const Value.absent(),
    this.rarity = const Value.absent(),
    this.isOpened = const Value.absent(),
    this.earnedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LootboxesCompanion.insert({
    required String id,
    required String rarity,
    this.isOpened = const Value.absent(),
    required DateTime earnedAt,
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        rarity = Value(rarity),
        earnedAt = Value(earnedAt);
  static Insertable<Lootboxe> custom({
    Expression<String>? id,
    Expression<String>? rarity,
    Expression<bool>? isOpened,
    Expression<DateTime>? earnedAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rarity != null) 'rarity': rarity,
      if (isOpened != null) 'is_opened': isOpened,
      if (earnedAt != null) 'earned_at': earnedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LootboxesCompanion copyWith(
      {Value<String>? id,
      Value<String>? rarity,
      Value<bool>? isOpened,
      Value<DateTime>? earnedAt,
      Value<DateTime?>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? rowid}) {
    return LootboxesCompanion(
      id: id ?? this.id,
      rarity: rarity ?? this.rarity,
      isOpened: isOpened ?? this.isOpened,
      earnedAt: earnedAt ?? this.earnedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (rarity.present) {
      map['rarity'] = Variable<String>(rarity.value);
    }
    if (isOpened.present) {
      map['is_opened'] = Variable<bool>(isOpened.value);
    }
    if (earnedAt.present) {
      map['earned_at'] = Variable<DateTime>(earnedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LootboxesCompanion(')
          ..write('id: $id, ')
          ..write('rarity: $rarity, ')
          ..write('isOpened: $isOpened, ')
          ..write('earnedAt: $earnedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PetsTable extends Pets with TableInfo<$PetsTable, Pet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _petTypeMeta =
      const VerificationMeta('petType');
  @override
  late final GeneratedColumn<String> petType = GeneratedColumn<String>(
      'pet_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _happinessLevelMeta =
      const VerificationMeta('happinessLevel');
  @override
  late final GeneratedColumn<int> happinessLevel = GeneratedColumn<int>(
      'happiness_level', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(100));
  static const VerificationMeta _lastFedAtMeta =
      const VerificationMeta('lastFedAt');
  @override
  late final GeneratedColumn<DateTime> lastFedAt = GeneratedColumn<DateTime>(
      'last_fed_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, petType, happinessLevel, lastFedAt, updatedAt, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pets';
  @override
  VerificationContext validateIntegrity(Insertable<Pet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_type')) {
      context.handle(_petTypeMeta,
          petType.isAcceptableOrUnknown(data['pet_type']!, _petTypeMeta));
    } else if (isInserting) {
      context.missing(_petTypeMeta);
    }
    if (data.containsKey('happiness_level')) {
      context.handle(
          _happinessLevelMeta,
          happinessLevel.isAcceptableOrUnknown(
              data['happiness_level']!, _happinessLevelMeta));
    }
    if (data.containsKey('last_fed_at')) {
      context.handle(
          _lastFedAtMeta,
          lastFedAt.isAcceptableOrUnknown(
              data['last_fed_at']!, _lastFedAtMeta));
    } else if (isInserting) {
      context.missing(_lastFedAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pet(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      petType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pet_type'])!,
      happinessLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}happiness_level'])!,
      lastFedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_fed_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $PetsTable createAlias(String alias) {
    return $PetsTable(attachedDatabase, alias);
  }
}

class Pet extends DataClass implements Insertable<Pet> {
  final String id;
  final String petType;
  final int happinessLevel;
  final DateTime lastFedAt;
  final DateTime? updatedAt;
  final bool isSynced;
  const Pet(
      {required this.id,
      required this.petType,
      required this.happinessLevel,
      required this.lastFedAt,
      this.updatedAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pet_type'] = Variable<String>(petType);
    map['happiness_level'] = Variable<int>(happinessLevel);
    map['last_fed_at'] = Variable<DateTime>(lastFedAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  PetsCompanion toCompanion(bool nullToAbsent) {
    return PetsCompanion(
      id: Value(id),
      petType: Value(petType),
      happinessLevel: Value(happinessLevel),
      lastFedAt: Value(lastFedAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory Pet.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pet(
      id: serializer.fromJson<String>(json['id']),
      petType: serializer.fromJson<String>(json['petType']),
      happinessLevel: serializer.fromJson<int>(json['happinessLevel']),
      lastFedAt: serializer.fromJson<DateTime>(json['lastFedAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'petType': serializer.toJson<String>(petType),
      'happinessLevel': serializer.toJson<int>(happinessLevel),
      'lastFedAt': serializer.toJson<DateTime>(lastFedAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  Pet copyWith(
          {String? id,
          String? petType,
          int? happinessLevel,
          DateTime? lastFedAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          bool? isSynced}) =>
      Pet(
        id: id ?? this.id,
        petType: petType ?? this.petType,
        happinessLevel: happinessLevel ?? this.happinessLevel,
        lastFedAt: lastFedAt ?? this.lastFedAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
      );
  Pet copyWithCompanion(PetsCompanion data) {
    return Pet(
      id: data.id.present ? data.id.value : this.id,
      petType: data.petType.present ? data.petType.value : this.petType,
      happinessLevel: data.happinessLevel.present
          ? data.happinessLevel.value
          : this.happinessLevel,
      lastFedAt: data.lastFedAt.present ? data.lastFedAt.value : this.lastFedAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pet(')
          ..write('id: $id, ')
          ..write('petType: $petType, ')
          ..write('happinessLevel: $happinessLevel, ')
          ..write('lastFedAt: $lastFedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, petType, happinessLevel, lastFedAt, updatedAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pet &&
          other.id == this.id &&
          other.petType == this.petType &&
          other.happinessLevel == this.happinessLevel &&
          other.lastFedAt == this.lastFedAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class PetsCompanion extends UpdateCompanion<Pet> {
  final Value<String> id;
  final Value<String> petType;
  final Value<int> happinessLevel;
  final Value<DateTime> lastFedAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const PetsCompanion({
    this.id = const Value.absent(),
    this.petType = const Value.absent(),
    this.happinessLevel = const Value.absent(),
    this.lastFedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PetsCompanion.insert({
    required String id,
    required String petType,
    this.happinessLevel = const Value.absent(),
    required DateTime lastFedAt,
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        petType = Value(petType),
        lastFedAt = Value(lastFedAt);
  static Insertable<Pet> custom({
    Expression<String>? id,
    Expression<String>? petType,
    Expression<int>? happinessLevel,
    Expression<DateTime>? lastFedAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petType != null) 'pet_type': petType,
      if (happinessLevel != null) 'happiness_level': happinessLevel,
      if (lastFedAt != null) 'last_fed_at': lastFedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PetsCompanion copyWith(
      {Value<String>? id,
      Value<String>? petType,
      Value<int>? happinessLevel,
      Value<DateTime>? lastFedAt,
      Value<DateTime?>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? rowid}) {
    return PetsCompanion(
      id: id ?? this.id,
      petType: petType ?? this.petType,
      happinessLevel: happinessLevel ?? this.happinessLevel,
      lastFedAt: lastFedAt ?? this.lastFedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petType.present) {
      map['pet_type'] = Variable<String>(petType.value);
    }
    if (happinessLevel.present) {
      map['happiness_level'] = Variable<int>(happinessLevel.value);
    }
    if (lastFedAt.present) {
      map['last_fed_at'] = Variable<DateTime>(lastFedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PetsCompanion(')
          ..write('id: $id, ')
          ..write('petType: $petType, ')
          ..write('happinessLevel: $happinessLevel, ')
          ..write('lastFedAt: $lastFedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SquadsTable extends Squads with TableInfo<$SquadsTable, Squad> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SquadsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalXpMeta =
      const VerificationMeta('totalXp');
  @override
  late final GeneratedColumn<int> totalXp = GeneratedColumn<int>(
      'total_xp', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, totalXp, updatedAt, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'squads';
  @override
  VerificationContext validateIntegrity(Insertable<Squad> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('total_xp')) {
      context.handle(_totalXpMeta,
          totalXp.isAcceptableOrUnknown(data['total_xp']!, _totalXpMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Squad map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Squad(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      totalXp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_xp'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $SquadsTable createAlias(String alias) {
    return $SquadsTable(attachedDatabase, alias);
  }
}

class Squad extends DataClass implements Insertable<Squad> {
  final String id;
  final String name;
  final int totalXp;
  final DateTime? updatedAt;
  final bool isSynced;
  const Squad(
      {required this.id,
      required this.name,
      required this.totalXp,
      this.updatedAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['total_xp'] = Variable<int>(totalXp);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  SquadsCompanion toCompanion(bool nullToAbsent) {
    return SquadsCompanion(
      id: Value(id),
      name: Value(name),
      totalXp: Value(totalXp),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory Squad.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Squad(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      totalXp: serializer.fromJson<int>(json['totalXp']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'totalXp': serializer.toJson<int>(totalXp),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  Squad copyWith(
          {String? id,
          String? name,
          int? totalXp,
          Value<DateTime?> updatedAt = const Value.absent(),
          bool? isSynced}) =>
      Squad(
        id: id ?? this.id,
        name: name ?? this.name,
        totalXp: totalXp ?? this.totalXp,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
      );
  Squad copyWithCompanion(SquadsCompanion data) {
    return Squad(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      totalXp: data.totalXp.present ? data.totalXp.value : this.totalXp,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Squad(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('totalXp: $totalXp, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, totalXp, updatedAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Squad &&
          other.id == this.id &&
          other.name == this.name &&
          other.totalXp == this.totalXp &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class SquadsCompanion extends UpdateCompanion<Squad> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> totalXp;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const SquadsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.totalXp = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SquadsCompanion.insert({
    required String id,
    required String name,
    this.totalXp = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<Squad> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? totalXp,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (totalXp != null) 'total_xp': totalXp,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SquadsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<int>? totalXp,
      Value<DateTime?>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? rowid}) {
    return SquadsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      totalXp: totalXp ?? this.totalXp,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (totalXp.present) {
      map['total_xp'] = Variable<int>(totalXp.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SquadsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('totalXp: $totalXp, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SideQuestsTable extends SideQuests
    with TableInfo<$SideQuestsTable, SideQuest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SideQuestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _expiresAtMeta =
      const VerificationMeta('expiresAt');
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
      'expires_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, isCompleted, expiresAt, updatedAt, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'side_quests';
  @override
  VerificationContext validateIntegrity(Insertable<SideQuest> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    if (data.containsKey('expires_at')) {
      context.handle(_expiresAtMeta,
          expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta));
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SideQuest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SideQuest(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      expiresAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expires_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $SideQuestsTable createAlias(String alias) {
    return $SideQuestsTable(attachedDatabase, alias);
  }
}

class SideQuest extends DataClass implements Insertable<SideQuest> {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime expiresAt;
  final DateTime? updatedAt;
  final bool isSynced;
  const SideQuest(
      {required this.id,
      required this.title,
      required this.description,
      required this.isCompleted,
      required this.expiresAt,
      this.updatedAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  SideQuestsCompanion toCompanion(bool nullToAbsent) {
    return SideQuestsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      isCompleted: Value(isCompleted),
      expiresAt: Value(expiresAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory SideQuest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SideQuest(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  SideQuest copyWith(
          {String? id,
          String? title,
          String? description,
          bool? isCompleted,
          DateTime? expiresAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          bool? isSynced}) =>
      SideQuest(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        isCompleted: isCompleted ?? this.isCompleted,
        expiresAt: expiresAt ?? this.expiresAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
      );
  SideQuest copyWithCompanion(SideQuestsCompanion data) {
    return SideQuest(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SideQuest(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, description, isCompleted, expiresAt, updatedAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SideQuest &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.isCompleted == this.isCompleted &&
          other.expiresAt == this.expiresAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class SideQuestsCompanion extends UpdateCompanion<SideQuest> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<bool> isCompleted;
  final Value<DateTime> expiresAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const SideQuestsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SideQuestsCompanion.insert({
    required String id,
    required String title,
    required String description,
    this.isCompleted = const Value.absent(),
    required DateTime expiresAt,
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        description = Value(description),
        expiresAt = Value(expiresAt);
  static Insertable<SideQuest> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<bool>? isCompleted,
    Expression<DateTime>? expiresAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SideQuestsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? description,
      Value<bool>? isCompleted,
      Value<DateTime>? expiresAt,
      Value<DateTime?>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? rowid}) {
    return SideQuestsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      expiresAt: expiresAt ?? this.expiresAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SideQuestsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionTagsTable extends TransactionTags
    with TableInfo<$TransactionTagsTable, TransactionTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _depositIdMeta =
      const VerificationMeta('depositId');
  @override
  late final GeneratedColumn<String> depositId = GeneratedColumn<String>(
      'deposit_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
      'tag', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, depositId, tag, updatedAt, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_tags';
  @override
  VerificationContext validateIntegrity(Insertable<TransactionTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('deposit_id')) {
      context.handle(_depositIdMeta,
          depositId.isAcceptableOrUnknown(data['deposit_id']!, _depositIdMeta));
    } else if (isInserting) {
      context.missing(_depositIdMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag']!, _tagMeta));
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionTag(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      depositId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deposit_id'])!,
      tag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $TransactionTagsTable createAlias(String alias) {
    return $TransactionTagsTable(attachedDatabase, alias);
  }
}

class TransactionTag extends DataClass implements Insertable<TransactionTag> {
  final String id;
  final String depositId;
  final String tag;
  final DateTime? updatedAt;
  final bool isSynced;
  const TransactionTag(
      {required this.id,
      required this.depositId,
      required this.tag,
      this.updatedAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['deposit_id'] = Variable<String>(depositId);
    map['tag'] = Variable<String>(tag);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  TransactionTagsCompanion toCompanion(bool nullToAbsent) {
    return TransactionTagsCompanion(
      id: Value(id),
      depositId: Value(depositId),
      tag: Value(tag),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory TransactionTag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionTag(
      id: serializer.fromJson<String>(json['id']),
      depositId: serializer.fromJson<String>(json['depositId']),
      tag: serializer.fromJson<String>(json['tag']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'depositId': serializer.toJson<String>(depositId),
      'tag': serializer.toJson<String>(tag),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  TransactionTag copyWith(
          {String? id,
          String? depositId,
          String? tag,
          Value<DateTime?> updatedAt = const Value.absent(),
          bool? isSynced}) =>
      TransactionTag(
        id: id ?? this.id,
        depositId: depositId ?? this.depositId,
        tag: tag ?? this.tag,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
      );
  TransactionTag copyWithCompanion(TransactionTagsCompanion data) {
    return TransactionTag(
      id: data.id.present ? data.id.value : this.id,
      depositId: data.depositId.present ? data.depositId.value : this.depositId,
      tag: data.tag.present ? data.tag.value : this.tag,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionTag(')
          ..write('id: $id, ')
          ..write('depositId: $depositId, ')
          ..write('tag: $tag, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, depositId, tag, updatedAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionTag &&
          other.id == this.id &&
          other.depositId == this.depositId &&
          other.tag == this.tag &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class TransactionTagsCompanion extends UpdateCompanion<TransactionTag> {
  final Value<String> id;
  final Value<String> depositId;
  final Value<String> tag;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const TransactionTagsCompanion({
    this.id = const Value.absent(),
    this.depositId = const Value.absent(),
    this.tag = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionTagsCompanion.insert({
    required String id,
    required String depositId,
    required String tag,
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        depositId = Value(depositId),
        tag = Value(tag);
  static Insertable<TransactionTag> custom({
    Expression<String>? id,
    Expression<String>? depositId,
    Expression<String>? tag,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (depositId != null) 'deposit_id': depositId,
      if (tag != null) 'tag': tag,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionTagsCompanion copyWith(
      {Value<String>? id,
      Value<String>? depositId,
      Value<String>? tag,
      Value<DateTime?>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? rowid}) {
    return TransactionTagsCompanion(
      id: id ?? this.id,
      depositId: depositId ?? this.depositId,
      tag: tag ?? this.tag,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (depositId.present) {
      map['deposit_id'] = Variable<String>(depositId.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionTagsCompanion(')
          ..write('id: $id, ')
          ..write('depositId: $depositId, ')
          ..write('tag: $tag, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VoiceLogsTable extends VoiceLogs
    with TableInfo<$VoiceLogsTable, VoiceLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VoiceLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _depositIdMeta =
      const VerificationMeta('depositId');
  @override
  late final GeneratedColumn<String> depositId = GeneratedColumn<String>(
      'deposit_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recordedAtMeta =
      const VerificationMeta('recordedAt');
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
      'recorded_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, depositId, filePath, recordedAt, updatedAt, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'voice_logs';
  @override
  VerificationContext validateIntegrity(Insertable<VoiceLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('deposit_id')) {
      context.handle(_depositIdMeta,
          depositId.isAcceptableOrUnknown(data['deposit_id']!, _depositIdMeta));
    } else if (isInserting) {
      context.missing(_depositIdMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
          _recordedAtMeta,
          recordedAt.isAcceptableOrUnknown(
              data['recorded_at']!, _recordedAtMeta));
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VoiceLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VoiceLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      depositId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deposit_id'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
      recordedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}recorded_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $VoiceLogsTable createAlias(String alias) {
    return $VoiceLogsTable(attachedDatabase, alias);
  }
}

class VoiceLog extends DataClass implements Insertable<VoiceLog> {
  final String id;
  final String depositId;
  final String filePath;
  final DateTime recordedAt;
  final DateTime? updatedAt;
  final bool isSynced;
  const VoiceLog(
      {required this.id,
      required this.depositId,
      required this.filePath,
      required this.recordedAt,
      this.updatedAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['deposit_id'] = Variable<String>(depositId);
    map['file_path'] = Variable<String>(filePath);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  VoiceLogsCompanion toCompanion(bool nullToAbsent) {
    return VoiceLogsCompanion(
      id: Value(id),
      depositId: Value(depositId),
      filePath: Value(filePath),
      recordedAt: Value(recordedAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory VoiceLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VoiceLog(
      id: serializer.fromJson<String>(json['id']),
      depositId: serializer.fromJson<String>(json['depositId']),
      filePath: serializer.fromJson<String>(json['filePath']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'depositId': serializer.toJson<String>(depositId),
      'filePath': serializer.toJson<String>(filePath),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  VoiceLog copyWith(
          {String? id,
          String? depositId,
          String? filePath,
          DateTime? recordedAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          bool? isSynced}) =>
      VoiceLog(
        id: id ?? this.id,
        depositId: depositId ?? this.depositId,
        filePath: filePath ?? this.filePath,
        recordedAt: recordedAt ?? this.recordedAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
      );
  VoiceLog copyWithCompanion(VoiceLogsCompanion data) {
    return VoiceLog(
      id: data.id.present ? data.id.value : this.id,
      depositId: data.depositId.present ? data.depositId.value : this.depositId,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      recordedAt:
          data.recordedAt.present ? data.recordedAt.value : this.recordedAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VoiceLog(')
          ..write('id: $id, ')
          ..write('depositId: $depositId, ')
          ..write('filePath: $filePath, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, depositId, filePath, recordedAt, updatedAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VoiceLog &&
          other.id == this.id &&
          other.depositId == this.depositId &&
          other.filePath == this.filePath &&
          other.recordedAt == this.recordedAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class VoiceLogsCompanion extends UpdateCompanion<VoiceLog> {
  final Value<String> id;
  final Value<String> depositId;
  final Value<String> filePath;
  final Value<DateTime> recordedAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const VoiceLogsCompanion({
    this.id = const Value.absent(),
    this.depositId = const Value.absent(),
    this.filePath = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VoiceLogsCompanion.insert({
    required String id,
    required String depositId,
    required String filePath,
    required DateTime recordedAt,
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        depositId = Value(depositId),
        filePath = Value(filePath),
        recordedAt = Value(recordedAt);
  static Insertable<VoiceLog> custom({
    Expression<String>? id,
    Expression<String>? depositId,
    Expression<String>? filePath,
    Expression<DateTime>? recordedAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (depositId != null) 'deposit_id': depositId,
      if (filePath != null) 'file_path': filePath,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VoiceLogsCompanion copyWith(
      {Value<String>? id,
      Value<String>? depositId,
      Value<String>? filePath,
      Value<DateTime>? recordedAt,
      Value<DateTime?>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? rowid}) {
    return VoiceLogsCompanion(
      id: id ?? this.id,
      depositId: depositId ?? this.depositId,
      filePath: filePath ?? this.filePath,
      recordedAt: recordedAt ?? this.recordedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (depositId.present) {
      map['deposit_id'] = Variable<String>(depositId.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VoiceLogsCompanion(')
          ..write('id: $id, ')
          ..write('depositId: $depositId, ')
          ..write('filePath: $filePath, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PenaltyHabitsTable extends PenaltyHabits
    with TableInfo<$PenaltyHabitsTable, PenaltyHabit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PenaltyHabitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _habitNameMeta =
      const VerificationMeta('habitName');
  @override
  late final GeneratedColumn<String> habitName = GeneratedColumn<String>(
      'habit_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _penaltyAmountMeta =
      const VerificationMeta('penaltyAmount');
  @override
  late final GeneratedColumn<int> penaltyAmount = GeneratedColumn<int>(
      'penalty_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, habitName, penaltyAmount, updatedAt, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'penalty_habits';
  @override
  VerificationContext validateIntegrity(Insertable<PenaltyHabit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('habit_name')) {
      context.handle(_habitNameMeta,
          habitName.isAcceptableOrUnknown(data['habit_name']!, _habitNameMeta));
    } else if (isInserting) {
      context.missing(_habitNameMeta);
    }
    if (data.containsKey('penalty_amount')) {
      context.handle(
          _penaltyAmountMeta,
          penaltyAmount.isAcceptableOrUnknown(
              data['penalty_amount']!, _penaltyAmountMeta));
    } else if (isInserting) {
      context.missing(_penaltyAmountMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PenaltyHabit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PenaltyHabit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      habitName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}habit_name'])!,
      penaltyAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}penalty_amount'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $PenaltyHabitsTable createAlias(String alias) {
    return $PenaltyHabitsTable(attachedDatabase, alias);
  }
}

class PenaltyHabit extends DataClass implements Insertable<PenaltyHabit> {
  final String id;
  final String habitName;
  final int penaltyAmount;
  final DateTime? updatedAt;
  final bool isSynced;
  const PenaltyHabit(
      {required this.id,
      required this.habitName,
      required this.penaltyAmount,
      this.updatedAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['habit_name'] = Variable<String>(habitName);
    map['penalty_amount'] = Variable<int>(penaltyAmount);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  PenaltyHabitsCompanion toCompanion(bool nullToAbsent) {
    return PenaltyHabitsCompanion(
      id: Value(id),
      habitName: Value(habitName),
      penaltyAmount: Value(penaltyAmount),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory PenaltyHabit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PenaltyHabit(
      id: serializer.fromJson<String>(json['id']),
      habitName: serializer.fromJson<String>(json['habitName']),
      penaltyAmount: serializer.fromJson<int>(json['penaltyAmount']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'habitName': serializer.toJson<String>(habitName),
      'penaltyAmount': serializer.toJson<int>(penaltyAmount),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  PenaltyHabit copyWith(
          {String? id,
          String? habitName,
          int? penaltyAmount,
          Value<DateTime?> updatedAt = const Value.absent(),
          bool? isSynced}) =>
      PenaltyHabit(
        id: id ?? this.id,
        habitName: habitName ?? this.habitName,
        penaltyAmount: penaltyAmount ?? this.penaltyAmount,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
      );
  PenaltyHabit copyWithCompanion(PenaltyHabitsCompanion data) {
    return PenaltyHabit(
      id: data.id.present ? data.id.value : this.id,
      habitName: data.habitName.present ? data.habitName.value : this.habitName,
      penaltyAmount: data.penaltyAmount.present
          ? data.penaltyAmount.value
          : this.penaltyAmount,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PenaltyHabit(')
          ..write('id: $id, ')
          ..write('habitName: $habitName, ')
          ..write('penaltyAmount: $penaltyAmount, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, habitName, penaltyAmount, updatedAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PenaltyHabit &&
          other.id == this.id &&
          other.habitName == this.habitName &&
          other.penaltyAmount == this.penaltyAmount &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class PenaltyHabitsCompanion extends UpdateCompanion<PenaltyHabit> {
  final Value<String> id;
  final Value<String> habitName;
  final Value<int> penaltyAmount;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const PenaltyHabitsCompanion({
    this.id = const Value.absent(),
    this.habitName = const Value.absent(),
    this.penaltyAmount = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PenaltyHabitsCompanion.insert({
    required String id,
    required String habitName,
    required int penaltyAmount,
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        habitName = Value(habitName),
        penaltyAmount = Value(penaltyAmount);
  static Insertable<PenaltyHabit> custom({
    Expression<String>? id,
    Expression<String>? habitName,
    Expression<int>? penaltyAmount,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitName != null) 'habit_name': habitName,
      if (penaltyAmount != null) 'penalty_amount': penaltyAmount,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PenaltyHabitsCompanion copyWith(
      {Value<String>? id,
      Value<String>? habitName,
      Value<int>? penaltyAmount,
      Value<DateTime?>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? rowid}) {
    return PenaltyHabitsCompanion(
      id: id ?? this.id,
      habitName: habitName ?? this.habitName,
      penaltyAmount: penaltyAmount ?? this.penaltyAmount,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (habitName.present) {
      map['habit_name'] = Variable<String>(habitName.value);
    }
    if (penaltyAmount.present) {
      map['penalty_amount'] = Variable<int>(penaltyAmount.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PenaltyHabitsCompanion(')
          ..write('id: $id, ')
          ..write('habitName: $habitName, ')
          ..write('penaltyAmount: $penaltyAmount, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $JointGoalsTable extends JointGoals
    with TableInfo<$JointGoalsTable, JointGoal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JointGoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _targetAmountMeta =
      const VerificationMeta('targetAmount');
  @override
  late final GeneratedColumn<int> targetAmount = GeneratedColumn<int>(
      'target_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentAmountMeta =
      const VerificationMeta('currentAmount');
  @override
  late final GeneratedColumn<int> currentAmount = GeneratedColumn<int>(
      'current_amount', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _deadlineMeta =
      const VerificationMeta('deadline');
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
      'deadline', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        targetAmount,
        currentAmount,
        deadline,
        createdAt,
        updatedAt,
        isSynced
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'joint_goals';
  @override
  VerificationContext validateIntegrity(Insertable<JointGoal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('target_amount')) {
      context.handle(
          _targetAmountMeta,
          targetAmount.isAcceptableOrUnknown(
              data['target_amount']!, _targetAmountMeta));
    } else if (isInserting) {
      context.missing(_targetAmountMeta);
    }
    if (data.containsKey('current_amount')) {
      context.handle(
          _currentAmountMeta,
          currentAmount.isAcceptableOrUnknown(
              data['current_amount']!, _currentAmountMeta));
    }
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JointGoal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JointGoal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      targetAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}target_amount'])!,
      currentAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_amount'])!,
      deadline: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $JointGoalsTable createAlias(String alias) {
    return $JointGoalsTable(attachedDatabase, alias);
  }
}

class JointGoal extends DataClass implements Insertable<JointGoal> {
  final String id;
  final String title;
  final int targetAmount;
  final int currentAmount;
  final DateTime? deadline;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isSynced;
  const JointGoal(
      {required this.id,
      required this.title,
      required this.targetAmount,
      required this.currentAmount,
      this.deadline,
      required this.createdAt,
      this.updatedAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['target_amount'] = Variable<int>(targetAmount);
    map['current_amount'] = Variable<int>(currentAmount);
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<DateTime>(deadline);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  JointGoalsCompanion toCompanion(bool nullToAbsent) {
    return JointGoalsCompanion(
      id: Value(id),
      title: Value(title),
      targetAmount: Value(targetAmount),
      currentAmount: Value(currentAmount),
      deadline: deadline == null && nullToAbsent
          ? const Value.absent()
          : Value(deadline),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory JointGoal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JointGoal(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      targetAmount: serializer.fromJson<int>(json['targetAmount']),
      currentAmount: serializer.fromJson<int>(json['currentAmount']),
      deadline: serializer.fromJson<DateTime?>(json['deadline']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'targetAmount': serializer.toJson<int>(targetAmount),
      'currentAmount': serializer.toJson<int>(currentAmount),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  JointGoal copyWith(
          {String? id,
          String? title,
          int? targetAmount,
          int? currentAmount,
          Value<DateTime?> deadline = const Value.absent(),
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          bool? isSynced}) =>
      JointGoal(
        id: id ?? this.id,
        title: title ?? this.title,
        targetAmount: targetAmount ?? this.targetAmount,
        currentAmount: currentAmount ?? this.currentAmount,
        deadline: deadline.present ? deadline.value : this.deadline,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
      );
  JointGoal copyWithCompanion(JointGoalsCompanion data) {
    return JointGoal(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      targetAmount: data.targetAmount.present
          ? data.targetAmount.value
          : this.targetAmount,
      currentAmount: data.currentAmount.present
          ? data.currentAmount.value
          : this.currentAmount,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JointGoal(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('targetAmount: $targetAmount, ')
          ..write('currentAmount: $currentAmount, ')
          ..write('deadline: $deadline, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, targetAmount, currentAmount,
      deadline, createdAt, updatedAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JointGoal &&
          other.id == this.id &&
          other.title == this.title &&
          other.targetAmount == this.targetAmount &&
          other.currentAmount == this.currentAmount &&
          other.deadline == this.deadline &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class JointGoalsCompanion extends UpdateCompanion<JointGoal> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> targetAmount;
  final Value<int> currentAmount;
  final Value<DateTime?> deadline;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const JointGoalsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.targetAmount = const Value.absent(),
    this.currentAmount = const Value.absent(),
    this.deadline = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JointGoalsCompanion.insert({
    required String id,
    required String title,
    required int targetAmount,
    this.currentAmount = const Value.absent(),
    this.deadline = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        targetAmount = Value(targetAmount),
        createdAt = Value(createdAt);
  static Insertable<JointGoal> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? targetAmount,
    Expression<int>? currentAmount,
    Expression<DateTime>? deadline,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (targetAmount != null) 'target_amount': targetAmount,
      if (currentAmount != null) 'current_amount': currentAmount,
      if (deadline != null) 'deadline': deadline,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JointGoalsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<int>? targetAmount,
      Value<int>? currentAmount,
      Value<DateTime?>? deadline,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? rowid}) {
    return JointGoalsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      targetAmount: targetAmount ?? this.targetAmount,
      currentAmount: currentAmount ?? this.currentAmount,
      deadline: deadline ?? this.deadline,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (targetAmount.present) {
      map['target_amount'] = Variable<int>(targetAmount.value);
    }
    if (currentAmount.present) {
      map['current_amount'] = Variable<int>(currentAmount.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JointGoalsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('targetAmount: $targetAmount, ')
          ..write('currentAmount: $currentAmount, ')
          ..write('deadline: $deadline, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $JointGoalMembersTable extends JointGoalMembers
    with TableInfo<$JointGoalMembersTable, JointGoalMember> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JointGoalMembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _goalIdMeta = const VerificationMeta('goalId');
  @override
  late final GeneratedColumn<String> goalId = GeneratedColumn<String>(
      'goal_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _memberNameMeta =
      const VerificationMeta('memberName');
  @override
  late final GeneratedColumn<String> memberName = GeneratedColumn<String>(
      'member_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contributedAmountMeta =
      const VerificationMeta('contributedAmount');
  @override
  late final GeneratedColumn<int> contributedAmount = GeneratedColumn<int>(
      'contributed_amount', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _avatarIndexMeta =
      const VerificationMeta('avatarIndex');
  @override
  late final GeneratedColumn<int> avatarIndex = GeneratedColumn<int>(
      'avatar_index', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isCurrentUserMeta =
      const VerificationMeta('isCurrentUser');
  @override
  late final GeneratedColumn<bool> isCurrentUser = GeneratedColumn<bool>(
      'is_current_user', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_current_user" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        goalId,
        memberName,
        contributedAmount,
        avatarIndex,
        isCurrentUser,
        updatedAt,
        isSynced
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'joint_goal_members';
  @override
  VerificationContext validateIntegrity(Insertable<JointGoalMember> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('goal_id')) {
      context.handle(_goalIdMeta,
          goalId.isAcceptableOrUnknown(data['goal_id']!, _goalIdMeta));
    } else if (isInserting) {
      context.missing(_goalIdMeta);
    }
    if (data.containsKey('member_name')) {
      context.handle(
          _memberNameMeta,
          memberName.isAcceptableOrUnknown(
              data['member_name']!, _memberNameMeta));
    } else if (isInserting) {
      context.missing(_memberNameMeta);
    }
    if (data.containsKey('contributed_amount')) {
      context.handle(
          _contributedAmountMeta,
          contributedAmount.isAcceptableOrUnknown(
              data['contributed_amount']!, _contributedAmountMeta));
    }
    if (data.containsKey('avatar_index')) {
      context.handle(
          _avatarIndexMeta,
          avatarIndex.isAcceptableOrUnknown(
              data['avatar_index']!, _avatarIndexMeta));
    }
    if (data.containsKey('is_current_user')) {
      context.handle(
          _isCurrentUserMeta,
          isCurrentUser.isAcceptableOrUnknown(
              data['is_current_user']!, _isCurrentUserMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JointGoalMember map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JointGoalMember(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      goalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}goal_id'])!,
      memberName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}member_name'])!,
      contributedAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}contributed_amount'])!,
      avatarIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}avatar_index'])!,
      isCurrentUser: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_current_user'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $JointGoalMembersTable createAlias(String alias) {
    return $JointGoalMembersTable(attachedDatabase, alias);
  }
}

class JointGoalMember extends DataClass implements Insertable<JointGoalMember> {
  final String id;
  final String goalId;
  final String memberName;
  final int contributedAmount;
  final int avatarIndex;
  final bool isCurrentUser;
  final DateTime? updatedAt;
  final bool isSynced;
  const JointGoalMember(
      {required this.id,
      required this.goalId,
      required this.memberName,
      required this.contributedAmount,
      required this.avatarIndex,
      required this.isCurrentUser,
      this.updatedAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['goal_id'] = Variable<String>(goalId);
    map['member_name'] = Variable<String>(memberName);
    map['contributed_amount'] = Variable<int>(contributedAmount);
    map['avatar_index'] = Variable<int>(avatarIndex);
    map['is_current_user'] = Variable<bool>(isCurrentUser);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  JointGoalMembersCompanion toCompanion(bool nullToAbsent) {
    return JointGoalMembersCompanion(
      id: Value(id),
      goalId: Value(goalId),
      memberName: Value(memberName),
      contributedAmount: Value(contributedAmount),
      avatarIndex: Value(avatarIndex),
      isCurrentUser: Value(isCurrentUser),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory JointGoalMember.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JointGoalMember(
      id: serializer.fromJson<String>(json['id']),
      goalId: serializer.fromJson<String>(json['goalId']),
      memberName: serializer.fromJson<String>(json['memberName']),
      contributedAmount: serializer.fromJson<int>(json['contributedAmount']),
      avatarIndex: serializer.fromJson<int>(json['avatarIndex']),
      isCurrentUser: serializer.fromJson<bool>(json['isCurrentUser']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'goalId': serializer.toJson<String>(goalId),
      'memberName': serializer.toJson<String>(memberName),
      'contributedAmount': serializer.toJson<int>(contributedAmount),
      'avatarIndex': serializer.toJson<int>(avatarIndex),
      'isCurrentUser': serializer.toJson<bool>(isCurrentUser),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  JointGoalMember copyWith(
          {String? id,
          String? goalId,
          String? memberName,
          int? contributedAmount,
          int? avatarIndex,
          bool? isCurrentUser,
          Value<DateTime?> updatedAt = const Value.absent(),
          bool? isSynced}) =>
      JointGoalMember(
        id: id ?? this.id,
        goalId: goalId ?? this.goalId,
        memberName: memberName ?? this.memberName,
        contributedAmount: contributedAmount ?? this.contributedAmount,
        avatarIndex: avatarIndex ?? this.avatarIndex,
        isCurrentUser: isCurrentUser ?? this.isCurrentUser,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
      );
  JointGoalMember copyWithCompanion(JointGoalMembersCompanion data) {
    return JointGoalMember(
      id: data.id.present ? data.id.value : this.id,
      goalId: data.goalId.present ? data.goalId.value : this.goalId,
      memberName:
          data.memberName.present ? data.memberName.value : this.memberName,
      contributedAmount: data.contributedAmount.present
          ? data.contributedAmount.value
          : this.contributedAmount,
      avatarIndex:
          data.avatarIndex.present ? data.avatarIndex.value : this.avatarIndex,
      isCurrentUser: data.isCurrentUser.present
          ? data.isCurrentUser.value
          : this.isCurrentUser,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JointGoalMember(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('memberName: $memberName, ')
          ..write('contributedAmount: $contributedAmount, ')
          ..write('avatarIndex: $avatarIndex, ')
          ..write('isCurrentUser: $isCurrentUser, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, goalId, memberName, contributedAmount,
      avatarIndex, isCurrentUser, updatedAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JointGoalMember &&
          other.id == this.id &&
          other.goalId == this.goalId &&
          other.memberName == this.memberName &&
          other.contributedAmount == this.contributedAmount &&
          other.avatarIndex == this.avatarIndex &&
          other.isCurrentUser == this.isCurrentUser &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class JointGoalMembersCompanion extends UpdateCompanion<JointGoalMember> {
  final Value<String> id;
  final Value<String> goalId;
  final Value<String> memberName;
  final Value<int> contributedAmount;
  final Value<int> avatarIndex;
  final Value<bool> isCurrentUser;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const JointGoalMembersCompanion({
    this.id = const Value.absent(),
    this.goalId = const Value.absent(),
    this.memberName = const Value.absent(),
    this.contributedAmount = const Value.absent(),
    this.avatarIndex = const Value.absent(),
    this.isCurrentUser = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JointGoalMembersCompanion.insert({
    required String id,
    required String goalId,
    required String memberName,
    this.contributedAmount = const Value.absent(),
    this.avatarIndex = const Value.absent(),
    this.isCurrentUser = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        goalId = Value(goalId),
        memberName = Value(memberName);
  static Insertable<JointGoalMember> custom({
    Expression<String>? id,
    Expression<String>? goalId,
    Expression<String>? memberName,
    Expression<int>? contributedAmount,
    Expression<int>? avatarIndex,
    Expression<bool>? isCurrentUser,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (goalId != null) 'goal_id': goalId,
      if (memberName != null) 'member_name': memberName,
      if (contributedAmount != null) 'contributed_amount': contributedAmount,
      if (avatarIndex != null) 'avatar_index': avatarIndex,
      if (isCurrentUser != null) 'is_current_user': isCurrentUser,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JointGoalMembersCompanion copyWith(
      {Value<String>? id,
      Value<String>? goalId,
      Value<String>? memberName,
      Value<int>? contributedAmount,
      Value<int>? avatarIndex,
      Value<bool>? isCurrentUser,
      Value<DateTime?>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? rowid}) {
    return JointGoalMembersCompanion(
      id: id ?? this.id,
      goalId: goalId ?? this.goalId,
      memberName: memberName ?? this.memberName,
      contributedAmount: contributedAmount ?? this.contributedAmount,
      avatarIndex: avatarIndex ?? this.avatarIndex,
      isCurrentUser: isCurrentUser ?? this.isCurrentUser,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (goalId.present) {
      map['goal_id'] = Variable<String>(goalId.value);
    }
    if (memberName.present) {
      map['member_name'] = Variable<String>(memberName.value);
    }
    if (contributedAmount.present) {
      map['contributed_amount'] = Variable<int>(contributedAmount.value);
    }
    if (avatarIndex.present) {
      map['avatar_index'] = Variable<int>(avatarIndex.value);
    }
    if (isCurrentUser.present) {
      map['is_current_user'] = Variable<bool>(isCurrentUser.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JointGoalMembersCompanion(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('memberName: $memberName, ')
          ..write('contributedAmount: $contributedAmount, ')
          ..write('avatarIndex: $avatarIndex, ')
          ..write('isCurrentUser: $isCurrentUser, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AvoidedPurchasesTable extends AvoidedPurchases
    with TableInfo<$AvoidedPurchasesTable, AvoidedPurchase> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AvoidedPurchasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, amount, createdAt, updatedAt, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'avoided_purchases';
  @override
  VerificationContext validateIntegrity(Insertable<AvoidedPurchase> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AvoidedPurchase map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AvoidedPurchase(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $AvoidedPurchasesTable createAlias(String alias) {
    return $AvoidedPurchasesTable(attachedDatabase, alias);
  }
}

class AvoidedPurchase extends DataClass implements Insertable<AvoidedPurchase> {
  final String id;
  final String title;
  final int amount;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isSynced;
  const AvoidedPurchase(
      {required this.id,
      required this.title,
      required this.amount,
      required this.createdAt,
      this.updatedAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['amount'] = Variable<int>(amount);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  AvoidedPurchasesCompanion toCompanion(bool nullToAbsent) {
    return AvoidedPurchasesCompanion(
      id: Value(id),
      title: Value(title),
      amount: Value(amount),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory AvoidedPurchase.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AvoidedPurchase(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      amount: serializer.fromJson<int>(json['amount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'amount': serializer.toJson<int>(amount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  AvoidedPurchase copyWith(
          {String? id,
          String? title,
          int? amount,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          bool? isSynced}) =>
      AvoidedPurchase(
        id: id ?? this.id,
        title: title ?? this.title,
        amount: amount ?? this.amount,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
      );
  AvoidedPurchase copyWithCompanion(AvoidedPurchasesCompanion data) {
    return AvoidedPurchase(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      amount: data.amount.present ? data.amount.value : this.amount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AvoidedPurchase(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, amount, createdAt, updatedAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AvoidedPurchase &&
          other.id == this.id &&
          other.title == this.title &&
          other.amount == this.amount &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class AvoidedPurchasesCompanion extends UpdateCompanion<AvoidedPurchase> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> amount;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const AvoidedPurchasesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.amount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AvoidedPurchasesCompanion.insert({
    required String id,
    required String title,
    required int amount,
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        amount = Value(amount),
        createdAt = Value(createdAt);
  static Insertable<AvoidedPurchase> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? amount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (amount != null) 'amount': amount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AvoidedPurchasesCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<int>? amount,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? rowid}) {
    return AvoidedPurchasesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AvoidedPurchasesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GoalsTable goals = $GoalsTable(this);
  late final $DepositsTable deposits = $DepositsTable(this);
  late final $DepositAllocationsTable depositAllocations =
      $DepositAllocationsTable(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $UnlockedAchievementsTable unlockedAchievements =
      $UnlockedAchievementsTable(this);
  late final $UnlockedSkillsTable unlockedSkills = $UnlockedSkillsTable(this);
  late final $LootboxesTable lootboxes = $LootboxesTable(this);
  late final $PetsTable pets = $PetsTable(this);
  late final $SquadsTable squads = $SquadsTable(this);
  late final $SideQuestsTable sideQuests = $SideQuestsTable(this);
  late final $TransactionTagsTable transactionTags =
      $TransactionTagsTable(this);
  late final $VoiceLogsTable voiceLogs = $VoiceLogsTable(this);
  late final $PenaltyHabitsTable penaltyHabits = $PenaltyHabitsTable(this);
  late final $JointGoalsTable jointGoals = $JointGoalsTable(this);
  late final $JointGoalMembersTable jointGoalMembers =
      $JointGoalMembersTable(this);
  late final $AvoidedPurchasesTable avoidedPurchases =
      $AvoidedPurchasesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        goals,
        deposits,
        depositAllocations,
        userProfiles,
        unlockedAchievements,
        unlockedSkills,
        lootboxes,
        pets,
        squads,
        sideQuests,
        transactionTags,
        voiceLogs,
        penaltyHabits,
        jointGoals,
        jointGoalMembers,
        avoidedPurchases
      ];
}

typedef $$GoalsTableCreateCompanionBuilder = GoalsCompanion Function({
  required String id,
  required String name,
  required int targetAmount,
  required int currentAmount,
  required String currency,
  required String accentColor,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});
typedef $$GoalsTableUpdateCompanionBuilder = GoalsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<int> targetAmount,
  Value<int> currentAmount,
  Value<String> currency,
  Value<String> accentColor,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});

class $$GoalsTableFilterComposer extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get targetAmount => $composableBuilder(
      column: $table.targetAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentAmount => $composableBuilder(
      column: $table.currentAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accentColor => $composableBuilder(
      column: $table.accentColor, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$GoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get targetAmount => $composableBuilder(
      column: $table.targetAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentAmount => $composableBuilder(
      column: $table.currentAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accentColor => $composableBuilder(
      column: $table.accentColor, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$GoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get targetAmount => $composableBuilder(
      column: $table.targetAmount, builder: (column) => column);

  GeneratedColumn<int> get currentAmount => $composableBuilder(
      column: $table.currentAmount, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get accentColor => $composableBuilder(
      column: $table.accentColor, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$GoalsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GoalsTable,
    Goal,
    $$GoalsTableFilterComposer,
    $$GoalsTableOrderingComposer,
    $$GoalsTableAnnotationComposer,
    $$GoalsTableCreateCompanionBuilder,
    $$GoalsTableUpdateCompanionBuilder,
    (Goal, BaseReferences<_$AppDatabase, $GoalsTable, Goal>),
    Goal,
    PrefetchHooks Function()> {
  $$GoalsTableTableManager(_$AppDatabase db, $GoalsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> targetAmount = const Value.absent(),
            Value<int> currentAmount = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<String> accentColor = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalsCompanion(
            id: id,
            name: name,
            targetAmount: targetAmount,
            currentAmount: currentAmount,
            currency: currency,
            accentColor: accentColor,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required int targetAmount,
            required int currentAmount,
            required String currency,
            required String accentColor,
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalsCompanion.insert(
            id: id,
            name: name,
            targetAmount: targetAmount,
            currentAmount: currentAmount,
            currency: currency,
            accentColor: accentColor,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GoalsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GoalsTable,
    Goal,
    $$GoalsTableFilterComposer,
    $$GoalsTableOrderingComposer,
    $$GoalsTableAnnotationComposer,
    $$GoalsTableCreateCompanionBuilder,
    $$GoalsTableUpdateCompanionBuilder,
    (Goal, BaseReferences<_$AppDatabase, $GoalsTable, Goal>),
    Goal,
    PrefetchHooks Function()>;
typedef $$DepositsTableCreateCompanionBuilder = DepositsCompanion Function({
  required String id,
  required int amount,
  required int goalAAmount,
  required int goalBAmount,
  Value<String?> note,
  required DateTime createdAt,
  Value<bool> isDeleted,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});
typedef $$DepositsTableUpdateCompanionBuilder = DepositsCompanion Function({
  Value<String> id,
  Value<int> amount,
  Value<int> goalAAmount,
  Value<int> goalBAmount,
  Value<String?> note,
  Value<DateTime> createdAt,
  Value<bool> isDeleted,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});

class $$DepositsTableFilterComposer
    extends Composer<_$AppDatabase, $DepositsTable> {
  $$DepositsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get goalAAmount => $composableBuilder(
      column: $table.goalAAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get goalBAmount => $composableBuilder(
      column: $table.goalBAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$DepositsTableOrderingComposer
    extends Composer<_$AppDatabase, $DepositsTable> {
  $$DepositsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get goalAAmount => $composableBuilder(
      column: $table.goalAAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get goalBAmount => $composableBuilder(
      column: $table.goalBAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$DepositsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DepositsTable> {
  $$DepositsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get goalAAmount => $composableBuilder(
      column: $table.goalAAmount, builder: (column) => column);

  GeneratedColumn<int> get goalBAmount => $composableBuilder(
      column: $table.goalBAmount, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$DepositsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DepositsTable,
    Deposit,
    $$DepositsTableFilterComposer,
    $$DepositsTableOrderingComposer,
    $$DepositsTableAnnotationComposer,
    $$DepositsTableCreateCompanionBuilder,
    $$DepositsTableUpdateCompanionBuilder,
    (Deposit, BaseReferences<_$AppDatabase, $DepositsTable, Deposit>),
    Deposit,
    PrefetchHooks Function()> {
  $$DepositsTableTableManager(_$AppDatabase db, $DepositsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DepositsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DepositsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DepositsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<int> goalAAmount = const Value.absent(),
            Value<int> goalBAmount = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DepositsCompanion(
            id: id,
            amount: amount,
            goalAAmount: goalAAmount,
            goalBAmount: goalBAmount,
            note: note,
            createdAt: createdAt,
            isDeleted: isDeleted,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required int amount,
            required int goalAAmount,
            required int goalBAmount,
            Value<String?> note = const Value.absent(),
            required DateTime createdAt,
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DepositsCompanion.insert(
            id: id,
            amount: amount,
            goalAAmount: goalAAmount,
            goalBAmount: goalBAmount,
            note: note,
            createdAt: createdAt,
            isDeleted: isDeleted,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DepositsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DepositsTable,
    Deposit,
    $$DepositsTableFilterComposer,
    $$DepositsTableOrderingComposer,
    $$DepositsTableAnnotationComposer,
    $$DepositsTableCreateCompanionBuilder,
    $$DepositsTableUpdateCompanionBuilder,
    (Deposit, BaseReferences<_$AppDatabase, $DepositsTable, Deposit>),
    Deposit,
    PrefetchHooks Function()>;
typedef $$DepositAllocationsTableCreateCompanionBuilder
    = DepositAllocationsCompanion Function({
  required String id,
  required String depositId,
  required String goalId,
  required int amount,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});
typedef $$DepositAllocationsTableUpdateCompanionBuilder
    = DepositAllocationsCompanion Function({
  Value<String> id,
  Value<String> depositId,
  Value<String> goalId,
  Value<int> amount,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});

class $$DepositAllocationsTableFilterComposer
    extends Composer<_$AppDatabase, $DepositAllocationsTable> {
  $$DepositAllocationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get depositId => $composableBuilder(
      column: $table.depositId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get goalId => $composableBuilder(
      column: $table.goalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$DepositAllocationsTableOrderingComposer
    extends Composer<_$AppDatabase, $DepositAllocationsTable> {
  $$DepositAllocationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get depositId => $composableBuilder(
      column: $table.depositId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get goalId => $composableBuilder(
      column: $table.goalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$DepositAllocationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DepositAllocationsTable> {
  $$DepositAllocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get depositId =>
      $composableBuilder(column: $table.depositId, builder: (column) => column);

  GeneratedColumn<String> get goalId =>
      $composableBuilder(column: $table.goalId, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$DepositAllocationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DepositAllocationsTable,
    DepositAllocation,
    $$DepositAllocationsTableFilterComposer,
    $$DepositAllocationsTableOrderingComposer,
    $$DepositAllocationsTableAnnotationComposer,
    $$DepositAllocationsTableCreateCompanionBuilder,
    $$DepositAllocationsTableUpdateCompanionBuilder,
    (
      DepositAllocation,
      BaseReferences<_$AppDatabase, $DepositAllocationsTable, DepositAllocation>
    ),
    DepositAllocation,
    PrefetchHooks Function()> {
  $$DepositAllocationsTableTableManager(
      _$AppDatabase db, $DepositAllocationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DepositAllocationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DepositAllocationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DepositAllocationsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> depositId = const Value.absent(),
            Value<String> goalId = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DepositAllocationsCompanion(
            id: id,
            depositId: depositId,
            goalId: goalId,
            amount: amount,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String depositId,
            required String goalId,
            required int amount,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DepositAllocationsCompanion.insert(
            id: id,
            depositId: depositId,
            goalId: goalId,
            amount: amount,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DepositAllocationsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DepositAllocationsTable,
    DepositAllocation,
    $$DepositAllocationsTableFilterComposer,
    $$DepositAllocationsTableOrderingComposer,
    $$DepositAllocationsTableAnnotationComposer,
    $$DepositAllocationsTableCreateCompanionBuilder,
    $$DepositAllocationsTableUpdateCompanionBuilder,
    (
      DepositAllocation,
      BaseReferences<_$AppDatabase, $DepositAllocationsTable, DepositAllocation>
    ),
    DepositAllocation,
    PrefetchHooks Function()>;
typedef $$UserProfilesTableCreateCompanionBuilder = UserProfilesCompanion
    Function({
  Value<int> id,
  Value<int> xp,
  Value<int> level,
  Value<int> streakCount,
  Value<int> maxStreak,
  Value<int> freezeTokens,
  Value<DateTime?> lastDepositDate,
  Value<int> skillPoints,
  Value<String?> playerClass,
  Value<String> currentTheme,
  Value<String?> avatarConfig,
  Value<int> penaltyBalance,
  Value<int> hackerXp,
  Value<int> magnateXp,
  Value<int> resilienceXp,
  Value<DateTime?> lastBonusClaimDate,
  Value<int> bonusStreak,
  Value<int> crystalsBalance,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
});
typedef $$UserProfilesTableUpdateCompanionBuilder = UserProfilesCompanion
    Function({
  Value<int> id,
  Value<int> xp,
  Value<int> level,
  Value<int> streakCount,
  Value<int> maxStreak,
  Value<int> freezeTokens,
  Value<DateTime?> lastDepositDate,
  Value<int> skillPoints,
  Value<String?> playerClass,
  Value<String> currentTheme,
  Value<String?> avatarConfig,
  Value<int> penaltyBalance,
  Value<int> hackerXp,
  Value<int> magnateXp,
  Value<int> resilienceXp,
  Value<DateTime?> lastBonusClaimDate,
  Value<int> bonusStreak,
  Value<int> crystalsBalance,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
});

class $$UserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get xp => $composableBuilder(
      column: $table.xp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get streakCount => $composableBuilder(
      column: $table.streakCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxStreak => $composableBuilder(
      column: $table.maxStreak, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get freezeTokens => $composableBuilder(
      column: $table.freezeTokens, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastDepositDate => $composableBuilder(
      column: $table.lastDepositDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get skillPoints => $composableBuilder(
      column: $table.skillPoints, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get playerClass => $composableBuilder(
      column: $table.playerClass, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currentTheme => $composableBuilder(
      column: $table.currentTheme, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get avatarConfig => $composableBuilder(
      column: $table.avatarConfig, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get penaltyBalance => $composableBuilder(
      column: $table.penaltyBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get hackerXp => $composableBuilder(
      column: $table.hackerXp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get magnateXp => $composableBuilder(
      column: $table.magnateXp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get resilienceXp => $composableBuilder(
      column: $table.resilienceXp, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastBonusClaimDate => $composableBuilder(
      column: $table.lastBonusClaimDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bonusStreak => $composableBuilder(
      column: $table.bonusStreak, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get crystalsBalance => $composableBuilder(
      column: $table.crystalsBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$UserProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get xp => $composableBuilder(
      column: $table.xp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get streakCount => $composableBuilder(
      column: $table.streakCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxStreak => $composableBuilder(
      column: $table.maxStreak, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get freezeTokens => $composableBuilder(
      column: $table.freezeTokens,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastDepositDate => $composableBuilder(
      column: $table.lastDepositDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get skillPoints => $composableBuilder(
      column: $table.skillPoints, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get playerClass => $composableBuilder(
      column: $table.playerClass, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currentTheme => $composableBuilder(
      column: $table.currentTheme,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get avatarConfig => $composableBuilder(
      column: $table.avatarConfig,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get penaltyBalance => $composableBuilder(
      column: $table.penaltyBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get hackerXp => $composableBuilder(
      column: $table.hackerXp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get magnateXp => $composableBuilder(
      column: $table.magnateXp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get resilienceXp => $composableBuilder(
      column: $table.resilienceXp,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastBonusClaimDate => $composableBuilder(
      column: $table.lastBonusClaimDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bonusStreak => $composableBuilder(
      column: $table.bonusStreak, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get crystalsBalance => $composableBuilder(
      column: $table.crystalsBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$UserProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get xp =>
      $composableBuilder(column: $table.xp, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get streakCount => $composableBuilder(
      column: $table.streakCount, builder: (column) => column);

  GeneratedColumn<int> get maxStreak =>
      $composableBuilder(column: $table.maxStreak, builder: (column) => column);

  GeneratedColumn<int> get freezeTokens => $composableBuilder(
      column: $table.freezeTokens, builder: (column) => column);

  GeneratedColumn<DateTime> get lastDepositDate => $composableBuilder(
      column: $table.lastDepositDate, builder: (column) => column);

  GeneratedColumn<int> get skillPoints => $composableBuilder(
      column: $table.skillPoints, builder: (column) => column);

  GeneratedColumn<String> get playerClass => $composableBuilder(
      column: $table.playerClass, builder: (column) => column);

  GeneratedColumn<String> get currentTheme => $composableBuilder(
      column: $table.currentTheme, builder: (column) => column);

  GeneratedColumn<String> get avatarConfig => $composableBuilder(
      column: $table.avatarConfig, builder: (column) => column);

  GeneratedColumn<int> get penaltyBalance => $composableBuilder(
      column: $table.penaltyBalance, builder: (column) => column);

  GeneratedColumn<int> get hackerXp =>
      $composableBuilder(column: $table.hackerXp, builder: (column) => column);

  GeneratedColumn<int> get magnateXp =>
      $composableBuilder(column: $table.magnateXp, builder: (column) => column);

  GeneratedColumn<int> get resilienceXp => $composableBuilder(
      column: $table.resilienceXp, builder: (column) => column);

  GeneratedColumn<DateTime> get lastBonusClaimDate => $composableBuilder(
      column: $table.lastBonusClaimDate, builder: (column) => column);

  GeneratedColumn<int> get bonusStreak => $composableBuilder(
      column: $table.bonusStreak, builder: (column) => column);

  GeneratedColumn<int> get crystalsBalance => $composableBuilder(
      column: $table.crystalsBalance, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$UserProfilesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserProfilesTable,
    UserProfile,
    $$UserProfilesTableFilterComposer,
    $$UserProfilesTableOrderingComposer,
    $$UserProfilesTableAnnotationComposer,
    $$UserProfilesTableCreateCompanionBuilder,
    $$UserProfilesTableUpdateCompanionBuilder,
    (
      UserProfile,
      BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>
    ),
    UserProfile,
    PrefetchHooks Function()> {
  $$UserProfilesTableTableManager(_$AppDatabase db, $UserProfilesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> xp = const Value.absent(),
            Value<int> level = const Value.absent(),
            Value<int> streakCount = const Value.absent(),
            Value<int> maxStreak = const Value.absent(),
            Value<int> freezeTokens = const Value.absent(),
            Value<DateTime?> lastDepositDate = const Value.absent(),
            Value<int> skillPoints = const Value.absent(),
            Value<String?> playerClass = const Value.absent(),
            Value<String> currentTheme = const Value.absent(),
            Value<String?> avatarConfig = const Value.absent(),
            Value<int> penaltyBalance = const Value.absent(),
            Value<int> hackerXp = const Value.absent(),
            Value<int> magnateXp = const Value.absent(),
            Value<int> resilienceXp = const Value.absent(),
            Value<DateTime?> lastBonusClaimDate = const Value.absent(),
            Value<int> bonusStreak = const Value.absent(),
            Value<int> crystalsBalance = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
          }) =>
              UserProfilesCompanion(
            id: id,
            xp: xp,
            level: level,
            streakCount: streakCount,
            maxStreak: maxStreak,
            freezeTokens: freezeTokens,
            lastDepositDate: lastDepositDate,
            skillPoints: skillPoints,
            playerClass: playerClass,
            currentTheme: currentTheme,
            avatarConfig: avatarConfig,
            penaltyBalance: penaltyBalance,
            hackerXp: hackerXp,
            magnateXp: magnateXp,
            resilienceXp: resilienceXp,
            lastBonusClaimDate: lastBonusClaimDate,
            bonusStreak: bonusStreak,
            crystalsBalance: crystalsBalance,
            updatedAt: updatedAt,
            isSynced: isSynced,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> xp = const Value.absent(),
            Value<int> level = const Value.absent(),
            Value<int> streakCount = const Value.absent(),
            Value<int> maxStreak = const Value.absent(),
            Value<int> freezeTokens = const Value.absent(),
            Value<DateTime?> lastDepositDate = const Value.absent(),
            Value<int> skillPoints = const Value.absent(),
            Value<String?> playerClass = const Value.absent(),
            Value<String> currentTheme = const Value.absent(),
            Value<String?> avatarConfig = const Value.absent(),
            Value<int> penaltyBalance = const Value.absent(),
            Value<int> hackerXp = const Value.absent(),
            Value<int> magnateXp = const Value.absent(),
            Value<int> resilienceXp = const Value.absent(),
            Value<DateTime?> lastBonusClaimDate = const Value.absent(),
            Value<int> bonusStreak = const Value.absent(),
            Value<int> crystalsBalance = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
          }) =>
              UserProfilesCompanion.insert(
            id: id,
            xp: xp,
            level: level,
            streakCount: streakCount,
            maxStreak: maxStreak,
            freezeTokens: freezeTokens,
            lastDepositDate: lastDepositDate,
            skillPoints: skillPoints,
            playerClass: playerClass,
            currentTheme: currentTheme,
            avatarConfig: avatarConfig,
            penaltyBalance: penaltyBalance,
            hackerXp: hackerXp,
            magnateXp: magnateXp,
            resilienceXp: resilienceXp,
            lastBonusClaimDate: lastBonusClaimDate,
            bonusStreak: bonusStreak,
            crystalsBalance: crystalsBalance,
            updatedAt: updatedAt,
            isSynced: isSynced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserProfilesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserProfilesTable,
    UserProfile,
    $$UserProfilesTableFilterComposer,
    $$UserProfilesTableOrderingComposer,
    $$UserProfilesTableAnnotationComposer,
    $$UserProfilesTableCreateCompanionBuilder,
    $$UserProfilesTableUpdateCompanionBuilder,
    (
      UserProfile,
      BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>
    ),
    UserProfile,
    PrefetchHooks Function()>;
typedef $$UnlockedAchievementsTableCreateCompanionBuilder
    = UnlockedAchievementsCompanion Function({
  required String id,
  required DateTime unlockedAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});
typedef $$UnlockedAchievementsTableUpdateCompanionBuilder
    = UnlockedAchievementsCompanion Function({
  Value<String> id,
  Value<DateTime> unlockedAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});

class $$UnlockedAchievementsTableFilterComposer
    extends Composer<_$AppDatabase, $UnlockedAchievementsTable> {
  $$UnlockedAchievementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get unlockedAt => $composableBuilder(
      column: $table.unlockedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$UnlockedAchievementsTableOrderingComposer
    extends Composer<_$AppDatabase, $UnlockedAchievementsTable> {
  $$UnlockedAchievementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get unlockedAt => $composableBuilder(
      column: $table.unlockedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$UnlockedAchievementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnlockedAchievementsTable> {
  $$UnlockedAchievementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get unlockedAt => $composableBuilder(
      column: $table.unlockedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$UnlockedAchievementsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UnlockedAchievementsTable,
    UnlockedAchievement,
    $$UnlockedAchievementsTableFilterComposer,
    $$UnlockedAchievementsTableOrderingComposer,
    $$UnlockedAchievementsTableAnnotationComposer,
    $$UnlockedAchievementsTableCreateCompanionBuilder,
    $$UnlockedAchievementsTableUpdateCompanionBuilder,
    (
      UnlockedAchievement,
      BaseReferences<_$AppDatabase, $UnlockedAchievementsTable,
          UnlockedAchievement>
    ),
    UnlockedAchievement,
    PrefetchHooks Function()> {
  $$UnlockedAchievementsTableTableManager(
      _$AppDatabase db, $UnlockedAchievementsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnlockedAchievementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnlockedAchievementsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnlockedAchievementsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> unlockedAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UnlockedAchievementsCompanion(
            id: id,
            unlockedAt: unlockedAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime unlockedAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UnlockedAchievementsCompanion.insert(
            id: id,
            unlockedAt: unlockedAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UnlockedAchievementsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $UnlockedAchievementsTable,
        UnlockedAchievement,
        $$UnlockedAchievementsTableFilterComposer,
        $$UnlockedAchievementsTableOrderingComposer,
        $$UnlockedAchievementsTableAnnotationComposer,
        $$UnlockedAchievementsTableCreateCompanionBuilder,
        $$UnlockedAchievementsTableUpdateCompanionBuilder,
        (
          UnlockedAchievement,
          BaseReferences<_$AppDatabase, $UnlockedAchievementsTable,
              UnlockedAchievement>
        ),
        UnlockedAchievement,
        PrefetchHooks Function()>;
typedef $$UnlockedSkillsTableCreateCompanionBuilder = UnlockedSkillsCompanion
    Function({
  required String id,
  required DateTime unlockedAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});
typedef $$UnlockedSkillsTableUpdateCompanionBuilder = UnlockedSkillsCompanion
    Function({
  Value<String> id,
  Value<DateTime> unlockedAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});

class $$UnlockedSkillsTableFilterComposer
    extends Composer<_$AppDatabase, $UnlockedSkillsTable> {
  $$UnlockedSkillsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get unlockedAt => $composableBuilder(
      column: $table.unlockedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$UnlockedSkillsTableOrderingComposer
    extends Composer<_$AppDatabase, $UnlockedSkillsTable> {
  $$UnlockedSkillsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get unlockedAt => $composableBuilder(
      column: $table.unlockedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$UnlockedSkillsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnlockedSkillsTable> {
  $$UnlockedSkillsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get unlockedAt => $composableBuilder(
      column: $table.unlockedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$UnlockedSkillsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UnlockedSkillsTable,
    UnlockedSkill,
    $$UnlockedSkillsTableFilterComposer,
    $$UnlockedSkillsTableOrderingComposer,
    $$UnlockedSkillsTableAnnotationComposer,
    $$UnlockedSkillsTableCreateCompanionBuilder,
    $$UnlockedSkillsTableUpdateCompanionBuilder,
    (
      UnlockedSkill,
      BaseReferences<_$AppDatabase, $UnlockedSkillsTable, UnlockedSkill>
    ),
    UnlockedSkill,
    PrefetchHooks Function()> {
  $$UnlockedSkillsTableTableManager(
      _$AppDatabase db, $UnlockedSkillsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnlockedSkillsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnlockedSkillsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnlockedSkillsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> unlockedAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UnlockedSkillsCompanion(
            id: id,
            unlockedAt: unlockedAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime unlockedAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UnlockedSkillsCompanion.insert(
            id: id,
            unlockedAt: unlockedAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UnlockedSkillsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UnlockedSkillsTable,
    UnlockedSkill,
    $$UnlockedSkillsTableFilterComposer,
    $$UnlockedSkillsTableOrderingComposer,
    $$UnlockedSkillsTableAnnotationComposer,
    $$UnlockedSkillsTableCreateCompanionBuilder,
    $$UnlockedSkillsTableUpdateCompanionBuilder,
    (
      UnlockedSkill,
      BaseReferences<_$AppDatabase, $UnlockedSkillsTable, UnlockedSkill>
    ),
    UnlockedSkill,
    PrefetchHooks Function()>;
typedef $$LootboxesTableCreateCompanionBuilder = LootboxesCompanion Function({
  required String id,
  required String rarity,
  Value<bool> isOpened,
  required DateTime earnedAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});
typedef $$LootboxesTableUpdateCompanionBuilder = LootboxesCompanion Function({
  Value<String> id,
  Value<String> rarity,
  Value<bool> isOpened,
  Value<DateTime> earnedAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});

class $$LootboxesTableFilterComposer
    extends Composer<_$AppDatabase, $LootboxesTable> {
  $$LootboxesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get rarity => $composableBuilder(
      column: $table.rarity, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isOpened => $composableBuilder(
      column: $table.isOpened, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get earnedAt => $composableBuilder(
      column: $table.earnedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$LootboxesTableOrderingComposer
    extends Composer<_$AppDatabase, $LootboxesTable> {
  $$LootboxesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rarity => $composableBuilder(
      column: $table.rarity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isOpened => $composableBuilder(
      column: $table.isOpened, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get earnedAt => $composableBuilder(
      column: $table.earnedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$LootboxesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LootboxesTable> {
  $$LootboxesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get rarity =>
      $composableBuilder(column: $table.rarity, builder: (column) => column);

  GeneratedColumn<bool> get isOpened =>
      $composableBuilder(column: $table.isOpened, builder: (column) => column);

  GeneratedColumn<DateTime> get earnedAt =>
      $composableBuilder(column: $table.earnedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$LootboxesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LootboxesTable,
    Lootboxe,
    $$LootboxesTableFilterComposer,
    $$LootboxesTableOrderingComposer,
    $$LootboxesTableAnnotationComposer,
    $$LootboxesTableCreateCompanionBuilder,
    $$LootboxesTableUpdateCompanionBuilder,
    (Lootboxe, BaseReferences<_$AppDatabase, $LootboxesTable, Lootboxe>),
    Lootboxe,
    PrefetchHooks Function()> {
  $$LootboxesTableTableManager(_$AppDatabase db, $LootboxesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LootboxesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LootboxesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LootboxesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> rarity = const Value.absent(),
            Value<bool> isOpened = const Value.absent(),
            Value<DateTime> earnedAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LootboxesCompanion(
            id: id,
            rarity: rarity,
            isOpened: isOpened,
            earnedAt: earnedAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String rarity,
            Value<bool> isOpened = const Value.absent(),
            required DateTime earnedAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LootboxesCompanion.insert(
            id: id,
            rarity: rarity,
            isOpened: isOpened,
            earnedAt: earnedAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LootboxesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LootboxesTable,
    Lootboxe,
    $$LootboxesTableFilterComposer,
    $$LootboxesTableOrderingComposer,
    $$LootboxesTableAnnotationComposer,
    $$LootboxesTableCreateCompanionBuilder,
    $$LootboxesTableUpdateCompanionBuilder,
    (Lootboxe, BaseReferences<_$AppDatabase, $LootboxesTable, Lootboxe>),
    Lootboxe,
    PrefetchHooks Function()>;
typedef $$PetsTableCreateCompanionBuilder = PetsCompanion Function({
  required String id,
  required String petType,
  Value<int> happinessLevel,
  required DateTime lastFedAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});
typedef $$PetsTableUpdateCompanionBuilder = PetsCompanion Function({
  Value<String> id,
  Value<String> petType,
  Value<int> happinessLevel,
  Value<DateTime> lastFedAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});

class $$PetsTableFilterComposer extends Composer<_$AppDatabase, $PetsTable> {
  $$PetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get petType => $composableBuilder(
      column: $table.petType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get happinessLevel => $composableBuilder(
      column: $table.happinessLevel,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastFedAt => $composableBuilder(
      column: $table.lastFedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$PetsTableOrderingComposer extends Composer<_$AppDatabase, $PetsTable> {
  $$PetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get petType => $composableBuilder(
      column: $table.petType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get happinessLevel => $composableBuilder(
      column: $table.happinessLevel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastFedAt => $composableBuilder(
      column: $table.lastFedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$PetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PetsTable> {
  $$PetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get petType =>
      $composableBuilder(column: $table.petType, builder: (column) => column);

  GeneratedColumn<int> get happinessLevel => $composableBuilder(
      column: $table.happinessLevel, builder: (column) => column);

  GeneratedColumn<DateTime> get lastFedAt =>
      $composableBuilder(column: $table.lastFedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$PetsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PetsTable,
    Pet,
    $$PetsTableFilterComposer,
    $$PetsTableOrderingComposer,
    $$PetsTableAnnotationComposer,
    $$PetsTableCreateCompanionBuilder,
    $$PetsTableUpdateCompanionBuilder,
    (Pet, BaseReferences<_$AppDatabase, $PetsTable, Pet>),
    Pet,
    PrefetchHooks Function()> {
  $$PetsTableTableManager(_$AppDatabase db, $PetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> petType = const Value.absent(),
            Value<int> happinessLevel = const Value.absent(),
            Value<DateTime> lastFedAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PetsCompanion(
            id: id,
            petType: petType,
            happinessLevel: happinessLevel,
            lastFedAt: lastFedAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String petType,
            Value<int> happinessLevel = const Value.absent(),
            required DateTime lastFedAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PetsCompanion.insert(
            id: id,
            petType: petType,
            happinessLevel: happinessLevel,
            lastFedAt: lastFedAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PetsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PetsTable,
    Pet,
    $$PetsTableFilterComposer,
    $$PetsTableOrderingComposer,
    $$PetsTableAnnotationComposer,
    $$PetsTableCreateCompanionBuilder,
    $$PetsTableUpdateCompanionBuilder,
    (Pet, BaseReferences<_$AppDatabase, $PetsTable, Pet>),
    Pet,
    PrefetchHooks Function()>;
typedef $$SquadsTableCreateCompanionBuilder = SquadsCompanion Function({
  required String id,
  required String name,
  Value<int> totalXp,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});
typedef $$SquadsTableUpdateCompanionBuilder = SquadsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<int> totalXp,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});

class $$SquadsTableFilterComposer
    extends Composer<_$AppDatabase, $SquadsTable> {
  $$SquadsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalXp => $composableBuilder(
      column: $table.totalXp, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$SquadsTableOrderingComposer
    extends Composer<_$AppDatabase, $SquadsTable> {
  $$SquadsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalXp => $composableBuilder(
      column: $table.totalXp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$SquadsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SquadsTable> {
  $$SquadsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get totalXp =>
      $composableBuilder(column: $table.totalXp, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$SquadsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SquadsTable,
    Squad,
    $$SquadsTableFilterComposer,
    $$SquadsTableOrderingComposer,
    $$SquadsTableAnnotationComposer,
    $$SquadsTableCreateCompanionBuilder,
    $$SquadsTableUpdateCompanionBuilder,
    (Squad, BaseReferences<_$AppDatabase, $SquadsTable, Squad>),
    Squad,
    PrefetchHooks Function()> {
  $$SquadsTableTableManager(_$AppDatabase db, $SquadsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SquadsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SquadsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SquadsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> totalXp = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SquadsCompanion(
            id: id,
            name: name,
            totalXp: totalXp,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<int> totalXp = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SquadsCompanion.insert(
            id: id,
            name: name,
            totalXp: totalXp,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SquadsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SquadsTable,
    Squad,
    $$SquadsTableFilterComposer,
    $$SquadsTableOrderingComposer,
    $$SquadsTableAnnotationComposer,
    $$SquadsTableCreateCompanionBuilder,
    $$SquadsTableUpdateCompanionBuilder,
    (Squad, BaseReferences<_$AppDatabase, $SquadsTable, Squad>),
    Squad,
    PrefetchHooks Function()>;
typedef $$SideQuestsTableCreateCompanionBuilder = SideQuestsCompanion Function({
  required String id,
  required String title,
  required String description,
  Value<bool> isCompleted,
  required DateTime expiresAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});
typedef $$SideQuestsTableUpdateCompanionBuilder = SideQuestsCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> description,
  Value<bool> isCompleted,
  Value<DateTime> expiresAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});

class $$SideQuestsTableFilterComposer
    extends Composer<_$AppDatabase, $SideQuestsTable> {
  $$SideQuestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
      column: $table.expiresAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$SideQuestsTableOrderingComposer
    extends Composer<_$AppDatabase, $SideQuestsTable> {
  $$SideQuestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
      column: $table.expiresAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$SideQuestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SideQuestsTable> {
  $$SideQuestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$SideQuestsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SideQuestsTable,
    SideQuest,
    $$SideQuestsTableFilterComposer,
    $$SideQuestsTableOrderingComposer,
    $$SideQuestsTableAnnotationComposer,
    $$SideQuestsTableCreateCompanionBuilder,
    $$SideQuestsTableUpdateCompanionBuilder,
    (SideQuest, BaseReferences<_$AppDatabase, $SideQuestsTable, SideQuest>),
    SideQuest,
    PrefetchHooks Function()> {
  $$SideQuestsTableTableManager(_$AppDatabase db, $SideQuestsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SideQuestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SideQuestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SideQuestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<DateTime> expiresAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SideQuestsCompanion(
            id: id,
            title: title,
            description: description,
            isCompleted: isCompleted,
            expiresAt: expiresAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String description,
            Value<bool> isCompleted = const Value.absent(),
            required DateTime expiresAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SideQuestsCompanion.insert(
            id: id,
            title: title,
            description: description,
            isCompleted: isCompleted,
            expiresAt: expiresAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SideQuestsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SideQuestsTable,
    SideQuest,
    $$SideQuestsTableFilterComposer,
    $$SideQuestsTableOrderingComposer,
    $$SideQuestsTableAnnotationComposer,
    $$SideQuestsTableCreateCompanionBuilder,
    $$SideQuestsTableUpdateCompanionBuilder,
    (SideQuest, BaseReferences<_$AppDatabase, $SideQuestsTable, SideQuest>),
    SideQuest,
    PrefetchHooks Function()>;
typedef $$TransactionTagsTableCreateCompanionBuilder = TransactionTagsCompanion
    Function({
  required String id,
  required String depositId,
  required String tag,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});
typedef $$TransactionTagsTableUpdateCompanionBuilder = TransactionTagsCompanion
    Function({
  Value<String> id,
  Value<String> depositId,
  Value<String> tag,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});

class $$TransactionTagsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionTagsTable> {
  $$TransactionTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get depositId => $composableBuilder(
      column: $table.depositId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tag => $composableBuilder(
      column: $table.tag, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$TransactionTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionTagsTable> {
  $$TransactionTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get depositId => $composableBuilder(
      column: $table.depositId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tag => $composableBuilder(
      column: $table.tag, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$TransactionTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionTagsTable> {
  $$TransactionTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get depositId =>
      $composableBuilder(column: $table.depositId, builder: (column) => column);

  GeneratedColumn<String> get tag =>
      $composableBuilder(column: $table.tag, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$TransactionTagsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionTagsTable,
    TransactionTag,
    $$TransactionTagsTableFilterComposer,
    $$TransactionTagsTableOrderingComposer,
    $$TransactionTagsTableAnnotationComposer,
    $$TransactionTagsTableCreateCompanionBuilder,
    $$TransactionTagsTableUpdateCompanionBuilder,
    (
      TransactionTag,
      BaseReferences<_$AppDatabase, $TransactionTagsTable, TransactionTag>
    ),
    TransactionTag,
    PrefetchHooks Function()> {
  $$TransactionTagsTableTableManager(
      _$AppDatabase db, $TransactionTagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> depositId = const Value.absent(),
            Value<String> tag = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionTagsCompanion(
            id: id,
            depositId: depositId,
            tag: tag,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String depositId,
            required String tag,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionTagsCompanion.insert(
            id: id,
            depositId: depositId,
            tag: tag,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TransactionTagsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransactionTagsTable,
    TransactionTag,
    $$TransactionTagsTableFilterComposer,
    $$TransactionTagsTableOrderingComposer,
    $$TransactionTagsTableAnnotationComposer,
    $$TransactionTagsTableCreateCompanionBuilder,
    $$TransactionTagsTableUpdateCompanionBuilder,
    (
      TransactionTag,
      BaseReferences<_$AppDatabase, $TransactionTagsTable, TransactionTag>
    ),
    TransactionTag,
    PrefetchHooks Function()>;
typedef $$VoiceLogsTableCreateCompanionBuilder = VoiceLogsCompanion Function({
  required String id,
  required String depositId,
  required String filePath,
  required DateTime recordedAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});
typedef $$VoiceLogsTableUpdateCompanionBuilder = VoiceLogsCompanion Function({
  Value<String> id,
  Value<String> depositId,
  Value<String> filePath,
  Value<DateTime> recordedAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});

class $$VoiceLogsTableFilterComposer
    extends Composer<_$AppDatabase, $VoiceLogsTable> {
  $$VoiceLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get depositId => $composableBuilder(
      column: $table.depositId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$VoiceLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $VoiceLogsTable> {
  $$VoiceLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get depositId => $composableBuilder(
      column: $table.depositId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$VoiceLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VoiceLogsTable> {
  $$VoiceLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get depositId =>
      $composableBuilder(column: $table.depositId, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$VoiceLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VoiceLogsTable,
    VoiceLog,
    $$VoiceLogsTableFilterComposer,
    $$VoiceLogsTableOrderingComposer,
    $$VoiceLogsTableAnnotationComposer,
    $$VoiceLogsTableCreateCompanionBuilder,
    $$VoiceLogsTableUpdateCompanionBuilder,
    (VoiceLog, BaseReferences<_$AppDatabase, $VoiceLogsTable, VoiceLog>),
    VoiceLog,
    PrefetchHooks Function()> {
  $$VoiceLogsTableTableManager(_$AppDatabase db, $VoiceLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VoiceLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VoiceLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VoiceLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> depositId = const Value.absent(),
            Value<String> filePath = const Value.absent(),
            Value<DateTime> recordedAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VoiceLogsCompanion(
            id: id,
            depositId: depositId,
            filePath: filePath,
            recordedAt: recordedAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String depositId,
            required String filePath,
            required DateTime recordedAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VoiceLogsCompanion.insert(
            id: id,
            depositId: depositId,
            filePath: filePath,
            recordedAt: recordedAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$VoiceLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VoiceLogsTable,
    VoiceLog,
    $$VoiceLogsTableFilterComposer,
    $$VoiceLogsTableOrderingComposer,
    $$VoiceLogsTableAnnotationComposer,
    $$VoiceLogsTableCreateCompanionBuilder,
    $$VoiceLogsTableUpdateCompanionBuilder,
    (VoiceLog, BaseReferences<_$AppDatabase, $VoiceLogsTable, VoiceLog>),
    VoiceLog,
    PrefetchHooks Function()>;
typedef $$PenaltyHabitsTableCreateCompanionBuilder = PenaltyHabitsCompanion
    Function({
  required String id,
  required String habitName,
  required int penaltyAmount,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});
typedef $$PenaltyHabitsTableUpdateCompanionBuilder = PenaltyHabitsCompanion
    Function({
  Value<String> id,
  Value<String> habitName,
  Value<int> penaltyAmount,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});

class $$PenaltyHabitsTableFilterComposer
    extends Composer<_$AppDatabase, $PenaltyHabitsTable> {
  $$PenaltyHabitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get habitName => $composableBuilder(
      column: $table.habitName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get penaltyAmount => $composableBuilder(
      column: $table.penaltyAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$PenaltyHabitsTableOrderingComposer
    extends Composer<_$AppDatabase, $PenaltyHabitsTable> {
  $$PenaltyHabitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get habitName => $composableBuilder(
      column: $table.habitName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get penaltyAmount => $composableBuilder(
      column: $table.penaltyAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$PenaltyHabitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PenaltyHabitsTable> {
  $$PenaltyHabitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get habitName =>
      $composableBuilder(column: $table.habitName, builder: (column) => column);

  GeneratedColumn<int> get penaltyAmount => $composableBuilder(
      column: $table.penaltyAmount, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$PenaltyHabitsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PenaltyHabitsTable,
    PenaltyHabit,
    $$PenaltyHabitsTableFilterComposer,
    $$PenaltyHabitsTableOrderingComposer,
    $$PenaltyHabitsTableAnnotationComposer,
    $$PenaltyHabitsTableCreateCompanionBuilder,
    $$PenaltyHabitsTableUpdateCompanionBuilder,
    (
      PenaltyHabit,
      BaseReferences<_$AppDatabase, $PenaltyHabitsTable, PenaltyHabit>
    ),
    PenaltyHabit,
    PrefetchHooks Function()> {
  $$PenaltyHabitsTableTableManager(_$AppDatabase db, $PenaltyHabitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PenaltyHabitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PenaltyHabitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PenaltyHabitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> habitName = const Value.absent(),
            Value<int> penaltyAmount = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PenaltyHabitsCompanion(
            id: id,
            habitName: habitName,
            penaltyAmount: penaltyAmount,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String habitName,
            required int penaltyAmount,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PenaltyHabitsCompanion.insert(
            id: id,
            habitName: habitName,
            penaltyAmount: penaltyAmount,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PenaltyHabitsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PenaltyHabitsTable,
    PenaltyHabit,
    $$PenaltyHabitsTableFilterComposer,
    $$PenaltyHabitsTableOrderingComposer,
    $$PenaltyHabitsTableAnnotationComposer,
    $$PenaltyHabitsTableCreateCompanionBuilder,
    $$PenaltyHabitsTableUpdateCompanionBuilder,
    (
      PenaltyHabit,
      BaseReferences<_$AppDatabase, $PenaltyHabitsTable, PenaltyHabit>
    ),
    PenaltyHabit,
    PrefetchHooks Function()>;
typedef $$JointGoalsTableCreateCompanionBuilder = JointGoalsCompanion Function({
  required String id,
  required String title,
  required int targetAmount,
  Value<int> currentAmount,
  Value<DateTime?> deadline,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});
typedef $$JointGoalsTableUpdateCompanionBuilder = JointGoalsCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<int> targetAmount,
  Value<int> currentAmount,
  Value<DateTime?> deadline,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});

class $$JointGoalsTableFilterComposer
    extends Composer<_$AppDatabase, $JointGoalsTable> {
  $$JointGoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get targetAmount => $composableBuilder(
      column: $table.targetAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentAmount => $composableBuilder(
      column: $table.currentAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deadline => $composableBuilder(
      column: $table.deadline, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$JointGoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $JointGoalsTable> {
  $$JointGoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get targetAmount => $composableBuilder(
      column: $table.targetAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentAmount => $composableBuilder(
      column: $table.currentAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deadline => $composableBuilder(
      column: $table.deadline, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$JointGoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $JointGoalsTable> {
  $$JointGoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get targetAmount => $composableBuilder(
      column: $table.targetAmount, builder: (column) => column);

  GeneratedColumn<int> get currentAmount => $composableBuilder(
      column: $table.currentAmount, builder: (column) => column);

  GeneratedColumn<DateTime> get deadline =>
      $composableBuilder(column: $table.deadline, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$JointGoalsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JointGoalsTable,
    JointGoal,
    $$JointGoalsTableFilterComposer,
    $$JointGoalsTableOrderingComposer,
    $$JointGoalsTableAnnotationComposer,
    $$JointGoalsTableCreateCompanionBuilder,
    $$JointGoalsTableUpdateCompanionBuilder,
    (JointGoal, BaseReferences<_$AppDatabase, $JointGoalsTable, JointGoal>),
    JointGoal,
    PrefetchHooks Function()> {
  $$JointGoalsTableTableManager(_$AppDatabase db, $JointGoalsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JointGoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JointGoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JointGoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> targetAmount = const Value.absent(),
            Value<int> currentAmount = const Value.absent(),
            Value<DateTime?> deadline = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              JointGoalsCompanion(
            id: id,
            title: title,
            targetAmount: targetAmount,
            currentAmount: currentAmount,
            deadline: deadline,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required int targetAmount,
            Value<int> currentAmount = const Value.absent(),
            Value<DateTime?> deadline = const Value.absent(),
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              JointGoalsCompanion.insert(
            id: id,
            title: title,
            targetAmount: targetAmount,
            currentAmount: currentAmount,
            deadline: deadline,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$JointGoalsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $JointGoalsTable,
    JointGoal,
    $$JointGoalsTableFilterComposer,
    $$JointGoalsTableOrderingComposer,
    $$JointGoalsTableAnnotationComposer,
    $$JointGoalsTableCreateCompanionBuilder,
    $$JointGoalsTableUpdateCompanionBuilder,
    (JointGoal, BaseReferences<_$AppDatabase, $JointGoalsTable, JointGoal>),
    JointGoal,
    PrefetchHooks Function()>;
typedef $$JointGoalMembersTableCreateCompanionBuilder
    = JointGoalMembersCompanion Function({
  required String id,
  required String goalId,
  required String memberName,
  Value<int> contributedAmount,
  Value<int> avatarIndex,
  Value<bool> isCurrentUser,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});
typedef $$JointGoalMembersTableUpdateCompanionBuilder
    = JointGoalMembersCompanion Function({
  Value<String> id,
  Value<String> goalId,
  Value<String> memberName,
  Value<int> contributedAmount,
  Value<int> avatarIndex,
  Value<bool> isCurrentUser,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});

class $$JointGoalMembersTableFilterComposer
    extends Composer<_$AppDatabase, $JointGoalMembersTable> {
  $$JointGoalMembersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get goalId => $composableBuilder(
      column: $table.goalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get memberName => $composableBuilder(
      column: $table.memberName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get contributedAmount => $composableBuilder(
      column: $table.contributedAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get avatarIndex => $composableBuilder(
      column: $table.avatarIndex, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCurrentUser => $composableBuilder(
      column: $table.isCurrentUser, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$JointGoalMembersTableOrderingComposer
    extends Composer<_$AppDatabase, $JointGoalMembersTable> {
  $$JointGoalMembersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get goalId => $composableBuilder(
      column: $table.goalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memberName => $composableBuilder(
      column: $table.memberName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get contributedAmount => $composableBuilder(
      column: $table.contributedAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get avatarIndex => $composableBuilder(
      column: $table.avatarIndex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCurrentUser => $composableBuilder(
      column: $table.isCurrentUser,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$JointGoalMembersTableAnnotationComposer
    extends Composer<_$AppDatabase, $JointGoalMembersTable> {
  $$JointGoalMembersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get goalId =>
      $composableBuilder(column: $table.goalId, builder: (column) => column);

  GeneratedColumn<String> get memberName => $composableBuilder(
      column: $table.memberName, builder: (column) => column);

  GeneratedColumn<int> get contributedAmount => $composableBuilder(
      column: $table.contributedAmount, builder: (column) => column);

  GeneratedColumn<int> get avatarIndex => $composableBuilder(
      column: $table.avatarIndex, builder: (column) => column);

  GeneratedColumn<bool> get isCurrentUser => $composableBuilder(
      column: $table.isCurrentUser, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$JointGoalMembersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JointGoalMembersTable,
    JointGoalMember,
    $$JointGoalMembersTableFilterComposer,
    $$JointGoalMembersTableOrderingComposer,
    $$JointGoalMembersTableAnnotationComposer,
    $$JointGoalMembersTableCreateCompanionBuilder,
    $$JointGoalMembersTableUpdateCompanionBuilder,
    (
      JointGoalMember,
      BaseReferences<_$AppDatabase, $JointGoalMembersTable, JointGoalMember>
    ),
    JointGoalMember,
    PrefetchHooks Function()> {
  $$JointGoalMembersTableTableManager(
      _$AppDatabase db, $JointGoalMembersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JointGoalMembersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JointGoalMembersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JointGoalMembersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> goalId = const Value.absent(),
            Value<String> memberName = const Value.absent(),
            Value<int> contributedAmount = const Value.absent(),
            Value<int> avatarIndex = const Value.absent(),
            Value<bool> isCurrentUser = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              JointGoalMembersCompanion(
            id: id,
            goalId: goalId,
            memberName: memberName,
            contributedAmount: contributedAmount,
            avatarIndex: avatarIndex,
            isCurrentUser: isCurrentUser,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String goalId,
            required String memberName,
            Value<int> contributedAmount = const Value.absent(),
            Value<int> avatarIndex = const Value.absent(),
            Value<bool> isCurrentUser = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              JointGoalMembersCompanion.insert(
            id: id,
            goalId: goalId,
            memberName: memberName,
            contributedAmount: contributedAmount,
            avatarIndex: avatarIndex,
            isCurrentUser: isCurrentUser,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$JointGoalMembersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $JointGoalMembersTable,
    JointGoalMember,
    $$JointGoalMembersTableFilterComposer,
    $$JointGoalMembersTableOrderingComposer,
    $$JointGoalMembersTableAnnotationComposer,
    $$JointGoalMembersTableCreateCompanionBuilder,
    $$JointGoalMembersTableUpdateCompanionBuilder,
    (
      JointGoalMember,
      BaseReferences<_$AppDatabase, $JointGoalMembersTable, JointGoalMember>
    ),
    JointGoalMember,
    PrefetchHooks Function()>;
typedef $$AvoidedPurchasesTableCreateCompanionBuilder
    = AvoidedPurchasesCompanion Function({
  required String id,
  required String title,
  required int amount,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});
typedef $$AvoidedPurchasesTableUpdateCompanionBuilder
    = AvoidedPurchasesCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<int> amount,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<bool> isSynced,
  Value<int> rowid,
});

class $$AvoidedPurchasesTableFilterComposer
    extends Composer<_$AppDatabase, $AvoidedPurchasesTable> {
  $$AvoidedPurchasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$AvoidedPurchasesTableOrderingComposer
    extends Composer<_$AppDatabase, $AvoidedPurchasesTable> {
  $$AvoidedPurchasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$AvoidedPurchasesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AvoidedPurchasesTable> {
  $$AvoidedPurchasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$AvoidedPurchasesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AvoidedPurchasesTable,
    AvoidedPurchase,
    $$AvoidedPurchasesTableFilterComposer,
    $$AvoidedPurchasesTableOrderingComposer,
    $$AvoidedPurchasesTableAnnotationComposer,
    $$AvoidedPurchasesTableCreateCompanionBuilder,
    $$AvoidedPurchasesTableUpdateCompanionBuilder,
    (
      AvoidedPurchase,
      BaseReferences<_$AppDatabase, $AvoidedPurchasesTable, AvoidedPurchase>
    ),
    AvoidedPurchase,
    PrefetchHooks Function()> {
  $$AvoidedPurchasesTableTableManager(
      _$AppDatabase db, $AvoidedPurchasesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AvoidedPurchasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AvoidedPurchasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AvoidedPurchasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AvoidedPurchasesCompanion(
            id: id,
            title: title,
            amount: amount,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required int amount,
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AvoidedPurchasesCompanion.insert(
            id: id,
            title: title,
            amount: amount,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AvoidedPurchasesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AvoidedPurchasesTable,
    AvoidedPurchase,
    $$AvoidedPurchasesTableFilterComposer,
    $$AvoidedPurchasesTableOrderingComposer,
    $$AvoidedPurchasesTableAnnotationComposer,
    $$AvoidedPurchasesTableCreateCompanionBuilder,
    $$AvoidedPurchasesTableUpdateCompanionBuilder,
    (
      AvoidedPurchase,
      BaseReferences<_$AppDatabase, $AvoidedPurchasesTable, AvoidedPurchase>
    ),
    AvoidedPurchase,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
  $$DepositsTableTableManager get deposits =>
      $$DepositsTableTableManager(_db, _db.deposits);
  $$DepositAllocationsTableTableManager get depositAllocations =>
      $$DepositAllocationsTableTableManager(_db, _db.depositAllocations);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$UnlockedAchievementsTableTableManager get unlockedAchievements =>
      $$UnlockedAchievementsTableTableManager(_db, _db.unlockedAchievements);
  $$UnlockedSkillsTableTableManager get unlockedSkills =>
      $$UnlockedSkillsTableTableManager(_db, _db.unlockedSkills);
  $$LootboxesTableTableManager get lootboxes =>
      $$LootboxesTableTableManager(_db, _db.lootboxes);
  $$PetsTableTableManager get pets => $$PetsTableTableManager(_db, _db.pets);
  $$SquadsTableTableManager get squads =>
      $$SquadsTableTableManager(_db, _db.squads);
  $$SideQuestsTableTableManager get sideQuests =>
      $$SideQuestsTableTableManager(_db, _db.sideQuests);
  $$TransactionTagsTableTableManager get transactionTags =>
      $$TransactionTagsTableTableManager(_db, _db.transactionTags);
  $$VoiceLogsTableTableManager get voiceLogs =>
      $$VoiceLogsTableTableManager(_db, _db.voiceLogs);
  $$PenaltyHabitsTableTableManager get penaltyHabits =>
      $$PenaltyHabitsTableTableManager(_db, _db.penaltyHabits);
  $$JointGoalsTableTableManager get jointGoals =>
      $$JointGoalsTableTableManager(_db, _db.jointGoals);
  $$JointGoalMembersTableTableManager get jointGoalMembers =>
      $$JointGoalMembersTableTableManager(_db, _db.jointGoalMembers);
  $$AvoidedPurchasesTableTableManager get avoidedPurchases =>
      $$AvoidedPurchasesTableTableManager(_db, _db.avoidedPurchases);
}
