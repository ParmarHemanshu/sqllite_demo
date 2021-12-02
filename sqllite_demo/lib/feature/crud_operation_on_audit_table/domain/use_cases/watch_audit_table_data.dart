import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/repositories/audit_entity_repository.dart';

class WatchAuditTableDataUseCase{
  final AuditEntityRepository auditEntityRepository;

  WatchAuditTableDataUseCase({required this.auditEntityRepository});

  Stream<List<Audit>?> call() async* {
    yield* auditEntityRepository.watchEntriesOfAuditTable();
  }
}
