import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/presentation/cubit/audit_entity_cubit.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/presentation/pages/home_page.dart';
import 'injection_container.dart' as di;
void main() async{
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AuditEntityCubit>(),
      child: const MaterialApp(
        title: "Audits Analysis",
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

