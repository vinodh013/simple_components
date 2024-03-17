import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class CustomPagination extends ConsumerStatefulWidget {
  const CustomPagination({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomPaginationState();
}

class _CustomPaginationState extends ConsumerState<CustomPagination> {
  @override
  Widget build(BuildContext context) {
    List v = ["50", "100", "150", "200"];

    // getposition(int limit, int currentPage) {
    //   var c = currentPage * limit;
      
      
    // }

    return SlotLayout(config: {
      Breakpoints.standard: SlotLayout.from(
        key: const Key('small filter'),
        builder: (context) {
          return Card(
            margin: const EdgeInsets.only(bottom: 6, left: 8, right: 8),
            child: SizedBox(
              height: 50,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 190,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 60,
                            child: Row(
                              children: [
                                DropdownButton<String>(
                                  value: "100",
                                  iconSize: 15,
                                  items: [
                                    ...v.map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ))
                                  ],
                                  onChanged: (value) {},
                                  onTap: () {},
                                )
                              ],
                            ),
                          ),
                          const Text('per page. '),
                          const Text('Total: 500'),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back_ios_outlined,
                              size: 15,
                            )),
                        const Text('10'),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios_rounded,
                                size: 15)),
                        const Text("Pages: 100")
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )
    });
  }
}
