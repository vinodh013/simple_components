import 'package:intl/intl.dart';
import 'package:simple_components/common/charts/ui/charts/tile_renderer/side_title_renderer.dart';

// // title renderer for the short form of month names
// class XAxisMonthTitleRenderer extends SideTitleRenderer {
//   final DateTime initialDate;

//   XAxisMonthTitleRenderer(this.initialDate,  );

//   @override
//   String convert(double value) {

//     var current = initialDate.add(Duration(days: value.round()));
//     var month = current.month;

//     return DateFormat('MMM').format(DateTime(0, month));
//   }
// }

class XAxisMonthTitleRenderer extends SideTitleRenderer {
  final DateTime initialDate;
  final DateTime finalDate;

  XAxisMonthTitleRenderer({required this.initialDate, required this.finalDate});

  @override
  String convert(double value) {
    bool sameday = initialDate.day == finalDate.day &&
        finalDate.month == initialDate.month &&
        finalDate.year == initialDate.year;
    var current = sameday
        ? initialDate.add(Duration(hours: value.round()))
        : initialDate.add(Duration(days: value.round()));

    if (sameday) {
      var formatter = DateFormat('HH:mm');
      return formatter.format(current);
    } else if (current.month == initialDate.month &&
        current.year == initialDate.year) {
      var formatter = DateFormat('dd MMM');
      return formatter.format(current);
    } else if (current.year == initialDate.year) {
      var formatter = DateFormat('dd MMM');

      return formatter.format(current);
    } else {
      var formatter = DateFormat('MMM yyyy');
      return formatter.format(current);
    }
  }
}
