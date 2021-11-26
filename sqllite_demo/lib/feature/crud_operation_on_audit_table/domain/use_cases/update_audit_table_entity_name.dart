import 'package:dartz/dartz.dart';
import 'package:sqllite_demo/core/error/failures.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/models/audit_entity_model.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/repositories/audit_entity_repository.dart';

class UpdateEntryInAuditTableUseCase {
  final AuditEntityRepository auditEntityRepository;

  UpdateEntryInAuditTableUseCase({required this.auditEntityRepository});

  Future<Either<Failure, AuditEntityResponse>?>? call() async {
     await auditEntityRepository.updateEntityNameInAuditTable();
  }
}
