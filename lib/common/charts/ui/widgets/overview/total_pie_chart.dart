import 'package:flutter/material.dart';
import 'package:simple_components/common/charts/ui/charts/convertor/asset_to_pie_chart_converter.dart';
import 'package:simple_components/common/charts/ui/widgets/base/base_pie_chart.dart';

class TotalPieChart extends StatefulWidget {
  const TotalPieChart({super.key});

  @override
  State<TotalPieChart> createState() => _TotalPieChartState();
}

class _TotalPieChartState extends State<TotalPieChart> {
  @override
  Widget build(BuildContext context) {
    var a = AssetToPieChartDataConverter(
      [],
      (p0) => p0.totalSales,
    );
    var b = a.convert();
    return BasePieChart(
      b,
      centerSpaceRadius: 10,
      limit: 5.0,
    );
  }
}
