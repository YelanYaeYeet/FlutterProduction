import 'package:flutter/material.dart';
import 'package:production/pie_chart/sample/pie_chart_view_number.dart';
import 'package:production/pie_chart/sample/pie_chart_view_weight.dart';
import 'package:production/productions/product_manager.dart';

class PresentationView extends StatefulWidget {
  const PresentationView({super.key});

  @override
  State<PresentationView> createState() => PresentationViewState();
}

class PresentationViewState extends State<PresentationView> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedMonth = 'September', selectedYear = '2022';

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
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
              buildChooseColumn(),
              const Align(
                alignment: AlignmentDirectional(-0.95, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text('Weight'),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 20),
                  child: Container(
                    width: 366.6,
                    height: 366.8,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: const PieChartSampleView(),
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(-0.95, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text('Quantity'),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 20),
                  child: Container(
                    width: 366.6,
                    height: 366.8,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: const PieChartSampleView1(),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget buildChooseColumn() => ProductManager();
}
