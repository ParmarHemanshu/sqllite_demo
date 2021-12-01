import 'package:dartz/dartz.dart';
import 'package:sqllite_demo/core/error/failures.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/audit_table_data_source.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/repositories/audit_entity_repository.dart';

class AuditEntityRepositoryImpl extends AuditEntityRepository {
  final AuditTableDataSource auditTableDataSource;

  AuditEntityRepositoryImpl({required this.auditTableDataSource});

  @override
  Future<dynamic>? deleteEntityFromAuditTable(Audit model) async {
    final response = await auditTableDataSource.deleteDataFromAuditTable(model);
    return Right(response!);
  }

  @override
  Future<List<Audit>?> getEntriesFromAuditTable() async {
    final response = await auditTableDataSource.getDataFromAuditTable();
    return response!;
  }

  @override
  Future<Either<Failure, dynamic>?>? updateEntityNameInAuditTable(
      AuditsCompanion model) async {
    final response = await auditTableDataSource.updateDataIntoAuditTable(model);
    return Right(response!);
  }

  @override
  Future<void> insertJsonDataIntoAuditTable(Audit model) async {
    final response = await auditTableDataSource.insertDataIntoAuditTable(model);
    return (response!);
  }

  @override
  Future<List<Audit>?>? getJsonDataFromAsset() async {
    final response = await auditTableDataSource.getDataFromAuditTable();
    return (response!);
  }

  @override
  Stream<List<Audit>?>? watchEntriesOfAuditTable() async* {
    final response = auditTableDataSource.watchDataFromAuditTable();
    yield* response!;
  }
}
