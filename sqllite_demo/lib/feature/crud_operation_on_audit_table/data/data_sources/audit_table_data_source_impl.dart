import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart' as root_bundle;
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/audit_table_data_source.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/presentation/cubit/audit_entity_cubit.dart';

class AuditTableDataSourceImpl extends AuditTableDataSource {
  final AuditDatabase auditDB;

  AuditTableDataSourceImpl({required this.auditDB});

  @override
  Future<void> deleteDataFromAuditTable(Audit audit) {
    return auditDB.deleteEntity(audit);
  }

  @override
  Future<int> insertDataIntoAuditTable(Audit model) async {
    return auditDB.insertNewEntry(model);
  }

  @override
  Future<void> updateDataIntoAuditTable(AuditsCompanion model) {
    return auditDB.updateEntity(model);
  }

  @override
  Future<List<Audit>?>? getDataFromAuditTable() {
    return auditDB.getAllEntries();
  }

  @override
  Stream<List<Audit>?>? watchDataFromAuditTable() {
    return auditDB.watchAllEntries();
  }

  @override
  Future<List<Audit>?>?
      getJsonDataFromAsset() async {
    try {
      final String jsonData =
          await root_bundle.rootBundle.loadString('assets/json/entity.json');
      final Map<String, dynamic> map = json.decode(jsonData);
      final List<dynamic> list = map["auditEntity"];
      var resultList = <Audit>[];
      for (int i = 0; i < list.length; i++) {
        var auditId = map["auditEntity"][i]["AuditEntityId"];
        var auditName = map["auditEntity"][i]["AuditEntityName"];
        var auditEndDate = map["auditEntity"][i]["EntityEndDate"];
        resultList.add(Audit(
            audit_id: auditId,
            audit_entity_name: auditName,
            audit_entity_end_date: auditEndDate));
      }
      return (resultList);
    } on Exception catch (e) {

       const AuditEntityFailure(errorMsg: "Unable to read data from asset");
       print(e);
    }
  }
}
