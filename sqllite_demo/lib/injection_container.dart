import 'package:get_it/get_it.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/audit_table_data_source.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/audit_table_data_source_impl.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/repositories/audit_entity_repository_impl.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/repositories/audit_entity_repository.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/delete_audit_table_entity.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/get_json_data_from_asset.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/insert_audit_table_entity.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/read_audit_table_entries.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/update_audit_table_entity_name.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/watch_audit_table_data.dart';

import 'feature/crud_operation_on_audit_table/presentation/cubit/audit_entity_cubit.dart';

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
  //usecase
  sl.registerLazySingleton<GetJsonDataFromAssetUseCase>(
      () => GetJsonDataFromAssetUseCase(auditEntityRepository: sl.call()));

  //usecase
  sl.registerLazySingleton<WatchAuditTableDataUseCase>(
          () => WatchAuditTableDataUseCase(auditEntityRepository: sl.call()));

  //repository
  sl.registerLazySingleton<AuditEntityRepository>(
      () => AuditEntityRepositoryImpl(auditTableDataSource: sl.call()));

  // database
  sl.registerLazySingleton<AuditDatabase>(() => AuditDatabase());

  //datasource
  sl.registerLazySingleton<AuditTableDataSource>(
      () => AuditTableDataSourceImpl(auditDB: sl.call()));

  // cubit
  sl.registerFactory<AuditEntityCubit>(() => AuditEntityCubit(
      insertEntriesInAuditTableUseCase: sl.call(),
      getEntriesFromAuditTableUseCase: sl.call(),
      getJsonDataFromAssetUseCase: sl.call(),
      deleteAuditTableEntityUseCase: sl.call(),
      updateEntryInAuditTableUseCase: sl.call(),
    watchAuditTableDataUseCase: sl.call()

  ));
}
