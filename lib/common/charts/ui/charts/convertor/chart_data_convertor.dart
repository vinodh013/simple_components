import 'package:fl_chart/fl_chart.dart';
import 'package:simple_components/models/model.dart';

class ChartDataConverter {
  static List<FlSpot> convert<T>(
      List<T> elements,
      double Function(T) propertyFinder,
      final int interval,
      DateTime initital,
      DateTime finaldate) {
    bool sameday = initital.day == finaldate.day &&
        initital.month == finaldate.month &&
        initital.year == finaldate.year;

    List<FlSpot> data = [];

    List<DateTime> dates = [];

     

    int numberOfDays = sameday
        ? finaldate.difference(initital).inHours + 1
        : finaldate.difference(initital).inDays + 1;

    // Generate the list of dates
    for (int i = 0; i < numberOfDays; i++) {
      DateTime date = sameday
          ? initital.add(Duration(hours: i))
          : initital.add(Duration(days: i));
      dates.add(date);
    }

    for (var date in dates) {
      bool hasMatch = false;

      List<double> values = [];

      for (CustomerWithTotal element in elements as List<CustomerWithTotal>) {
        if (sameday) {
          if (element.date!.hour == date.hour) {
            double value = element.totalSales;
            values.add(value);
            hasMatch = true;
          }
        } else {
          if (element.date!.month == date.month &&
              element.date!.day == date.day) {
            double value = element.totalSales;
            values.add(value);
            hasMatch = true;
          }
        }
      }

      if (hasMatch) {
        double sum = values.reduce((a, b) => a + b);
        data.add(FlSpot(data.length.toDouble(), sum));
      } else {
        data.add(FlSpot(data.length.toDouble(), 0));
      }
    }

    // for (var date in dates) {
    //   bool hasMatch = false;

    //   for (Sale element in elements as List<Sale>) {
    //     if (element.date!.month == date.month &&
    //         element.date!.day == date.day) {
    //       double value = element.total!;
    //       print(value);
    //       data.add(FlSpot(data.length.toDouble() + 1, value));
    //       hasMatch = true;
    //       break;
    //     }
    //   }

    //   if (!hasMatch) {
    //     data.add(FlSpot(data.length.toDouble() + 1, 0));
    //   }
    // }

    // print(data);

    return data;

    // dates.forEach((element) {

    // });

    // for (int i = 0; i < elements.length; i += interval) {
    //   data.add(FlSpot(i.toDouble() + 1,
    //       double.parse(propertyFinder(elements[i]).toStringAsFixed(2))));
    // }
    // return data;
  }

  ChartDataConverter._();
}
