import 'package:flutter/material.dart';
import 'user/view/component_screen.dart';
import 'user/db/LinhKienDatabaseHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LinhkienDatabaseHelper.instance.database; // phải có dòng này
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Điện tử Quý-Huy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const ComponentScreen(),
    );
  }
}
