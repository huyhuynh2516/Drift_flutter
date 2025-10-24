import 'package:flutter/material.dart';
import 'database/app_database.dart';
import 'ui/product_page.dart';

void main() {
  final db = AppDatabase();
  runApp(MyApp(db: db));
}

class MyApp extends StatelessWidget {
  final AppDatabase db;
  const MyApp({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(db: db),
    );
  }
}
