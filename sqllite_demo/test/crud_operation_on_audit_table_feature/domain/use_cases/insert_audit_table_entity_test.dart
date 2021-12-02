
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/repositories/audit_entity_repository.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/insert_audit_table_entity.dart';

class MockAuditEntityRepository extends Mock implements AuditEntityRepository {}

void main() {
  late MockAuditEntityRepository mockAuditEntityRepository;
  late InsertEntriesInAuditTableUseCase insertAuditEntityUsecase;
  setUp(() {
    mockAuditEntityRepository = MockAuditEntityRepository();
    insertAuditEntityUsecase = InsertEntriesInAuditTableUseCase(
        auditEntityRepository: mockAuditEntityRepository);
  });
  final auditEntity = Audit(
    audit_id: 1,
    audit_entity_name: "vadodara",
    audit_entity_end_date: "22-02-2021"
      );
  test('insert auditentity test', () async {
    when(mockAuditEntityRepository.insertJsonDataIntoAuditTable(auditEntity))
        .thenAnswer((_) async => Future.value(1));
    final result = await insertAuditEntityUsecase.call(auditEntity);
    expect(result, 1);
  });
}
