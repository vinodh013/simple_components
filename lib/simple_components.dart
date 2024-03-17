library simple_components;

export "package:simple_components/simple_pos/tab_screen.dart";
export "package:simple_components/components/Text/custom_text.dart";

import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class MainResponsiveScreen extends StatelessWidget {
  const MainResponsiveScreen(
      {super.key, required this.standardScreen, required this.smallScreen});

  final Widget standardScreen;
  final Widget smallScreen;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      body: SlotLayout(config: {
        Breakpoints.standard: SlotLayout.from(
          key: const Key('value'),
          builder: (context) {
            return standardScreen;
          },
        ),
        Breakpoints.small: SlotLayout.from(
          key: const Key('value'),
          builder: (context) {
            return smallScreen;
          },
        )
      }),
    );
  }
}
