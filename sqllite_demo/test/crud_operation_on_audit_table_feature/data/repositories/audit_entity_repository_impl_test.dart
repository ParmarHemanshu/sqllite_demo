import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/audit_table_data_source.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/audit_table_data_source_impl.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/models/audit_entity_model.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/repositories/audit_entity_repository_impl.dart';

class MockAuditEntityDataSource extends Mock implements AuditTableDataSource {}

void main() {
  late MockAuditEntityDataSource mockAuditEntityDataSource;
  late AuditEntityRepositoryImpl auditEntityRepositoryImpl;
  setUp(() {
    mockAuditEntityDataSource = MockAuditEntityDataSource();
    auditEntityRepositoryImpl = AuditEntityRepositoryImpl(
       auditTableDataSource: mockAuditEntityDataSource);
  });
  group('repo operations test', () {

    final auditEntity= Audit(
      audit_id: 1,
      audit_entity_name: "vadodara",
      audit_entity_end_date: "29-02-2020"
        );
    Stream<dynamic>? mockdata;
    final auditEntityList = [
      AuditEntityModel(
           AuditEntityId: 1, AuditEntityName: 'vadodara',
          )
    ];
    test("delete data repo test", () async {
      Audit audit=auditEntity;
      when(mockAuditEntityDataSource.deleteDataFromAuditTable(audit))
          .thenAnswer((_) async => Future.value(1));
      final result =
      await auditEntityRepositoryImpl.deleteEntityFromAuditTable(audit);
      expect(result, 1);
    });
    test("update data repo test", () async {
      AuditsCompanion model=AuditsCompanion(audit_entity_name: Value("vadodara"));
      when(mockAuditEntityDataSource.updateDataIntoAuditTable(model))
          .thenAnswer((_) async => Future.value(1));
      final result = await auditEntityRepositoryImpl.updateEntityNameInAuditTable(model);
      expect(result, 1);
    });
    test("insert data repo test", () async {
      when(mockAuditEntityDataSource.insertDataIntoAuditTable(auditEntity))
          .thenAnswer((_) async => Future.value(1));
      final result =
      await auditEntityRepositoryImpl.insertJsonDataIntoAuditTable(auditEntity);
      expect(result, 1);
    });
    test("get audit entityData repo test", () async {
      when(mockAuditEntityDataSource.getDataFromAuditTable())
          .thenAnswer((_) => mockdata);
      final result = auditEntityRepositoryImpl.getEntriesFromAuditTable();
      expect(result, anything);
    });
    test('get json data repo test', () async {
      when(mockAuditEntityDataSource.getJsonDataFromAsset())
          .thenAnswer((_) async => Future.value(auditEntityList));
      final result = await auditEntityRepositoryImpl.getJsonDataFromAsset();
      expect(result, auditEntityList);
    });
  });
}
