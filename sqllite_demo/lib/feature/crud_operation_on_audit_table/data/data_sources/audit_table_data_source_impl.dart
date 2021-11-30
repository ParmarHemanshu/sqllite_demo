import 'package:flutter/services.dart' ;

import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/audit_table_data_source.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/models/audit_entity_model.dart';


class AuditTableDataSourceImpl extends AuditTableDataSource {

  @override
  Future<void> deleteDataFromAuditTable() {
    // TODO: implement deleteDataFromAuditTable
    throw UnimplementedError();
  }

  @override
  Future<AuditEntityModel> insertDataIntoAuditTable() async{
    final String response =
        await rootBundle.loadString('assets/json/entity.json');
    final data = AuditEntityModel.fromJson(json.decode(response));
    var auditData = Future.value(data.auditEntity);
    return auditData as AuditEntityModel;
  }

  @override
  Future<void> updateDataIntoAuditTable() {
    // TODO: implement updateDataIntoAuditTable
    throw UnimplementedError();
  }

  @override
  Future<AuditEntityModel?>? getDataFromAuditTable() {
    // TODO: implement getDataFromAuditTable
    throw UnimplementedError();
  }
}
