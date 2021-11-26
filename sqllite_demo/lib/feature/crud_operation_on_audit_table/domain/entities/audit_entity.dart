class AuditEntity {
  AuditEntity({
    this.AuditEntityId,
    this.AuditEntityName,
    this.EntityEndDate,
  });

  int? AuditEntityId;
  String? AuditEntityName;
  String? EntityEndDate;

  factory AuditEntity.fromJson(Map<String, dynamic> json) => AuditEntity(
      AuditEntityId: json["id"] ?? "",
      AuditEntityName: json["name"] ?? "unknown",
      EntityEndDate: json["date"] ?? "unknown");

  Map<String, dynamic> toJson() =>
      {"id": AuditEntityId, "name": AuditEntityName, "date": EntityEndDate};
}
