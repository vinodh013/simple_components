import 'package:flutter/material.dart';

// convenience widget for holding the charts
class CardWithTitle extends StatelessWidget {
  final String title;
  final Widget content;
  final Widget? child;

  const CardWithTitle(this.title, this.content, {super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
    elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        // color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: content,
              )
            ],
          ),
        ));
  }
}
