import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/models/audit_entity_model.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/delete_audit_table_entity.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/insert_audit_table_entity.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/read_audit_table_entries.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/domain/use_cases/update_audit_table_entity_name.dart';

part 'audit_entity_state.dart';

class AuditEntityCubit extends Cubit<AuditEntityState> {

  final GetEntriesFromAuditTableUseCase getEntriesFromAuditTableUseCase;
  final InsertEntriesInAuditTableUseCase insertEntriesInAuditTableUseCase;
  final DeleteAuditTableEntityUseCase deleteAuditTableEntityUseCase;
  final UpdateEntryInAuditTableUseCase updateEntryInAuditTableUseCase;

  AuditEntityCubit(this.getEntriesFromAuditTableUseCase,
      this.insertEntriesInAuditTableUseCase,
      this.deleteAuditTableEntityUseCase,
      this.updateEntryInAuditTableUseCase)
      : super(AuditEntityInitial());


  //insert entries to audit table
  readDataFromJsonToAuditTable(AuditDatabase database) async {
    emit(AuditEntityLoading());
    try {
      final result = getEntriesFromAuditTableUseCase.call();
      result!.listen((auditData) async {
        if (auditData!.length == 0) {
          final jsonData = await rootBundle.loadString(
              "assets/json/entity.json");
          final Map<String, dynamic> map = json.decode(jsonData);
          final List<dynamic> list = map["auditEntity"];
          for (int i = 0; i < list.length; i++) {
            var auditId = map["auditEntity"][i]["AuditEntityId"];
            var auditName = map["auditEntity"][i]["AuditEntityName"];
            var auditEndDate = map["auditEntity"][i]["EntityEndDate"];
            database.insertNewEntry(AuditsCompanion(
                audit_id: auditId,
                audit_entity_name: auditName,
                audit_entity_end_date: auditEndDate));
            await insertAuditEntityUsecase.call(auditData);
          }
        } else {
          emit(AuditEntityLoaded(auditData));
        }
      }}
          catch (e)
      {
        emit(const AuditEntityFailure(errorMsg: "Something went wrong!!"));
      }
    }
}
