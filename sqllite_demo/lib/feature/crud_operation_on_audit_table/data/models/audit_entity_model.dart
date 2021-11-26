class AuditEntityResponse {
  AuditEntityResponse({
    required this.auditEntity,
  });

  late final List<AuditEntityItem> auditEntity;

  AuditEntityResponse.fromJson(Map<String, dynamic> json) {
    auditEntity = List.from(json['auditEntity'])
        .map((e) => AuditEntityItem.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['auditEntity'] = auditEntity.map((e) => e.toJson()).toList();
    return _data;
  }
}

class AuditEntityItem {
  AuditEntityItem({
    required this.AuditEntityId,
    required this.AuditId,
    required this.AuditEntityName,
    required this.AuditEntityTypeId,
    required this.AuditParentEntityId,
    required this.SequenceNo,
    this.EntityEndDate,
    required this.IsLeafNode,
    this.BarcodeNFC,
    required this.EntityLevel,
    this.EntityException,
    this.ScheduleOccurrenceIds,
  });

  late final int AuditEntityId;
  late final int AuditId;
  late final String AuditEntityName;
  late final int AuditEntityTypeId;
  late final int AuditParentEntityId;
  late final int SequenceNo;
  late final String? EntityEndDate;
  late final bool IsLeafNode;
  late final String? BarcodeNFC;
  late final int EntityLevel;
  late final bool? EntityException;
  late final String? ScheduleOccurrenceIds;

  AuditEntityItem.fromJson(Map<String, dynamic> json) {
    AuditEntityId = json['AuditEntityId'];
    AuditId = json['AuditId'];
    AuditEntityName = json['AuditEntityName'];
    AuditEntityTypeId = json['AuditEntityTypeId'];
    AuditParentEntityId = json['AuditParentEntityId'];
    SequenceNo = json['SequenceNo'];
    EntityEndDate = json['EntityEndDate'];
    IsLeafNode = json['IsLeafNode'];
    BarcodeNFC = json['BarcodeNFC'];
    EntityLevel = json['EntityLevel'];
    EntityException = json['EntityException'];
    ScheduleOccurrenceIds = json['ScheduleOccurrenceIds'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['AuditEntityId'] = AuditEntityId;
    _data['AuditId'] = AuditId;
    _data['AuditEntityName'] = AuditEntityName;
    _data['AuditEntityTypeId'] = AuditEntityTypeId;
    _data['AuditParentEntityId'] = AuditParentEntityId;
    _data['SequenceNo'] = SequenceNo;
    _data['EntityEndDate'] = EntityEndDate;
    _data['IsLeafNode'] = IsLeafNode;
    _data['BarcodeNFC'] = BarcodeNFC;
    _data['EntityLevel'] = EntityLevel;
    _data['EntityException'] = EntityException;
    _data['ScheduleOccurrenceIds'] = ScheduleOccurrenceIds;
    return _data;
  }
}
