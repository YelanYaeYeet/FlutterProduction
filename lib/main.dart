import 'package:flutter/material.dart';
import 'package:production/page/create_page.dart';
import 'package:production/pie_chart/sample/presentation_view.dart';
import 'package:production/productions/api/productions_api.dart';
import 'package:production/productions/product_manager.dart';
import 'package:production/productions/values_getter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ProductionSheetsApi.init();
  runApp(const MaterialApp(
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
  ProductManagerState productManagerState = ProductManagerState();
  String? paimonValue, paiYearValue;
  void hehee() {
    if (productManagerState.combinedMonth != null) {
      paimonValue = productManagerState.combinedMonth;
    } else {
      print("hello world");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: content(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: productManagerState.selectedPaimon.toString(),
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
        // return Center(
        //   child: Container(
        //     child: Text("home"),
        //   ),
        // );
        return const ProductManager();
      case 1:
        return const PresentationView();
      case 2:
        return const CreateSheetPage();

      default:
        return Container();
    }
  }
}
