class AuditEntityItem {
  AuditEntityItem({
    required this.AuditEntityId,
    this.AuditId,
    required this.AuditEntityName,
    this.AuditEntityTypeId,
    this.AuditParentEntityId,
    this.SequenceNo,
    this.EntityEndDate,
    this.IsLeafNode,
    this.BarcodeNFC,
    this.EntityLevel,
    this.EntityException,
    this.ScheduleOccurrenceIds,
  });

  late final int AuditEntityId;
  late final int? AuditId;
  late final String AuditEntityName;
  late final int? AuditEntityTypeId;
  late final int? AuditParentEntityId;
  late final int? SequenceNo;
  late final String? EntityEndDate;
  late final bool? IsLeafNode;
  late final String? BarcodeNFC;
  late final int? EntityLevel;
  late final bool? EntityException;
  late final String? ScheduleOccurrenceIds;

}
