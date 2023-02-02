import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:production/pie_chart/sample/pie_chart_view.dart';
import 'package:production/resources/hard_coded.dart';

class PresentationView extends StatefulWidget {
  const PresentationView({super.key});

  @override
  State<PresentationView> createState() => _PresentationViewState();
}

class _PresentationViewState extends State<PresentationView> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? _selectedMonth;

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: const Text('Chart')),
      body: SingleChildScrollView(
        child: SafeArea(
            child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(1, 0.3),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 10, 0),
                  child: DropdownButton(
                    hint: const Text("Please Select... "),
                    elevation: 2,
                    value: _selectedMonth,
                    onChanged: (monthValue) {
                      setState(() {
                        _selectedMonth = monthValue as String?;
                      });
                    },
                    items: Resources.monthList.map((monthItem) {
                      return DropdownMenuItem(
                        value: monthItem,
                        child: Text(monthItem),
                      );
                    }).toList(),
                    underline: const SizedBox(),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 60, 10, 50),
                  child: Container(
                    width: 366.6,
                    height: 366.8,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: PieChartSampleView(),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
