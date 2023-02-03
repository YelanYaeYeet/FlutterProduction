import 'package:flutter/material.dart';
import 'package:gsheets/src/gsheets.dart';
import 'package:production/lib/model/production_field.dart';
import 'package:production/productions/api/productions_api.dart';

class ProductManager {
  late int? rowCount;

  Future<void> fetchDataFromSheets() async {
    await ProductionSheetsApi.init();
    rowCount = ProductionSheetsApi.productSheet?.index;
  }
}

void main() async {
  ProductManager productManager = ProductManager();
  await productManager.fetchDataFromSheets();
  var sMonthList =
      await ProductionSheetsApi.productSheet?.values.columnByKey('month');
  var sWeightList =
      await ProductionSheetsApi.productSheet?.values.columnByKey('weight');
  int totalWeight = 0;

  for (int i = 0; i < sMonthList!.length; i++) {
    if (sMonthList[i] == "December") {
      var weightTest = sWeightList![i];
      int? weightInt = int.tryParse(weightTest);
      totalWeight += weightInt!;
    }
  }

  print("total weight in December: $totalWeight");
  var lastRow = await ProductionSheetsApi.productSheet?.values.map.lastRow();
  print(await ProductionSheetsApi.productSheet?.values.map.columnByKey('zone'));
  print(await ProductionSheetsApi.productSheet?.values.columnByKey('weight'));
}

  // Future<Products?> getByYear(String year) async {
  //   await ProductionSheetsApi.init();
  //   final mapYear = await sheets?.values.map.rowByKey(
  //     year,
  //     fromColumn: 1,
  //   );
  //   return mapYear == null ? null : Products.fromGsheets(mapYear);
  // }

  // Future<Products?> getByMonth(String month) async {
  //   await ProductionSheetsApi.init();
  //   final mapMonth = await sheets?.values.map.rowByKey(
  //     month,
  //     fromColumn: 2,
  //   );
  //   print(mapMonth);
  //   return mapMonth == null ? null : Products.fromGsheets(mapMonth);
  // }

  // Future<String> weightByMonth(String month) async {
  //   await ProductionSheetsApi.init();
  //   var weightMonth =
  //       await sheets?.values.valueByKeys(rowKey: month, columnKey: 'weight');
  //   return weightMonth!;
  // }

