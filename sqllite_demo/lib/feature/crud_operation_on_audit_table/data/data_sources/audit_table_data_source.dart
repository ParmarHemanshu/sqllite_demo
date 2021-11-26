import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/models/audit_entity_model.dart';

abstract class AuditTableDataSource {
  Future<AuditEntityResponse?>? getDataFromAuditTable();
}
