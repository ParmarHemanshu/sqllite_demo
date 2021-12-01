import 'package:dartz/dartz.dart';
import 'package:sqllite_demo/core/error/failures.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/entities/audit_entity.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/repositories/audit_entity_repository.dart';

class InsertEntriesInAuditTableUseCase {
  final AuditEntityRepository auditEntityRepository;

  InsertEntriesInAuditTableUseCase({required this.auditEntityRepository});

  Future<void>? call(Audit model) async {
    await auditEntityRepository.insertJsonDataIntoAuditTable(model);
  }
}
