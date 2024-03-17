import 'package:flutter/material.dart';

class CustomBadge {
  static defualBadge(String text) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Text(text));
  }

  static infoBadge(String text) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue[100],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Text(text));
  }

    static successBadge(String text, BuildContext context) {
    return Container(
         
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.greenAccent
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Text(text, style: Theme.of(context).textTheme.labelLarge,));
  }

    static incompleteBadge(String text) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue[200],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Text(text));
  }

    static partialBadge(String text, BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.orange[100],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Text(text, style: Theme.of(context).textTheme.labelLarge,));
  }

  
    static criticalBadge(String text, BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red[200],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Text(text, style: Theme.of(context).textTheme.labelLarge,));
  }
}
