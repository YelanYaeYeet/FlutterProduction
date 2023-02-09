import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:production/productions/product_manager.dart';
import 'package:production/productions/values_getter.dart';
import 'package:production/resources/indicator.dart';

class PieChartSampleView extends StatefulWidget {
  const PieChartSampleView({super.key});

  @override
  State<StatefulWidget> createState() => PieChartSampleViewState();

  void showingSections() {}
}

class PieChartSampleViewState extends State {
  int touchedIndex = 0;
  String selectedPaiYear = '2022', selectedPaimon = 'September';
  // PaiSelection _paiSelection = PaiSelection();

  void _reloadWidget() {
    setState(() {});
  }

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
    double lWeight = await productManager.getLettuceWeight(selectedPaiYear, selectedPaimon);
    double xbWeight = await productManager.getXiaoBaiWeight(selectedPaiYear, selectedPaimon);
    double nbWeight = await productManager.getNaiBaiWeight(selectedPaiYear, selectedPaimon);
    double total = lWeight + xbWeight + nbWeight;
    double lw = (lWeight / total) * 100,
        xw = (xbWeight / total) * 100,
        nw = (nbWeight / total) * 100;
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
            value: nbWeight,
            title: "NaiBai \n $nws% \n $nbWeight",
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
            value: xbWeight,
            title: "XiaoBai \n $xws% \n $xbWeight",
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
            value: lWeight,
            title: 'Lettuce \n $lws% \n $lWeight',
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
