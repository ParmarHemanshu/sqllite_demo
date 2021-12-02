import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/presentation/cubit/audit_entity_cubit.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/presentation/widgets/audit_item_listview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Audit Entries"),
              centerTitle: true,
              backgroundColor: Colors.blueAccent,
            ),
            body:  BlocBuilder<AuditEntityCubit, AuditEntityState>(builder: (context, state) {
              if (state is AuditEntityInitial) {
                print("entered init state");
                BlocProvider.of<AuditEntityCubit>(context).getDataAuditTableToHomePage();
                return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blueAccent,
                      strokeWidth: 5,
                    ));
              } else if (state is AuditEntityLoading) {
                print("entered loading state");
                return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blueAccent,
                      strokeWidth: 5,
                    ));
              } else if (state is AuditEntityLoaded) {
                return buildAuditItemListView(state.auditData, context);
              } else {
                return const Center(child: Text("failed to load the data!!"));
              }
            })));
  }
}

