import 'package:dartz/dartz.dart';
import 'package:sqllite_demo/core/error/failures.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/models/audit_entity_model.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/presentation/cubit/audit_entity_cubit.dart';

abstract class AuditTableDataSource {
  //listen to all audit table entries
  Stream<List<Audit>?>? watchDataFromAuditTable();

  //reading all entities from audit table
  Future<List<Audit>?>? getDataFromAuditTable();

  //insert Audit model type json data into audit table
  Future<dynamic> insertDataIntoAuditTable(Audit model);

  //updating entity name in audit table
  Future<dynamic> updateDataIntoAuditTable(AuditsCompanion model);

  //deleting entity from audit table
  Future<dynamic> deleteDataFromAuditTable(Audit audit);

  //read all data from assets/json/entity.json file
    Future<List<Audit>?>? getJsonDataFromAsset();
}
