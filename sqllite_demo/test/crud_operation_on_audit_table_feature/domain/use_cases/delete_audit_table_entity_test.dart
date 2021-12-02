import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/repositories/audit_entity_repository.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/delete_audit_table_entity.dart';

class MockAuditEntityRepository extends Mock implements AuditEntityRepository {}

void main() {
  late MockAuditEntityRepository mockAuditEntityRepository;
  late DeleteAuditTableEntityUseCase deleteAuditEntityUsecase;
  setUp(() {
    mockAuditEntityRepository = MockAuditEntityRepository();
    deleteAuditEntityUsecase = DeleteAuditTableEntityUseCase(
        auditEntityRepository: mockAuditEntityRepository);
  });
  final auditEntity = Audit(
      audit_id: 1,
      audit_entity_name: 'vadodara',
      audit_entity_end_date: null);

  test('delete auditentity test', () async {
    when(mockAuditEntityRepository.deleteEntityFromAuditTable(auditEntity))
        .thenAnswer((_) async => Future.value(1));
    final result = await deleteAuditEntityUsecase.call(auditEntity);
    expect(result, 1);
  });
}
