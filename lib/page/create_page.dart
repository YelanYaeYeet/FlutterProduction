import 'package:flutter/material.dart';
import 'package:production/productions/api/productions_api.dart';
import 'package:production/widget/product_form_widget.dart';

class CreateSheetPage extends StatefulWidget {
  const CreateSheetPage({super.key});
  @override
  State<CreateSheetPage> createState() => _CreateSheetPageState();
}

class _CreateSheetPageState extends State<CreateSheetPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Add Data"),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: ProductFormWidget(
            onSavedProducts: (products) async {
              await ProductionSheetsApi.insert([products.toJson()]);
            },
          ),
        ),
      );
}
