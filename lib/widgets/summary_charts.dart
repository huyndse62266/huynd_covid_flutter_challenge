import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:huyndcovidflutterchallenge/models/summary_model.dart';
import 'package:huyndcovidflutterchallenge/widgets/indicator.dart';
import 'package:huyndcovidflutterchallenge/widgets/summary_data.dart';
import '../utils/constants.dart' as Constants;

class SummaryChart extends StatelessWidget {
  final SummaryModel summaryModel;

  SummaryChart(this.summaryModel);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections()),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Indicator(
                    color: Color(Constants.ACTIVE_COLOR),
                    text: 'Active',
                    isSquare: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Indicator(
                    color: Color(Constants.DEATH_COLOR),
                    text: 'Deaths',
                    isSquare: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Indicator(
                    color: Color(Constants.RECOVERED_COLOR),
                    text: 'Recovered',
                    isSquare: true,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
            )
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    final deathsRate = (summaryModel.totalDeaths / summaryModel.totalConfirmed*100).round();
    final recoveredRate = (summaryModel.totalRecovered / summaryModel.totalConfirmed*100).round();
    final activeRate = 100-deathsRate-recoveredRate;
    print(activeRate);
    return List.generate(3, (i) {
      final double fontSize = 16;
      final double radius = 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color(Constants.ACTIVE_COLOR),
            value: double.parse(activeRate.toString()),
            title: '$activeRate%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(Constants.DEATH_COLOR),
            value: double.parse(deathsRate.toString()),
            title: '$deathsRate%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(Constants.RECOVERED_COLOR),
            value: double.parse(recoveredRate.toString()),
            title: '$recoveredRate%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );

        default:
          return null;
      }
    });
  }
}
