import 'package:dartz/dartz.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/repositories/audit_entity_repository.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/presentation/cubit/audit_entity_cubit.dart';

class GetJsonDataFromAssetUseCase {
  final AuditEntityRepository auditEntityRepository;

  GetJsonDataFromAssetUseCase({required this.auditEntityRepository});

  Future<List<Audit>?>? call() async {
    await auditEntityRepository.getJsonDataFromAsset();
  }
}