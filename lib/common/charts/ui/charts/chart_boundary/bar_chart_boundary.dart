import 'base_chart_boundry.dart';

// convenience class to calculate boundary for bar charts
class BarChartBoundary<T> extends BaseChartBoundary<T> {
  BarChartBoundary(super.elements, double Function(T) super.propertyFinder);

  void init() {
    minY = calculateMinY();
    maxY = calculateMaxY();
  }
}
