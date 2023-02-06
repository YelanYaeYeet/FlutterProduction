import 'package:production/productions/api/productions_api.dart';

class ProductManager {
  Future<double> getLettuceWeight() async {
    int totalLWeight = 0;
    double doubleLWeight = 0;
    var sYearList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('year');
    var sMonthList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('month');
    var sWeightList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('weight');
    var sNameList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('name');
    for (int a = 0; a < sYearList!.length; a++) {
      if (sYearList[a] == '2022') {
        if (sMonthList![a] == "December") {
          if (sNameList![a] == 'lettuce') {
            totalLWeight += int.tryParse(sWeightList![a])!;
            doubleLWeight = totalLWeight.toDouble();
          }
        }
      }
    }

    return doubleLWeight;
  }

  Future<double> getXiaoBaiWeight() async {
    int totalXbWeight = 0;
    double doubleXbWeight = 0;
    var sYearList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('year');
    var sMonthList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('month');
    var sWeightList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('weight');
    var sNameList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('name');
    for (int b = 0; b < sYearList!.length; b++) {
      if (sYearList[b] == '2022') {
        if (sMonthList![b] == "December") {
          if (sNameList![b] == 'xiaobai') {
            totalXbWeight += int.tryParse(sWeightList![b])!;
            doubleXbWeight = totalXbWeight.toDouble();
          }
        }
      }
    }
    return doubleXbWeight;
  }

  Future<double> getNaiBaiWeight() async {
    int totalNbWeight = 0;
    double doubleNbWeight = 0;
    var sYearList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('year');
    var sMonthList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('month');
    var sWeightList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('weight');
    var sNameList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('name');

    for (int c = 0; c < sYearList!.length; c++) {
      if (sYearList[c] == '2022') {
        if (sMonthList![c] == "December") {
          if (sNameList![c] == 'naibai') {
            totalNbWeight += int.tryParse(sWeightList![c])!;
            doubleNbWeight = totalNbWeight.toDouble();
          }
        }
      }
    }
    return doubleNbWeight;
  }

  Future<double> getLettuceNumber() async {
    int totalLNumber = 0;
    double doubleLNumber = 0;
    var sYearList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('year');
    var sMonthList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('month');
    var sWeightList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('weight');
    var sNameList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('name');
    for (int d = 0; d < sYearList!.length; d++) {
      if (sYearList[d] == '2022') {
        if (sMonthList![d] == "November") {
          if (sNameList![d] == 'lettuce') {
            totalLNumber += int.tryParse(sWeightList![d])!;
            doubleLNumber = totalLNumber.toDouble();
          }
        }
      }
    }
    return doubleLNumber;
  }

  Future<double> getXiaoBaiNumber() async {
    int totalXbNumber = 0;
    double doubleXbNumber = 0;
    var sYearList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('year');
    var sMonthList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('month');
    var sWeightList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('weight');
    var sNameList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('name');
    for (int i = 0; i < sYearList!.length; i++) {
      if (sYearList[i] == '2022') {
        if (sMonthList![i] == "November") {
          if (sNameList![i] == 'lettuce') {
            totalXbNumber += int.tryParse(sWeightList![i])!;
            doubleXbNumber = totalXbNumber.toDouble();
          }
        }
      }
    }
    return doubleXbNumber;
  }

  Future<double> getNaiBaiNumber() async {
    int totalNbNumber = 0;
    double doubleNbNumber = 0;
    var sYearList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('year');
    var sMonthList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('month');
    var sWeightList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('weight');
    var sNameList =
        await ProductionSheetsApi.productSheet?.values.columnByKey('name');
    for (int x = 0; x < sYearList!.length; x++) {
      if (sYearList[x] == '2022') {
        if (sMonthList![x] == "November") {
          if (sNameList![x] == 'lettuce') {
            totalNbNumber += int.tryParse(sWeightList![x])!;
            doubleNbNumber = totalNbNumber.toDouble();
          }
        }
      }
    }
    return doubleNbNumber;
  }
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

