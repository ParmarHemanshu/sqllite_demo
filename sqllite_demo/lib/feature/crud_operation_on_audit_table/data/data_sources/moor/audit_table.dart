import 'package:moor_flutter/moor_flutter.dart';

part 'audit_table.g.dart';

class Audits extends Table {
  IntColumn get audit_id => integer().autoIncrement()();

  TextColumn get audit_entity_name => text().withLength(min: 1,max: 35)();

  DateTimeColumn get audit_entity_end_date => dateTime().nullable()();
}

@UseMoor(tables: [Audits])
class AuditDatabase extends _$AuditDatabase {
  AuditDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: "db.sqlite", singleInstance: true, logStatements: true));

  int get schemaVersion => 1;

  Future<List<Audit>> getAllEntries() => select(audits).get();

  Stream<List<Audit>> watchAllEntries() => select(audits).watch();

  Future insertNewEntry(AuditsCompanion audit) => into(audits).insert(audit);

  Future deleteEntity(Audit audit) => delete(audits).delete(audit);

  Future updateEntity(AuditsCompanion audit) => update(audits).replace(audit);
}
