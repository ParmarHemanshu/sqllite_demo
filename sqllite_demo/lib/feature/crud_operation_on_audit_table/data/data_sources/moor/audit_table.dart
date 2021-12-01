import 'package:moor_flutter/moor_flutter.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/models/audit_entity_model.dart';

part 'audit_table.g.dart';

class Audits extends Table {
  IntColumn get audit_id => integer().autoIncrement()();

  TextColumn get audit_entity_name => text().withLength(min: 1,max: 45)();

  TextColumn get audit_entity_end_date => text().nullable()();
}

@UseMoor(tables: [Audits])
class AuditDatabase extends _$AuditDatabase {
  AuditDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: "db.sqlite", singleInstance: true, logStatements: true));

  int get schemaVersion => 1;

  Future<List<Audit>> getAllEntries() => select(audits).get();

  Stream<List<Audit>> watchAllEntries() => select(audits).watch();

  Future<int> insertNewEntry(Audit audit) => into(audits).insert(audit);

  Future deleteEntity(Audit audit) => delete(audits).delete(audit);

  Future updateEntity(AuditsCompanion audit) => update(audits).replace(audit);
}
