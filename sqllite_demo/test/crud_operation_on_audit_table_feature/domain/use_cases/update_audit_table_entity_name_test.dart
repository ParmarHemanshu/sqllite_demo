import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/repositories/audit_entity_repository.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/update_audit_table_entity_name.dart';

class MockAuditEntityRepository extends Mock implements AuditEntityRepository {}

void main() {
  late MockAuditEntityRepository mockAuditEntityRepository;
  late UpdateEntryInAuditTableUseCase updateAuditEntityUsecase;
  setUp(() {
    mockAuditEntityRepository = MockAuditEntityRepository();
    updateAuditEntityUsecase = UpdateEntryInAuditTableUseCase(
        auditEntityRepository: mockAuditEntityRepository);
  });

  String auditEntityName = "new vadodara";
  test('update auditEntity test', () async {
    AuditsCompanion model= AuditsCompanion(audit_entity_name: Value(auditEntityName);
    when(mockAuditEntityRepository.updateEntityNameInAuditTable(model))).thenAnswer((_) async => Future.value(1));
    final result =
    await updateAuditEntityUsecase.call(model);
    expect(result, 1);
  });
}
