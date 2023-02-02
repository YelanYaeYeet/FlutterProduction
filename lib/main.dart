import 'package:flutter/material.dart';
import 'package:production/page/create_page.dart';
import 'package:production/productions/api/productions_api.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ProductionSheetsApi.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static const String title = 'Production Sheet';

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyApp.title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CreateSheetPage(),
    );
  }
}