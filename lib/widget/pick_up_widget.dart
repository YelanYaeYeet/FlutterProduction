import 'package:flutter/material.dart';
import 'package:production/resources/hard_coded.dart';

class ProductChoice extends StatefulWidget {
  final ValueChanged<String> onMonthChange;
  final ValueChanged<String> onYearChange;
  final ValueChanged<String> onNameChange;
  final ValueChanged<String> onZoneChange;

  ProductChoice({
    Key? key,
    required this.onMonthChange,
    required this.onYearChange,
    required this.onNameChange,
    required this.onZoneChange,
  });

  @override
  State<ProductChoice> createState() => ProductChoiceState();
}

class ProductChoiceState extends State<ProductChoice> {

  String? _selectedMonth;
  String? _selectedYear;
  String? _selectedName;
  String? _selectedZone;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: content(),
    );
  }

  Widget content() {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                width: 150,
                padding: const EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: <Widget> [DropdownButton(
                    hint: const Text("Select Months: "),
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: const SizedBox(),
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    value: _selectedMonth,
                    onChanged: (newMonth) {
                      setState(() {
                        _selectedMonth = newMonth as String?;
                      });
                      widget.onMonthChange(newMonth.toString());
                    },
                    items: Resources.monthList.map((monthItem) {
                      return DropdownMenuItem(
                        value: monthItem,
                        child: Text(monthItem),
                      );
                    }).toList(),
                  ),
                  if (_selectedMonth == null)
                      const Text(
                        "Please select a month",
                        style: TextStyle(color: Colors.red),
                      )
                  ]
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                width: 150,
                padding: const EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: <Widget>[DropdownButton(
                    hint: const Text("Select years: "),
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: const SizedBox(),
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    value: _selectedYear,
                    onChanged: (yearValue) {
                      setState(() {
                        _selectedYear = yearValue as String?;
                      });
                      widget.onYearChange(yearValue.toString());
                    },
                    items: Resources.yearList.map((yearItem) {
                      return DropdownMenuItem(
                        value: yearItem,
                        child: Text(yearItem),
                      );
                    }).toList(),
                  ),
                  if (_selectedYear == null)
                      const Text(
                        "Please select a year",
                        style: TextStyle(color: Colors.red),
                      )
                  ]
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(children: <Widget>[
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: <Widget> [ DropdownButton(
                  hint: const Text("Select Type: "),
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  underline: const SizedBox(),
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  value: _selectedName,
                  onChanged: (nameValue) {
                    setState(() {
                      _selectedName = nameValue as String?;
                    });
                    widget.onNameChange(nameValue.toString());
                  },
                  items: Resources.nameList.map((nameItems) {
                    return DropdownMenuItem(
                      value: nameItems,
                      child: Text(nameItems),
                    );
                  }).toList(),
                ),
                if (_selectedName == null)
                      const Text(
                        "Please select a Type",
                        style: TextStyle(color: Colors.red),
                      )
                ]
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: <Widget> [DropdownButton(
                  hint: const Text("Select Zone: "),
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  underline: const SizedBox(),
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  value: _selectedZone,
                  onChanged: (zoneValue) {
                    setState(() {
                      _selectedZone = zoneValue as String?;
                    });
                    widget.onZoneChange(zoneValue.toString());
                  },
                  items: Resources.zoneList.map((zoneItems) {
                    return DropdownMenuItem(
                      value: zoneItems,
                      child: Text(zoneItems),
                    );
                  }).toList(),
                ),
                if (_selectedZone == null)
                      const Text(
                        "Please select a zone",
                        style: TextStyle(color: Colors.red),
                      )
                ]
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
