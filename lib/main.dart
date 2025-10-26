import 'package:flutter/material.dart';
import 'user/db/linhkien_database.dart';
import 'user/view/component_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final db = LinhKienDatabase();
  runApp(MyApp(db: db));
}

class MyApp extends StatelessWidget {
  final LinhKienDatabase db;
  const MyApp({Key? key, required this.db}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý linh kiện',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ComponentScreen(db: db),
    );
  }
}

