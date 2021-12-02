import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/audit_table_data_source_impl.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';

class MockAuditEntityDB extends Mock implements AuditDatabase {}

void main() {
  late MockAuditEntityDB mockAuditEntityDb;
  late AuditTableDataSourceImpl auditEntityDataSourceImpl;

  setUp(() {
    mockAuditEntityDb = MockAuditEntityDB();
    auditEntityDataSourceImpl =
        AuditTableDataSourceImpl(auditDB: mockAuditEntityDb);
  });

  group('curd operation on db test', () {

    final auditEntity = Audit(
      audit_id: 1,
      audit_entity_name: 'vadodara',
      audit_entity_end_date: "29-02-2020");
    Selectable<Audit>? mockdata;
    test('delete auditentity db test', () async {
      when(mockAuditEntityDb.deleteEntity(auditEntity))
          .thenAnswer((_) async => Future.value(1));
      final result = await auditEntityDataSourceImpl.deleteDataFromAuditTable(auditEntity);
      expect(result, 1);
    });
    test("update data test", () async {
      AuditsCompanion model=const AuditsCompanion(audit_entity_name: Value("vadodara new");
      when(mockAuditEntityDb.updateEntity(model)))
          .thenAnswer((_) async => Future.value(1));
      final result = await auditEntityDataSourceImpl.updateDataIntoAuditTable(model);
      expect(result, model.audit_entity_name);
    });
    test("insert data test", () async {
      when(mockAuditEntityDb.insertNewEntry(auditEntity))
          .thenAnswer((_) async => Future.value(1));
      final result = await auditEntityDataSourceImpl.insertDataIntoAuditTable(auditEntity);
      expect(result, 1);
    });
    test("get data from db test", () async {
      when(mockAuditEntityDb.getAllEntries()).thenAnswer((_) => mockdata);
      final result = auditEntityDataSourceImpl.getDataFromAuditTable();
      expect(result, mockdata);
    });
  });
}
