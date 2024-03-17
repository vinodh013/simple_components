import 'dart:math';

import 'package:flutter/material.dart';

class CustomBanner {
  static defaultBanner(BuildContext context, String heading, String body) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 0.5),
          color: const Color.fromARGB(209, 245, 245, 245),
        ),
        padding:
            const EdgeInsets.only(top: 15, bottom: 25, left: 15, right: 10),
        width: 600,
        // height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                // margin: EdgeInsets.only(top: 3),
                width: 21,
                height: 21,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black54),
                padding: const EdgeInsets.only(top: 3, bottom: 3),
                child: Center(
                  child: Transform.rotate(
                    angle: pi,
                    child: const Icon(
                      Icons.priority_high_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                )),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black87,
                      ),
                ),
                const SizedBox(height: 6),
                Text(body,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black87)),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.close_rounded,
              ),
              padding: const EdgeInsets.all(0),
              iconSize: 20,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
            )
          ],
        ));
  }

  static informationalBanner({
    required BuildContext context,
    required String heading,
    required String body,
    required String elevatedButtonText,
    required String textButtontext,
  }) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue, width: 0.2),
          color: Colors.blue[100]!.withOpacity(0.5),
        ),
        padding:
            const EdgeInsets.only(top: 15, bottom: 25, left: 15, right: 10),
        width: 600,
        // height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                // margin: EdgeInsets.only(top: 3),
                width: 21,
                height: 21,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blue[300]),
                padding: const EdgeInsets.only(top: 3, bottom: 3),
                child: Center(
                  child: Transform.rotate(
                    angle: pi,
                    child: const Icon(
                      Icons.priority_high_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black87,
                      ),
                ),
                const SizedBox(height: 6),
                Text(body,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black87)),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.blue)),
                      child: FilledButton.tonal(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                            elevation: const MaterialStatePropertyAll(0),
                            overlayColor: MaterialStatePropertyAll(
                                Colors.blue[100]!.withOpacity(0.2)),
                            surfaceTintColor:
                                MaterialStatePropertyAll(Colors.blue[100]),
                            shape: MaterialStatePropertyAll(
                                ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)))),
                        child: Text(elevatedButtonText),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        overlayColor: MaterialStatePropertyAll(
                            Colors.blue[100]!.withOpacity(0.2)),
                      ),
                      child: Text(
                        textButtontext,
                        style: const TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.close_rounded,
              ),
              padding: const EdgeInsets.all(0),
              iconSize: 20,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
            )
          ],
        ));
  }

  static successBanner({
    required BuildContext context,
    required String heading,
    required String elevatedButtonText,
    required String textButtontext,
  }) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.greenAccent, width: 0.2),
          color: Colors.greenAccent[100]!.withOpacity(0.5),
        ),
        padding:
            const EdgeInsets.only(top: 15, bottom: 25, left: 15, right: 10),
        width: 600,
        // height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                // margin: EdgeInsets.only(top: 3),
                width: 21,
                height: 21,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.green),
                padding: const EdgeInsets.only(top: 3, bottom: 3),
                child: Center(
                  child: Transform.rotate(
                    angle: pi,
                    child: const Icon(
                      Icons.priority_high_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black87,
                      ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.greenAccent)),
                      child: FilledButton.tonal(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                            elevation: const MaterialStatePropertyAll(0),
                            overlayColor: MaterialStatePropertyAll(
                                Colors.greenAccent[100]!.withOpacity(0.2)),
                            surfaceTintColor: MaterialStatePropertyAll(
                                Colors.greenAccent[100]),
                            shape: MaterialStatePropertyAll(
                                ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)))),
                        child: Text(elevatedButtonText),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        overlayColor: MaterialStatePropertyAll(
                            Colors.greenAccent[200]!.withOpacity(0.2)),
                      ),
                      child: Text(
                        textButtontext,
                        style: const TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.close_rounded,
              ),
              padding: const EdgeInsets.all(0),
              iconSize: 20,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
            )
          ],
        ));
  }

   static warningBanner({
    required BuildContext context,
    required String heading,
    required String body,
    required String elevatedButtonText,
    required String textButtontext,
  }) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.orange, width: 0.2),
          color: Colors.orange[100]!.withOpacity(0.5),
        ),
        padding:
            const EdgeInsets.only(top: 15, bottom: 25, left: 15, right: 10),
        width: 600,
        // height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                // margin: EdgeInsets.only(top: 3),
                width: 21,
                height: 21,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.orange[300]),
                padding: const EdgeInsets.only(top: 3, bottom: 3),
                child: Center(
                  child: Transform.rotate(
                    angle: pi,
                    child: const Icon(
                      Icons.priority_high_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black87,
                      ),
                ),
                const SizedBox(height: 6),
                Text(body,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black87)),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.orange)),
                      child: FilledButton.tonal(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                            elevation: const MaterialStatePropertyAll(0),
                            overlayColor: MaterialStatePropertyAll(
                                Colors.orange[100]!.withOpacity(0.2)),
                            surfaceTintColor:
                                MaterialStatePropertyAll(Colors.orange[100]),
                            shape: MaterialStatePropertyAll(
                                ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)))),
                        child: Text(elevatedButtonText),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        overlayColor: MaterialStatePropertyAll(
                            Colors.orange[200]!.withOpacity(0.2)),
                      ),
                      child: Text(
                        textButtontext,
                        style: const TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.close_rounded,
              ),
              padding: const EdgeInsets.all(0),
              iconSize: 20,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
            )
          ],
        ));
  }

     static criticalBanner({
    required BuildContext context,
    required String heading,
    required String body,
    required String elevatedButtonText,
    required String textButtontext,
  }) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.red, width: 0.2),
          color: Colors.red[100]!.withOpacity(0.5),
        ),
        padding:
            const EdgeInsets.only(top: 15, bottom: 25, left: 15, right: 10),
        width: 600,
        // height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                // margin: EdgeInsets.only(top: 3),
                width: 21,
                height: 21,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red[300]),
                padding: const EdgeInsets.only(top: 3, bottom: 3),
                child: Center(
                  child: Transform.rotate(
                    angle: pi,
                    child: const Icon(
                      Icons.priority_high_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black87,
                      ),
                ),
                const SizedBox(height: 6),
                Text(body,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black87)),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.red)),
                      child: FilledButton.tonal(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                            elevation: const MaterialStatePropertyAll(0),
                            overlayColor: MaterialStatePropertyAll(
                                Colors.red[100]!.withOpacity(0.2)),
                            surfaceTintColor:
                                MaterialStatePropertyAll(Colors.red[100]),
                            shape: MaterialStatePropertyAll(
                                ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)))),
                        child: Text(elevatedButtonText),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        overlayColor: MaterialStatePropertyAll(
                            Colors.red[200]!.withOpacity(0.2)),
                      ),
                      child: Text(
                        textButtontext,
                        style: const TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.close_rounded,
              ),
              padding: const EdgeInsets.all(0),
              iconSize: 20,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
            )
          ],
        ));
  }
}
