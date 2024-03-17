import 'dart:ui';
import 'package:fl_chart/src/chart/bar_chart/bar_chart_data.dart';
import 'package:fl_chart/src/chart/base/axis_chart/axis_chart_data.dart';
import 'package:simple_components/common/charts/ui/charts/chart_boundary/bar_chart_boundary.dart';
import 'package:simple_components/common/charts/ui/charts/chart_boundary/base_chart_boundry.dart';
import 'package:simple_components/common/charts/ui/charts/tile_renderer/x_tile_string_renderer.dart';
import 'package:simple_components/common/charts/ui/charts/tile_renderer/y_axis_number_title_renderer.dart';
import 'package:simple_components/common/charts/ui/widgets/base/base_bar_chart.dart';
import 'package:simple_components/common/charts/ui/widgets/base/charts_utils.dart';
import 'package:simple_components/models/model.dart';

class Totalbarcart extends BaseBarChart {
  final Color positiveBarColor = const Color(0xff00BCD4);
  final Color negativeBarColor = const Color(0xffb73a85);
  final List<CustomerWithTotal> sales;

  const Totalbarcart({super.key, required this.sales});

  @override
  BaseChartBoundary calculateBoundary() {
    var boundary = BarChartBoundary<CustomerWithTotal>(
      sales,
      (element) => element.totalSales.toDouble(),
    );
    boundary.init();
    return boundary;
  }

  @override
  AxisTitles createLeftAxisTitle() {
    var c = calculateBoundary();
    var yAxisRenderer = YAxisNumberTitleRenderer();

    return ChartUtils.createAxisTitle(45, c.maxY / 4, yAxisRenderer.render);
  }

  @override
  AxisTitles createBottomAxisTitle() {
    var xAxisRenderer = XAxisStringRenderer(sales);

    return ChartUtils.createAxisTitle(45, 1, xAxisRenderer.render);
  }

  @override
  List<BarChartGroupData> createChartGroupData() {
    List<BarChartGroupData> data = [];

   sales.sort((a, b) => b.totalSales.compareTo(a.totalSales),);

    for (var i = 0; i < sales.length; i++) {
      data.add(
          _createBarChartGroupData(sales[i].customerId, sales[i].totalSales));
    }

    // for (var asset in sales) {
    //   data.add(_createBarChartGroupData(asset.customerId, asset.totalSales));
    // }

    return data;
  }

  BarChartGroupData _createBarChartGroupData(int x, double y) {
    return BarChartGroupData(
      barsSpace: 2,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: y <= 0 ? negativeBarColor : positiveBarColor,
          width: 8,
        ),
      ],
    );
  }
}
