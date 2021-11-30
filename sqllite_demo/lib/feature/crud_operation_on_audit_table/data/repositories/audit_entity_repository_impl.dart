import 'package:dartz/dartz.dart';
import 'package:sqllite_demo/core/error/failures.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/audit_table_data_source.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/models/audit_entity_model.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/repositories/audit_entity_repository.dart';

class AuditEntityRepositoryImpl extends AuditEntityRepository {
  final AuditTableDataSource auditTableDataSource;

  AuditEntityRepositoryImpl({required this.auditTableDataSource});

  @override
  Future<Either<Failure, AuditEntityModel>?>? deleteEntityFromAuditTable() async{
    final response = await auditTableDataSource.getDataFromAuditTable();
    return Right(response!);
  }

  @override
  Future<Either<Failure, AuditEntityModel>?>? getEntriesFromAuditTable() async{
    final response = await auditTableDataSource.getDataFromAuditTable();
    return Right(response!);
  }

  @override
  Future<Either<Failure, AuditEntityModel>?>? updateEntityNameInAuditTable() async{
    final response = await auditTableDataSource.getDataFromAuditTable();
    return Right(response!);
  }

  @override
  Future<void> insertJsonDataIntoAuditTable() {
    // TODO: implement insertJsonDataIntoAuditTable
    throw UnimplementedError();
  }

}