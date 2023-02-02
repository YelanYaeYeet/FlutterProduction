import 'package:flutter/material.dart';
import 'package:production/page/create_page.dart';
import 'package:production/pie_chart/sample/pie_chart_view.dart';
import 'package:production/pie_chart/sample/presentation_view.dart';
import 'package:production/productions/api/productions_api.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ProductionSheetsApi.init();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  static const String title = 'Production Sheet';

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

int _selectedIndex = 0;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: content(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: "Graphs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: "Add Sheets",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }

  Widget content() {
    switch (_selectedIndex) {
      case 0:
        return Center(
          child: Container(
            child: Text("Home Display"),
          ),
        );
      case 1:
        return PresentationView();
      case 2:
        return CreateSheetPage();

      default:
        return Container();
    }
  }
}
