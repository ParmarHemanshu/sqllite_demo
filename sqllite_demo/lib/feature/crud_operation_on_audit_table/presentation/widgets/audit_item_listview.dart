import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/moor/audit_table.dart';

import 'dialogs.dart';

Widget buildAuditItemListView(List<Audit> auditList, BuildContext context) {
  return ListView.builder(
    itemCount: auditList.length,
    itemBuilder: (BuildContext context, int index) {
      return Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 1,
            onPressed: (context) {
              displayUpdateDialog(context);
            },
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            flex: 1,
            onPressed: (context) {
              displayDeleteDialog(context, auditList[index]);
            },
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ]),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 0.5),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                auditList[index].audit_entity_name,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Icon(
                      MdiIcons.calendar,
                      size: 18,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 8),
                    child: Text(
                      auditList[index].audit_entity_end_date.toString(),
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black45),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
