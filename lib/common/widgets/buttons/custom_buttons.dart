import 'package:flutter/material.dart';

Widget savebutton(
    {required bool issmall,
    required bool showfirstchild,
    String? title,
    void Function()? save,
    void Function()? cancel}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: showfirstchild
        ? [
            Text(title ?? ''),
            issmall
                ? TextButton(onPressed: save, child: const Text("Save"))
                : IconButton(onPressed: cancel, icon: const Icon(Icons.cancel))
          ]
        : [
            const SizedBox(
              width: 10,
            ),
            FilledButton(onPressed: save, child: const Text('Save'))
          ],
  );
}

Widget posCustombutton(
    {required bool istonal,
    required String name,
    required VoidCallback onpress,
    double? height,
    MaterialStateProperty<Color?>? backgroundColor}) {
  var style = ButtonStyle(
      backgroundColor: backgroundColor,
      shape: MaterialStatePropertyAll(
          ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10))));

  return Expanded(
    child: Container(
      margin: const EdgeInsets.all(10),
      height: height,
      child: istonal
          ? FilledButton.tonal(
              onPressed: onpress, style: style, child: Text(name))
          : FilledButton(onPressed: onpress, style: style, child: Text(name)),
    ),
  );
}