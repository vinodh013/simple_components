import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'charts_utils.dart';
import '../../charts/chart_boundary/base_chart_boundry.dart';

// base class for any line chart implementation
abstract class BaseLineChart extends StatelessWidget {
  final int titlesOnXAxis;
  final int titlesOnYAxis;
  final Color borderColor;

  const BaseLineChart(
      {super.key,
      this.titlesOnXAxis = 3,
      this.titlesOnYAxis = 3,
      this.borderColor = const Color(0xff37434d)});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      mainData(),
    );
  }

  AxisTitles createBottomAxisTitle(BaseChartBoundary boundary);

  AxisTitles createLeftAxisTitle(BaseChartBoundary boundary);

  BaseChartBoundary calculateBoundary();

  List<LineChartBarData> createLineBarsData();

  LineTouchData lineTouchData();

  LineChartData mainData() {
    var boundary = calculateBoundary();

    return LineChartData(
      borderData: FlBorderData(
        // border: Border.all(

        //   color: Colors.black12
        // )

        border: const Border(
            bottom: BorderSide(color: Colors.black12),
            left: BorderSide(color: Colors.black12),
            right: BorderSide.none,
            top: BorderSide.none),
      ),
      gridData: ChartUtils.noGridData,
      titlesData: FlTitlesData(
        show: true,
        rightTitles: ChartUtils.noTitles,
        topTitles: ChartUtils.noTitles,
        bottomTitles: createBottomAxisTitle(boundary),
        leftTitles: createLeftAxisTitle(boundary),
      ),
      // borderData: FlBorderData(
      //   show: true,
      //   border: Border.all(color: borderColor),
      // ),
      lineTouchData: lineTouchData(),
      minX: boundary.minX,
      maxX: boundary.maxX,
      minY: boundary.minY,
      maxY: boundary.maxY,
      lineBarsData: createLineBarsData(),
    );
  }
}
