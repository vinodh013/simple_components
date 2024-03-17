import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:intl/intl.dart';

class CustomDateFormat {
  static String yearmonthday(DateTime date) {
    var d = DateFormat.yMd().format(DateTime.parse(date.toString()));
    return d;
  }

  static String dateMonthtime(DateTime date) {
    var d = DateFormat('dd-MMM/yyyy').format(DateTime.parse(date.toString()));
    return d;
  }

  static DateRange gettoday(DateTime today) {
    return DateRange(DateTime(today.year, today.month, today.day),
        DateTime(today.year, today.month, today.day, 23, 59, 59));
  }
}
