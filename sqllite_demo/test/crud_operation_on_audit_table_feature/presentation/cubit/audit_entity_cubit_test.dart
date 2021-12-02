import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/delete_audit_table_entity.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/get_json_data_from_asset.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/insert_audit_table_entity.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/read_audit_table_entries.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/update_audit_table_entity_name.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/watch_audit_table_data.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/presentation/cubit/audit_entity_cubit.dart';

class MockInsertAuditEntityUsecase extends Mock
    implements InsertEntriesInAuditTableUseCase {}

class MockDeleteAuditEntityUsecase extends Mock
    implements DeleteAuditTableEntityUseCase {}

class MockUpdateAuditEntityUsecase extends Mock
    implements UpdateEntryInAuditTableUseCase {}

class MockWatchAuditEntityUsecase extends Mock
    implements WatchAuditTableDataUseCase {}

class MockGetAuditEntityUsecase extends Mock implements GetEntriesFromAuditTableUseCase {}

class MockGetJsonDataUsecase extends Mock implements GetJsonDataFromAssetUseCase {}

void main() {
  late AuditEntityCubit auditEntityCubit;
  late MockInsertAuditEntityUsecase mockInsertAuditEntityUsecase;
  late MockDeleteAuditEntityUsecase mockDeleteAuditEntityUsecase;
  late MockUpdateAuditEntityUsecase mockUpdateAuditEntityUsecase;
  late MockGetAuditEntityUsecase mockGetAuditEntityUsecase;
  late MockGetJsonDataUsecase mockGetJsonDataUsecase;
  late MockWatchAuditEntityUsecase mockWatchAuditEntityUsecase;

  setUp(() {
    mockInsertAuditEntityUsecase = MockInsertAuditEntityUsecase();
    mockDeleteAuditEntityUsecase = MockDeleteAuditEntityUsecase();
    mockUpdateAuditEntityUsecase = MockUpdateAuditEntityUsecase();
    mockGetAuditEntityUsecase = MockGetAuditEntityUsecase();
    mockGetJsonDataUsecase = MockGetJsonDataUsecase();
    mockWatchAuditEntityUsecase=MockWatchAuditEntityUsecase();
    auditEntityCubit = AuditEntityCubit(insertEntriesInAuditTableUseCase: mockInsertAuditEntityUsecase,
      deleteAuditTableEntityUseCase: mockDeleteAuditEntityUsecase,
      updateEntryInAuditTableUseCase: mockUpdateAuditEntityUsecase,
      getEntriesFromAuditTableUseCase: mockGetAuditEntityUsecase,
      getJsonDataFromAssetUseCase: mockGetJsonDataUsecase, watchAuditTableDataUseCase: mockWatchAuditEntityUsecase
        );
  });
  test('initial state', () {
    expect(auditEntityCubit.state, AuditEntityInitial());
  });
final auditEntity=Audit(audit_id: 1,audit_entity_name: "vadodara",audit_entity_end_date: "22-03-2021");
  const auditEntityCompanion= AuditsCompanion(audit_entity_name: Value("vadodara new"));

  test('check update usecase ', () async {
    when(mockUpdateAuditEntityUsecase.call(auditEntityCompanion))
        .thenAnswer((_) async => Future.value());
    final result = await auditEntityCubit.updateEntityFromAuditTable(auditEntityCompanion);
    expect(result, anything);
  });
  test('check delete usecase ', () async {
    when(mockDeleteAuditEntityUsecase.call(auditEntity))
        .thenAnswer((_) async => Future.value());
    final result = await auditEntityCubit.deleteEntityFromAuditTable(auditEntity);
    expect(result, 1);
  });
}
