
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/repositories/audit_entity_repository.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/get_json_data_from_asset.dart';

class MockAuditEntityRepository extends Mock implements AuditEntityRepository {}

void main() {
  late MockAuditEntityRepository mockAuditEntityRepository;
  late GetJsonDataFromAssetUseCase getJsonDataUsecase;
  setUp(() {
    mockAuditEntityRepository = MockAuditEntityRepository();
    getJsonDataUsecase =
        GetJsonDataFromAssetUseCase(auditEntityRepository: mockAuditEntityRepository);
  });
  final auditEntity = [
    Audit(
      audit_id: 1,
      audit_entity_name: 'vadodara',
      audit_entity_end_date: null
    )
  ];
  test('get json data from asset test', () async {
    when(mockAuditEntityRepository.getJsonDataFromAsset())
        .thenAnswer((_) async => Future.value(auditEntity));
    final result = await getJsonDataUsecase.call();
    expect(result, auditEntity);
  });
}
