import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:simple_components/common/charts/ui/widgets/base/pie_chart_data_entry.dart';

import 'indicator.dart';

// base class for any pie chart implementation
class BasePieChart extends StatefulWidget {
  final List<PieChartDataEntry> data;
  final double limit;
  final double centerSpaceRadius;

  const BasePieChart(this.data,
      {super.key, required this.limit, required this.centerSpaceRadius});

  @override
  State<StatefulWidget> createState() => BasePieChartState();
}

class BasePieChartState extends State<BasePieChart> {
  int touchedIndex = -1;
  Map<int, PieChartDataEntry> entries = {};

  @override
  void initState() {
    //entries = widget.data.asMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 1,
            child: AspectRatio(aspectRatio: 2, child: PieChart(mainData()))),
        Expanded(
            flex: 2, child: SingleChildScrollView(child: createIndicators())),
      ],
    );
  }

  PieChartData mainData() {
    entries = widget.data.asMap();

    return PieChartData(
      pieTouchData: PieTouchData(
        touchCallback: (FlTouchEvent event, pieTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                pieTouchResponse == null ||
                pieTouchResponse.touchedSection == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
          });
        },
      ),
      borderData: FlBorderData(
        show: false,
      ),
      sectionsSpace: 0,
      centerSpaceRadius: widget.centerSpaceRadius,
      sections: showingSections(),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(entries.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 18.0 : 13.0;
      final radius = isTouched ? 50.0 : 40.0;

      var entry = entries[i];
      return PieChartSectionData(
        color: entry!.color,
        value: entry.value,
        title: entry.value >= widget.limit ? entry.title : "",
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
          color: const Color(0xffffffff),
        ),
      );
    });
  }

  Widget createIndicators() {
    var indicators = <Widget>[];
    for (var data in widget.data) {
      indicators.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Indicator(
            color: data.color,
            text: data.name,
            isSquare: false,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: indicators),
    );
  }
}
