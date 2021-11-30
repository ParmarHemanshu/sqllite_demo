import 'package:dartz/dartz.dart';
import 'package:sqllite_demo/core/error/failures.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/entities/audit_entity.dart';

abstract class AuditEntityRepository {
  //insert json data into audit table
  Future<void> insertJsonDataIntoAuditTable();

  //reading all entities from audit table
  Future<Either<Failure, AuditEntityItem>?>? getEntriesFromAuditTable();

  //updating entity name in audit table
  Future<Either<Failure, AuditEntityItem>?>? updateEntityNameInAuditTable();

  //deleting entity from audit table
  Future<Either<Failure, AuditEntityItem>?>? deleteEntityFromAuditTable();
}
