
import 'package:simple_components/models/model.dart';

import 'base_chart_boundry.dart';

// convenience class to calculate boundary for line charts
class LineChartBoundary<T> extends BaseChartBoundary<T> {
  final List<T> sales;
  final DateTime initialDate;
  final DateTime finalDate;

  LineChartBoundary(this.sales, double Function(T) propertyFinder,
      {required this.initialDate, required this.finalDate})
      : super(sales, propertyFinder);

  double maxYCalculate() {
    if (sales.isEmpty) {
      return 1000;
    } else {
      List<CustomerWithTotal> convertedSales =
          sales.map((item) => item as CustomerWithTotal).toList();
      // Find the maximum sales total for the matching dates within the range

      Map<DateTime, double> salesByDate = {};

      for (var sale in convertedSales) {
        var dateWithoutTime =
            DateTime(sale.date!.year, sale.date!.month, sale.date!.day);
        if (salesByDate.containsKey(dateWithoutTime)) {
          salesByDate[dateWithoutTime] =
              salesByDate[dateWithoutTime]! + sale.totalSales;
        } else {
          salesByDate[dateWithoutTime] = sale.totalSales;
        }
      }

      //  DateTime? maxDate;
      double maxTotal = 0;

      for (var entry in salesByDate.entries) {
        if (entry.value > maxTotal) {
          maxTotal = entry.value;
          //maxDate = entry.key;
        }
      }

      maxTotal = (maxTotal / 100).ceil() * 100;

      // print("Date: $maxDate, Total Sales: $maxTotal");

      return maxTotal;
    }

//
  }

  void init() {
    minX = 0;

    if (finalDate.day == initialDate.day &&
        finalDate.month == initialDate.month &&
        finalDate.year == initialDate.year) {
      maxX = finalDate.difference(initialDate).inHours.toDouble();
    } else {
      maxX = finalDate.difference(initialDate).inDays.toDouble();
    }

    minY = minY;
    maxY = maxYCalculate();
  }

  // void init() {

  //   minX = 0;
  //   maxX =
  //       finalDate.day == initialDate.day && finalDate.year == initialDate.year
  //           ? finalDate.difference(initialDate).inHours.toDouble()
  //           : finalDate.difference(initialDate).inDays.toDouble();
  //   // minY = calculateMinY();
  //   minY = 0;
  //   // maxY = calculateMaxY();
  //   maxY = maxYCalculate();
  // }
}
