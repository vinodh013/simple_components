import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CustomCalender extends ConsumerStatefulWidget {
  const CustomCalender({
    this.branchId,
    required this.onDateRangeChanged,
    required this.daterange,
    super.key,
  });

  final String? branchId;
  final void Function(DateRange?) onDateRangeChanged;
  final DateRange daterange;
  // final DateRange daterange;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends ConsumerState<CustomCalender> {
  @override
  Widget build(BuildContext context) {
    // var daterange = ref.watch(calenderProvider);

    return SizedBox(
      width: 200,
      child: DateRangeField(
        selectedDateRange: widget.daterange,
        decoration: const InputDecoration(border: OutlineInputBorder()),
        pickerBuilder: (BuildContext context,
            dynamic Function(DateRange?) onDateRangeChanged) {
          return DateRangePickerWidget(
            maximumDateRangeLength: 365,
            initialDateRange: widget.daterange,
            initialDisplayedDate: DateTime.now(),
            theme: CalendarTheme(
                quickDateRangeTextStyle: kTheme.quickDateRangeTextStyle,
                selectedColor: Theme.of(context).colorScheme.primary,
                inRangeColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.2),
                inRangeTextStyle:
                    TextStyle(color: Theme.of(context).colorScheme.primary),
                selectedTextStyle: kTheme.selectedTextStyle,
                todayTextStyle: kTheme.todayTextStyle,
                defaultTextStyle: kTheme.defaultTextStyle,
                disabledTextStyle: Theme.of(context).textTheme.labelLarge!,
                radius: kTheme.radius,
                tileSize: kTheme.tileSize),
            height: 340,
            quickDateRanges: [
              QuickDateRange(
                  dateRange: DateRange(DateTime.now(), DateTime.now()),
                  label: 'Today'),
              QuickDateRange(
                  dateRange: DateRange(
                      DateTime.now().subtract(const Duration(days: 6)),
                      DateTime.now()),
                  label: 'Last 7 days'),
              QuickDateRange(
                  dateRange: DateRange(
                      DateTime.now().subtract(const Duration(days: 30)),
                      DateTime.now()),
                  label: 'Last 30 days'),
              QuickDateRange(
                  dateRange: DateRange(
                      DateTime.now().subtract(const Duration(days: 90)),
                      DateTime.now()),
                  label: 'Last 90 days'),
              QuickDateRange(
                  dateRange: DateRange(
                      DateTime.now().subtract(const Duration(days: 180)),
                      DateTime.now()),
                  label: 'Last 6 months')
            ],
            onDateRangeChanged: widget.onDateRangeChanged
            
            
            //  (value) {
            //   if (value != null) {
            //     if (value.start.day == value.end.day &&
            //         value.start.month == value.end.month) {
            //       ref.read(calenderProvider.notifier).setDateRange(
            //           DateRange(
            //             DTU.startOfDay(value.start),
            //             DateTime.parse(DateFormat('yyyy-MM-dd HH:mm:ss').format(
            //                 DateTime(value.start.year, value.start.month,
            //                     value.start.day, 23, 59))),
            //           ),
            //           widget.branchId);
            //     } else {
            //       ref
            //           .read(calenderProvider.notifier)
            //           .setDateRange(value, widget.branchId);
            //     }
            //   }
            // },
          );
        },
      ),
    );
  }
}
