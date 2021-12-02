import 'package:dartz/dartz.dart';
import 'package:sqllite_demo/core/error/failures.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';

abstract class AuditEntityRepository {

  //listen to all audit table entries
  Stream<List<Audit>?> watchEntriesOfAuditTable();

  //read all data from assets/json/entity.json file
  Future<List<Audit>?>? getJsonDataFromAsset();

  //reading all entities from audit table
  Future<List<Audit>?>? getEntriesFromAuditTable();

  //insert json data into audit table
  Future<void> insertJsonDataIntoAuditTable(Audit model);

  //updating entity name in audit table
  Future<Either<Failure, dynamic>?>? updateEntityNameInAuditTable(AuditsCompanion model);

  //deleting entity from audit table
  Future<dynamic>? deleteEntityFromAuditTable(Audit model);

}
