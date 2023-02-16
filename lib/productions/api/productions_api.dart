import 'dart:developer';
import 'package:gsheets/gsheets.dart';
import 'package:production/lib/model/production_field.dart';

class ProductionSheetsApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "",
  "private_key_id": "",
  "private_key": "",
  "client_id": "",
  "auth_uri": "",
  "token_uri": "",
  "auth_provider_x509_cert_url": "s",
  "client_x509_cert_url": ""
}
''';

  static const _spreadsheetID = '';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? productSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetID);
      productSheet = await getWorkSheet(spreadsheet, title: 'Production');

      final firstRow = ProductionField.getFields();
      productSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      log('Init Error: $e');
    }
  }

  static Future<Worksheet> getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  Future<List<Products>?> getAll() async {
    await init();
    final products = await productSheet?.values.map.allRows();
    return products?.map((json) => Products.fromGsheets(json)).toList();
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (productSheet == null) {
      log("oh no");
    }
    productSheet!.values.map.appendRows(rowList);
  }
}
