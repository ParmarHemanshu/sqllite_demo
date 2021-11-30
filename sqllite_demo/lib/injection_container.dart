import 'package:get_it/get_it.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/audit_table_data_source.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/audit_table_data_source_impl.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/repositories/audit_entity_repository_impl.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/repositories/audit_entity_repository.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/delete_audit_table_entity.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/insert_audit_table_entity.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/read_audit_table_entries.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/update_audit_table_entity_name.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //usecase
  sl.registerLazySingleton<DeleteAuditTableEntityUseCase>(
      () => DeleteAuditTableEntityUseCase(auditEntityRepository: sl.call()));
  //usecase
  sl.registerLazySingleton<UpdateEntryInAuditTableUseCase>(
      () => UpdateEntryInAuditTableUseCase(auditEntityRepository: sl.call()));
  //usecase
  sl.registerLazySingleton<InsertEntriesInAuditTableUseCase>(
      () => InsertEntriesInAuditTableUseCase(auditEntityRepository: sl.call()));
  //usecase
  sl.registerLazySingleton<GetEntriesFromAuditTableUseCase>(
      () => GetEntriesFromAuditTableUseCase(auditEntityRepository: sl.call()));

  //repository
  sl.registerLazySingleton<AuditEntityRepository>(
      () => AuditEntityRepositoryImpl(auditTableDataSource: sl.call()));

  //datasource
  sl.registerLazySingleton<AuditTableDataSource>(
      () => AuditTableDataSourceImpl());
}
