import 'package:flutter/src/widgets/framework.dart';
import 'package:production/productions/api/productions_api.dart';
import 'package:production/productions/product_manager.dart';

class ProductionGet{

  Future<double> getTotalWeight(String name, String year, String month) async {
    int totalWeight = 0;
    double doubleWeight = 0;

    var sYearList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('year');
    var sMonthList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('month');
    var sQuantityList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('quantity');
    var sNameList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('name');

    for (int i = 0; i < sYearList!.length; i++) {
      if (sYearList[i] == year &&
          sMonthList![i] == month &&
          sNameList![i] == name) {
        totalWeight += int.tryParse(sQuantityList![i])!;
        doubleWeight = totalWeight.toDouble();
      }
    }
    return doubleWeight;
  }

  Future<double> getLettuceWeight(String year, String month) async => getTotalWeight('lettuce', year, month);
  Future<double> getXiaoBaiWeight(String year, String month) async => getTotalWeight('xiaobai', year, month);
  Future<double> getNaiBaiWeight(String year, String month) async => getTotalWeight('naibai', year, month);

  Future<double> getTotalQuantity(String name,String year, String month) async {
    int totalQuantity = 0;
    double doubleQuantity = 0;

    var sYearList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('year');
    var sMonthList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('month');
    var sQuantityList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('quantity');
    var sNameList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('name');

    for (int i = 0; i < sYearList!.length; i++) {
      if (sYearList[i] == year &&
          sMonthList![i] == month &&
          sNameList![i] == name) {
        totalQuantity += int.tryParse(sQuantityList![i])!;
        doubleQuantity = totalQuantity.toDouble();
      }
    }
    return doubleQuantity;
  }

  Future<double> getLettuceNumber(String year, String month) async => getTotalQuantity('lettuce', year, month);
  Future<double> getXiaoBaiNumber(String year, String month) async => getTotalQuantity('xiaobai', year, month);
  Future<double> getNaiBaiNumber(String year, String month) async => getTotalQuantity('naibai', year, month);
}
