import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_components/models/model.dart';
import '../../charts/chart_boundary/base_chart_boundry.dart';
import '../../charts/chart_boundary/sales_line_chart_boundry.dart';
import '../../charts/convertor/chart_data_convertor.dart';
import '../../charts/tile_renderer/x_axis_month_title_renderer.dart';
import '../../charts/tile_renderer/y_axis_number_title_renderer.dart';
import '../base/baseline_chart_boundry.dart';
import '../base/charts_utils.dart';

// creates a line chart for a crypto price to date
class TotalSaleslinechart extends BaseLineChart {
  final List<CustomerWithTotal>? sales;
  final DateTime initialDate;
  final DateTime finalDate;
  final double xAxistileWidth;
  final double yAxistileWidth;

  const TotalSaleslinechart(this.sales,
      {required this.initialDate,
      required this.finalDate,
      required this.xAxistileWidth,
      required this.yAxistileWidth,
      super.key,
      super.titlesOnYAxis = 4,
      super.titlesOnXAxis = 5});

  @override
  BaseChartBoundary calculateBoundary() {
    var boundary = LineChartBoundary<CustomerWithTotal>(
        sales ?? [], (element) => element.totalSales,
        initialDate: initialDate, finalDate: finalDate);
    boundary.init();
    return boundary;
  }

  @override
  AxisTitles createBottomAxisTitle(
    BaseChartBoundary boundary,
  ) {
    var xAxisRenderer =
        XAxisMonthTitleRenderer(initialDate: initialDate, finalDate: finalDate);

    return ChartUtils.createAxisTitle(
        xAxistileWidth, boundary.maxX / (titlesOnXAxis - 1), xAxisRenderer.render);
  }

  @override
  AxisTitles createLeftAxisTitle(BaseChartBoundary boundary) {
    var yAxisRenderer = YAxisNumberTitleRenderer();

    return ChartUtils.createAxisTitle(
        yAxistileWidth, boundary.maxY / titlesOnYAxis, yAxisRenderer.render);
  }

  @override
  LineTouchData lineTouchData() {
    return LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: Colors.white,
        getTooltipItems: (List<LineBarSpot> touchedSpots) {
          return touchedSpots.map((LineBarSpot touchedSpot) {
            int index = touchedSpot.x.toInt();
            double value = touchedSpot.y;

            bool sameday = initialDate.day == finalDate.day &&
                initialDate.month == finalDate.month &&
                initialDate.year == finalDate.year;

            List<DateTime> dates = [];

            int numberOfDays =
                sameday ? 24 : finalDate.difference(initialDate).inDays + 1;

            // int numberOfDays = finalDate.difference(initialDate).inDays + 1;

            // Generate the list of dates
            for (int i = 0; i < numberOfDays; i++) {
              DateTime date = sameday
                  ? initialDate.add(Duration(hours: i))
                  : initialDate.add(Duration(days: i));
              dates.add(date);
            }

            // for (int i = 0; i < numberOfDays; i++) {
            //   int order =
            //       sales!.where((element) => element.date == dates[i]).length;

            //   // sameday
            //   //     ? initialDate.add(Duration(hours: i))
            //   //     : initialDate.add(Duration(days: i));
            //   orders.add(order);
            // }

            DateTime date = dates[index];

            // int order = orders[index];

            // Assuming dates list is accessible here

            // int orders = sales!.where((element) => element.date == date).length;

            String tooltipText = sameday
                ? '${DateFormat('hh:mm').format(date)}\nAmount: $value, '
                : '${DateFormat('dd MMM yyyy').format(date)}\nAmount: $value,';

            return LineTooltipItem(tooltipText, const TextStyle());
          }).toList();
        },
      ),
    );
  }

  @override
  List<LineChartBarData> createLineBarsData() {
    const List<Color> gradientColors = [
      Color(0xff00BCD4),
      Color(0xff673AB7),
    ];

    var data = ChartDataConverter.convert(
        sales ?? [], (element) => element.total, 1, initialDate, finalDate);

    return [
      LineChartBarData(
        spots: data,
        isCurved: true,
        preventCurveOverShooting: true,
        gradient: const LinearGradient(
          colors: gradientColors,
        ),
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
                gradientColors.map((color) => color.withOpacity(0.5)).toList(),
          ),
        ),
      ),
    ];
  }
}
