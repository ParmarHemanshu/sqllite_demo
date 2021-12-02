import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moor_flutter/moor_flutter.dart' as moor;
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/presentation/cubit/audit_entity_cubit.dart';

displayUpdateDialog(BuildContext context, Audit auditItem) async {
  TextEditingController _auditTitleController = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Entity Title"),
          content: TextField(
            controller: _auditTitleController,
            textInputAction: TextInputAction.go,
            decoration: const InputDecoration(hintText: "Enter Audit Name"),
          ),
          actions: [
            ElevatedButton(
              child: const Text('Confirm'),
              onPressed: () {
                var title = _auditTitleController.text.trim();
                if (title.isNotEmpty) {
                  BlocProvider.of<AuditEntityCubit>(context)
                      .updateEntityFromAuditTable(AuditsCompanion(
                        audit_entity_name: moor.Value(title),
                      ))
                      .whenComplete(() => _goBackToHomePage(context));
                }
              },
            ),
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () {
                _goBackToHomePage(context);
              },
            )
          ],
        );
      });
}

displayDeleteDialog(BuildContext context, Audit auditItem) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete Audit Entry!!"),
          content: const Text("Do you want to Delete This Record ?"),
          actions: [
            ElevatedButton(
              child: const Text('Delete'),
              onPressed: () {
                BlocProvider.of<AuditEntityCubit>(context)
                    .deleteEntityFromAuditTable(auditItem)
                    .whenComplete(() => _goBackToHomePage(context));
              },
            ),
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () {
                _goBackToHomePage(context);
              },
            )
          ],
        );
      });
}

_goBackToHomePage(BuildContext context) {
  Navigator.of(context).pop();
}
