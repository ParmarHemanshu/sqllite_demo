
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/repositories/audit_entity_repository.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/read_audit_table_entries.dart';

class MockAuditEntityRepository extends Mock implements AuditEntityRepository {}

void main() {
  late MockAuditEntityRepository mockAuditEntityRepository;
  late GetEntriesFromAuditTableUseCase getEntriesFromAuditTableUseCase;
  setUp(() {
    mockAuditEntityRepository = MockAuditEntityRepository();
    getEntriesFromAuditTableUseCase =
        GetEntriesFromAuditTableUseCase(auditEntityRepository: mockAuditEntityRepository);
  });
  Stream<dynamic>? mockdata;
  test('get auditentity test', () {
    when(mockAuditEntityRepository.getEntriesFromAuditTable())
        .thenAnswer((_) => mockdata);
    final result = getEntriesFromAuditTableUseCase.call();
    expect(result, anything);
  });
}
