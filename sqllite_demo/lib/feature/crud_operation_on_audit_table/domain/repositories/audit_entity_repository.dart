import 'package:dartz/dartz.dart';
import 'package:sqllite_demo/core/error/failures.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/models/audit_entity_model.dart';

abstract class AuditEntityRepository {

  //reading all entities from audit table
  Future<Either<Failure, AuditEntityResponse>?>? getEntriesFromAuditTable();

  //updating entity name in audit table
  Future<Either<Failure, AuditEntityResponse>?>? updateEntityNameInAuditTable();

  //deleting entity from audit table
  Future<Either<Failure, AuditEntityResponse>?>? deleteEntityFromAuditTable();
}