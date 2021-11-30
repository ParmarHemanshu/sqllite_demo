// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_table.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Audit extends DataClass implements Insertable<Audit> {
  final int audit_id;
  final String audit_entity_name;
  final DateTime? audit_entity_end_date;
  Audit(
      {required this.audit_id,
      required this.audit_entity_name,
      this.audit_entity_end_date});
  factory Audit.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Audit(
      audit_id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}audit_id'])!,
      audit_entity_name: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}audit_entity_name'])!,
      audit_entity_end_date: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}audit_entity_end_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['audit_id'] = Variable<int>(audit_id);
    map['audit_entity_name'] = Variable<String>(audit_entity_name);
    if (!nullToAbsent || audit_entity_end_date != null) {
      map['audit_entity_end_date'] = Variable<DateTime?>(audit_entity_end_date);
    }
    return map;
  }

  AuditsCompanion toCompanion(bool nullToAbsent) {
    return AuditsCompanion(
      audit_id: Value(audit_id),
      audit_entity_name: Value(audit_entity_name),
      audit_entity_end_date: audit_entity_end_date == null && nullToAbsent
          ? const Value.absent()
          : Value(audit_entity_end_date),
    );
  }

  factory Audit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Audit(
      audit_id: serializer.fromJson<int>(json['audit_id']),
      audit_entity_name: serializer.fromJson<String>(json['audit_entity_name']),
      audit_entity_end_date:
          serializer.fromJson<DateTime?>(json['audit_entity_end_date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'audit_id': serializer.toJson<int>(audit_id),
      'audit_entity_name': serializer.toJson<String>(audit_entity_name),
      'audit_entity_end_date':
          serializer.toJson<DateTime?>(audit_entity_end_date),
    };
  }

  Audit copyWith(
          {int? audit_id,
          String? audit_entity_name,
          DateTime? audit_entity_end_date}) =>
      Audit(
        audit_id: audit_id ?? this.audit_id,
        audit_entity_name: audit_entity_name ?? this.audit_entity_name,
        audit_entity_end_date:
            audit_entity_end_date ?? this.audit_entity_end_date,
      );
  @override
  String toString() {
    return (StringBuffer('Audit(')
          ..write('audit_id: $audit_id, ')
          ..write('audit_entity_name: $audit_entity_name, ')
          ..write('audit_entity_end_date: $audit_entity_end_date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(audit_id, audit_entity_name, audit_entity_end_date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Audit &&
          other.audit_id == this.audit_id &&
          other.audit_entity_name == this.audit_entity_name &&
          other.audit_entity_end_date == this.audit_entity_end_date);
}

class AuditsCompanion extends UpdateCompanion<Audit> {
  final Value<int> audit_id;
  final Value<String> audit_entity_name;
  final Value<DateTime?> audit_entity_end_date;
  const AuditsCompanion({
    this.audit_id = const Value.absent(),
    this.audit_entity_name = const Value.absent(),
    this.audit_entity_end_date = const Value.absent(),
  });
  AuditsCompanion.insert({
    this.audit_id = const Value.absent(),
    required String audit_entity_name,
    this.audit_entity_end_date = const Value.absent(),
  }) : audit_entity_name = Value(audit_entity_name);
  static Insertable<Audit> custom({
    Expression<int>? audit_id,
    Expression<String>? audit_entity_name,
    Expression<DateTime?>? audit_entity_end_date,
  }) {
    return RawValuesInsertable({
      if (audit_id != null) 'audit_id': audit_id,
      if (audit_entity_name != null) 'audit_entity_name': audit_entity_name,
      if (audit_entity_end_date != null)
        'audit_entity_end_date': audit_entity_end_date,
    });
  }

  AuditsCompanion copyWith(
      {Value<int>? audit_id,
      Value<String>? audit_entity_name,
      Value<DateTime?>? audit_entity_end_date}) {
    return AuditsCompanion(
      audit_id: audit_id ?? this.audit_id,
      audit_entity_name: audit_entity_name ?? this.audit_entity_name,
      audit_entity_end_date:
          audit_entity_end_date ?? this.audit_entity_end_date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (audit_id.present) {
      map['audit_id'] = Variable<int>(audit_id.value);
    }
    if (audit_entity_name.present) {
      map['audit_entity_name'] = Variable<String>(audit_entity_name.value);
    }
    if (audit_entity_end_date.present) {
      map['audit_entity_end_date'] =
          Variable<DateTime?>(audit_entity_end_date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditsCompanion(')
          ..write('audit_id: $audit_id, ')
          ..write('audit_entity_name: $audit_entity_name, ')
          ..write('audit_entity_end_date: $audit_entity_end_date')
          ..write(')'))
        .toString();
  }
}

class $AuditsTable extends Audits with TableInfo<$AuditsTable, Audit> {
  final GeneratedDatabase _db;
  final String? _alias;
  $AuditsTable(this._db, [this._alias]);
  final VerificationMeta _audit_idMeta = const VerificationMeta('audit_id');
  late final GeneratedColumn<int?> audit_id = GeneratedColumn<int?>(
      'audit_id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _audit_entity_nameMeta =
      const VerificationMeta('audit_entity_name');
  late final GeneratedColumn<String?> audit_entity_name =
      GeneratedColumn<String?>('audit_entity_name', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 35),
          typeName: 'TEXT',
          requiredDuringInsert: true);
  final VerificationMeta _audit_entity_end_dateMeta =
      const VerificationMeta('audit_entity_end_date');
  late final GeneratedColumn<DateTime?> audit_entity_end_date =
      GeneratedColumn<DateTime?>('audit_entity_end_date', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [audit_id, audit_entity_name, audit_entity_end_date];
  @override
  String get aliasedName => _alias ?? 'audits';
  @override
  String get actualTableName => 'audits';
  @override
  VerificationContext validateIntegrity(Insertable<Audit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('audit_id')) {
      context.handle(_audit_idMeta,
          audit_id.isAcceptableOrUnknown(data['audit_id']!, _audit_idMeta));
    }
    if (data.containsKey('audit_entity_name')) {
      context.handle(
          _audit_entity_nameMeta,
          audit_entity_name.isAcceptableOrUnknown(
              data['audit_entity_name']!, _audit_entity_nameMeta));
    } else if (isInserting) {
      context.missing(_audit_entity_nameMeta);
    }
    if (data.containsKey('audit_entity_end_date')) {
      context.handle(
          _audit_entity_end_dateMeta,
          audit_entity_end_date.isAcceptableOrUnknown(
              data['audit_entity_end_date']!, _audit_entity_end_dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {audit_id};
  @override
  Audit map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Audit.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AuditsTable createAlias(String alias) {
    return $AuditsTable(_db, alias);
  }
}

abstract class _$AuditDatabase extends GeneratedDatabase {
  _$AuditDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $AuditsTable audits = $AuditsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [audits];
}
