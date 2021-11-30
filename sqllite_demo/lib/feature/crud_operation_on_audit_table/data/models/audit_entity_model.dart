import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/entities/audit_entity.dart';

class AuditEntityModel extends AuditEntityItem {
  AuditEntityModel({
    required this.AuditEntityId,
    required this.AuditEntityName,
    this.EntityEndDate,
  }) : super(
            AuditEntityId: AuditEntityId,
            AuditEntityName: AuditEntityName,
            EntityEndDate: EntityEndDate);

  @override
  int AuditEntityId;
  @override
  String AuditEntityName;
  @override
  String? EntityEndDate;

  factory AuditEntityModel.fromJson(Map<String, dynamic> json) =>
      AuditEntityModel(
          AuditEntityId: json["id"] ?? "",
          AuditEntityName: json["name"] ?? "unknown",
          EntityEndDate: json["date"] ?? "unknown");

  Map<String, dynamic> toJson() =>
      {"id": AuditEntityId, "name": AuditEntityName, "date": EntityEndDate};
}
