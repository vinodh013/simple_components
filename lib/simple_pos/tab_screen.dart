import 'package:flutter/material.dart';
import 'package:simple_components/simple_components.dart';

class TabResponsiveScreen extends StatelessWidget {
  const TabResponsiveScreen({
    Key? key,
    required this.tabs,
    required this.tabview,
    required this.length,
    required this.intitalIndex,
  }) : super(key: key);

  final List<Widget> tabs;
  final List<Widget> tabview;
  final int length;
  final int intitalIndex;

  @override
  Widget build(BuildContext context) {
    return MainResponsiveScreen(
        standardScreen: DefaultTabController(
          length: length,
          initialIndex: intitalIndex,
          child: Scaffold(
              appBar: TabBar(tabs: tabs), body: TabBarView(children: tabview)),
        ),
        smallScreen: const Scaffold());
  }
}
