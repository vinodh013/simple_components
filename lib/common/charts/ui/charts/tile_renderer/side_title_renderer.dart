import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// title renderer abstraction which compatible with fl charts
abstract class SideTitleRenderer {
  SideTitleWidget render(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color.fromARGB(179, 104, 115, 125),
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
    Widget text = Text(convert(value), style: style);
    
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  // converts value to title
  String convert(double value);
}
