import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/delete_audit_table_entity.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/get_json_data_from_asset.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/insert_audit_table_entity.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/read_audit_table_entries.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/update_audit_table_entity_name.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/watch_audit_table_data.dart';

part 'audit_entity_state.dart';

class AuditEntityCubit extends Cubit<AuditEntityState> {
  final GetEntriesFromAuditTableUseCase getEntriesFromAuditTableUseCase;
  final InsertEntriesInAuditTableUseCase insertEntriesInAuditTableUseCase;
  final DeleteAuditTableEntityUseCase deleteAuditTableEntityUseCase;
  final UpdateEntryInAuditTableUseCase updateEntryInAuditTableUseCase;
  final GetJsonDataFromAssetUseCase getJsonDataFromAssetUseCase;
  final WatchAuditTableDataUseCase watchAuditTableDataUseCase;

  AuditEntityCubit(
      {required this.getEntriesFromAuditTableUseCase,
      required this.insertEntriesInAuditTableUseCase,
      required this.deleteAuditTableEntityUseCase,
      required this.updateEntryInAuditTableUseCase,
      required this.getJsonDataFromAssetUseCase,
      required this.watchAuditTableDataUseCase})
      : super(AuditEntityInitial());

  //insert entries to audit table
  getDataAuditTableToHomePage() async {
    emit(AuditEntityLoading());
    try {

      final dataFromAuditTable = watchAuditTableDataUseCase.call();
      print("dataFromAuditTable  .."+dataFromAuditTable.toString());
      dataFromAuditTable.listen((auditData) async {
        print("auditdata  .."+auditData.toString());
        if (auditData!.length==0) {

          final  dataListFromJsonFile =
              await getJsonDataFromAssetUseCase.call();
          print("dataListFromJsonFile"+dataListFromJsonFile.toString());
          for (int i = 0; i < dataListFromJsonFile!.length; i++) {
            final model = Audit(
                audit_id: dataListFromJsonFile[i].audit_id,
                audit_entity_name: dataListFromJsonFile[i].audit_entity_name,
                audit_entity_end_date:
                    dataListFromJsonFile[i].audit_entity_end_date);
            await insertEntriesInAuditTableUseCase(model);
          }
        } else {
          emit(AuditEntityLoaded(auditData));
        }
      });
    } catch (e) {
      emit(const AuditEntityFailure(
          errorMsg: 'Error while fetching data from Audit Table..!!'));
    }
  }

  updateEntityFromAuditTable(AuditsCompanion model) async {
    await updateEntryInAuditTableUseCase.call(model);
  }

  deleteEntityFromAuditTable(Audit model) async {
    await deleteEntityFromAuditTable.call(model);
  }
}
