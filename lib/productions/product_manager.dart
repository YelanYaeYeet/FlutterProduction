import 'package:flutter/material.dart';
import 'package:production/resources/hard_coded.dart';

class ProductManager extends StatefulWidget {
  const ProductManager({super.key});

  @override
  State<ProductManager> createState() => ProductManagerState();
}

class ProductManagerState extends State<ProductManager> {
  String? selectedPaimon = "September",
      selectedPaiYear = "2022",
      combinedMonth,
      combinedYear;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: const AlignmentDirectional(1, 0.3),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 10, 0),
            child: DropdownButton<String>(
              hint: const Text("Select Month "),
              elevation: 2,
              value: selectedPaimon,
              items: Resources.monthList.map(buildMonth).toList(),
              onChanged: (selectedPaimon) {
                setState(() => this.selectedPaimon = selectedPaimon);
                if (selectedPaimon != null) {
                  chooseMonth(selectedPaimon);
                } else {
                  throw Exception("selectedPaimon is null");
                }
              },
              underline: const SizedBox(),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(1, 0.3),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 10, 0),
            child: DropdownButton<String>(
              hint: const Text("Select Year "),
              elevation: 2,
              value: selectedPaiYear,
              items: Resources.yearList.map(buildYear).toList(),
              onChanged: (selectedPaiYear) {
                setState(() {
                  this.selectedPaiYear = selectedPaiYear;
                  if (selectedPaiYear != null) {
                    chooseYear(selectedPaiYear);
                    print(chooseMonth(selectedPaiYear));
                  } else {
                    throw Exception("SelectedPaiYear is null");
                  }
                });
              },
              underline: const SizedBox(),
            ),
          ),
        ),
        Align(
          child: Text(selectedPaiYear.toString()),
        ),
        Align(
          child: Text(selectedPaimon.toString()),
        )
      ],
    );
  }

  String chooseMonth(String month) {
    String selectedMonth = month;
    return selectedMonth;
  }

  String chooseYear(String year) {
    String selectedYear = year;
    return selectedYear;
  }

  void combined(String? month, String? year) {
    if (month != null) {
      combinedMonth = chooseMonth(month);
    }
    if (year != null) {
      combinedYear = chooseYear(year);
    }
  }

  DropdownMenuItem<String> buildMonth(String monthItem) => DropdownMenuItem(
        value: monthItem,
        child: Text(monthItem),
      );
  DropdownMenuItem<String> buildYear(String yearItem) => DropdownMenuItem(
        value: yearItem,
        child: Text(yearItem),
      );
}
