import 'package:flutter/material.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Sqllite demo",
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

