import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:production/productions/product_manager.dart';
import 'package:production/productions/values_getter.dart';
import 'package:production/resources/indicator.dart';

class PieChartSampleView1 extends StatefulWidget {
  const PieChartSampleView1({super.key});

  @override
  State<StatefulWidget> createState() => PieChartSampleViewState1();

  void showingSections() {}
}

class PieChartSampleViewState1 extends State {
  int touchedIndex = 0;
  ProductManagerState productManagerState = ProductManagerState();
  String? selectYear, selectMonth;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PieChartSectionData>>(
      future: showingSections(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AspectRatio(
            aspectRatio: 1.3,
            child: Card(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    const SizedBox(
                      height: 18,
                    ),
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: PieChart(
                          PieChartData(
                            pieTouchData: PieTouchData(
                              touchCallback:
                                  (FlTouchEvent event, pieTouchResponse) {
                                setState(() {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
                                    touchedIndex = -1;
                                    return;
                                  }
                                  touchedIndex = pieTouchResponse
                                      .touchedSection!.touchedSectionIndex;
                                });
                              },
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 0,
                            centerSpaceRadius: 0,
                            sections: snapshot.data,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Indicator(
                          color: const Color(0xff0293ee),
                          text: 'NaiBai(奶白)',
                          isSquare: true,
                          picture: SvgPicture.asset('bok-choy-svgrepo-com.svg'),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: const Color(0xff845bef),
                          text: 'XiaoBai(小白)',
                          isSquare: true,
                          picture:
                              SvgPicture.asset('leafy-green-svgrepo-com.svg'),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: const Color(0xff13d38e),
                          text: 'Lettuce',
                          isSquare: true,
                          picture: SvgPicture.asset('salad-svgrepo-com.svg'),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                      ],
                    )
                  ],
                )),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<List<PieChartSectionData>> showingSections() async {
    ProductionGet productManager = ProductionGet();
    if (productManagerState.selectedPaiYear != null) {
      print(productManagerState.selectedPaiYear);
    } else {
      print("its a null");
    }
    if (productManagerState.combinedMonth != null) {
      selectMonth = productManagerState.combinedMonth;
    } else {
      print("combined Month is null");
    }
    if (productManagerState.combinedYear != null) {
      selectYear = productManagerState.combinedYear;
    } else {
      print("combined Year is null");
    }

    double lNumber = await productManager.getLettuceNumber(
        selectYear.toString(), selectMonth.toString());
    double xbNumber = await productManager.getXiaoBaiNumber(
        selectYear.toString(), selectMonth.toString());
    double nbNumber = await productManager.getNaiBaiNumber(
        selectYear.toString(), selectMonth.toString());
    double total = lNumber + xbNumber + nbNumber;
    double lw = (lNumber / total) * 100,
        xw = (xbNumber / total) * 100,
        nw = (nbNumber / total) * 100;
    String lws = lw.toStringAsFixed(1),
        xws = xw.toStringAsFixed(1),
        nws = nw.toStringAsFixed(1);

    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: nbNumber,
            title: 'Naibai \n $nws% \n $nbNumber',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
            badgeWidget: _Badge(
              'assets/bok-choy-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xff0293ee),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: xbNumber,
            title: 'XiaoBai \n $xws% \n $xbNumber',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
            badgeWidget: _Badge(
              'assets/leafy-green-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xff845bef),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: lNumber,
            title: 'Lettuce \n $lws% \n $lNumber',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
            badgeWidget: _Badge(
              'assets/salad-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xff13d38e),
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw Exception("Oh no");
      }
    });
  }
}

// void stealData() {
//   PieChartSampleData pieChartSampleData = PieChartSampleData(sheet);
//   pieChartSampleData.getData();
//   int numberValue = pieChartSampleData.number[0];
// }

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAssets, {
    required this.size,
    required this.borderColor,
  });
  final String svgAssets;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: SvgPicture.asset(
          svgAssets,
        ),
      ),
    );
  }
}
