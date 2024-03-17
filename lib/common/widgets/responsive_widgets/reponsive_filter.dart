import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_components/common/overlays/overlay.dart';
import 'package:simple_components/common/widgets/widgets.dart';

class ResponsiveFilter extends ConsumerStatefulWidget {
  const ResponsiveFilter({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResponsiveFilterState();
}

class _ResponsiveFilterState extends ConsumerState<ResponsiveFilter> {
  @override
  Widget build(BuildContext context) {
    buildfilterwidget(bool isSmall) {
      return isSmall == true
          ? [
              IconButton.filledTonal(
                  onPressed: widget.onPressed,
                  // () {
                  //   showdialogOrmodelbottomsheet(
                  //       context: context,
                  //       newwidget: buildfilterdialog(context));
                  // },
                  icon: const Icon(Icons.filter_alt_outlined),
                  tooltip: 'filter'),
            ]
          : [
              // FilledButton.tonalIcon(
              //     onPressed: () {},
              //     icon: const Icon(Icons.sort),
              //     label: const Text('sort')),
              FilledButton.tonalIcon(
                  onPressed: widget.onPressed,
                  // () {
                  //   showdialogOrmodelbottomsheet(
                  //       context: context,
                  //       newwidget: buildfilterdialog(context));
                  // },
                  icon: const Icon(Icons.filter_alt_outlined),
                  label: const Text('filter'))
            ];
    }

    return SlotLayout(
      config: {
        Breakpoints.large: SlotLayout.from(
          key: const Key('value'),
          builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: buildfilterwidget(false),
            );
          },
        ),
        Breakpoints.medium: SlotLayout.from(
          key: const Key('medium filter'),
          builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: buildfilterwidget(true),
            );
          },
        ),
        Breakpoints.small: SlotLayout.from(
          key: const Key('small filter'),
          builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: buildfilterwidget(true),
            );
          },
        )
      },
    );
  }
}

// var s = Sale().toJson().keys.toList();

List v = ["50", "100", "150", "200"];

//** Types of filters */

//**Dates :  Between : is grater than  : => && is less than  : <=   */

//**Product : Contains : []*/

//**total : is grater than  : => && is less than  : <= */

//**customerid : =  */

//**serialNo  : is :  = */

// List<String> filters = ["Dates", "serielno", "products", "customer", "total"];

Widget datefilter({required bool isgretearfilter, required bool isdatefilter}) {
  return Container(
    padding: const EdgeInsets.all(8),
    height: 130,
    width: 400,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Date between"),
            TextButton(onPressed: () {}, child: const Text('Save'))
          ],
        ),
        Row(
          children: isdatefilter
              ? [
                  SettingsTextField(
                      controller: TextEditingController(),
                      fieldname: "date From"),
                  SettingsTextField(
                      controller: TextEditingController(),
                      fieldname: "date To"),
                ]
              : isgretearfilter
                  ? [
                      SettingsTextField(
                          controller: TextEditingController(),
                          fieldname: "greater than"),
                      SettingsTextField(
                          controller: TextEditingController(),
                          fieldname: "less than"),
                    ]
                  : [],
        ),
      ],
    ),
  );
}

// Widget filtersearch(
//   WidgetRef ref,
// ) {
//   return Container(
//     padding: const EdgeInsets.all(8),
//     height: 125,
//     width: 300,
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [TextButton(onPressed: () {}, child: const Text('Add'))],
//         ),
//         CustomSegmentedTextField<Customer>(
//             showSearch: true,
//             showSegButtons: false,
//             showtoptext: true,
//             suggestionsCallback: (p0) {
//               return ref
//                   .read(customerListControllerProvider.notifier)
//                   .searchCustomer(p0);
//             },
//             itemBuilder: (p0, p1) {
//               return ListTile(
//                 title: Text(p1.firstname ?? p1.businessName ?? ""),
//               );
//             },
//             typeName: "Customer",
//             controller: TextEditingController()),
//       ],
//     ),
//   );
// }

class FilterlistWidget extends ConsumerStatefulWidget {
  const FilterlistWidget({super.key, required this.filtersearch});

  final Widget filtersearch;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FilterlistWidgetState();
}

class _FilterlistWidgetState extends ConsumerState<FilterlistWidget> {
  var showlist = true;
  var showfilterOverlay = false;
  Map<String, bool> showlistfilter = {};
  List<String> filter = ['Dates', "customer", "total"];

  String? currentString;

  void updateFilter(Map<String, bool> filters, String selectedFilter) {
    // Set all filters to false

    filters.forEach((key, value) {
      filters[key] = false;
    });

    if (filters.containsKey(selectedFilter)) {
      filters[selectedFilter] = filters[selectedFilter] == true ? false : true;
    } else {
      filters[selectedFilter] = true;
    }
    // print(filters);
    showlistfilter = filters;
  }

  Widget filterDropDown(BuildContext context, List<String> filter) {
    return SizedBox(
      height: 250,
      width: 200,
      child: Column(
        children: [
          ListView.builder(
            itemCount: filter.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                titleTextStyle: Theme.of(context).textTheme.labelMedium,
                contentPadding: const EdgeInsets.only(
                    left: 8, right: 0.0, top: 0, bottom: 0),
                minVerticalPadding: 4,
                title: Text(filter[index]),
                onTap: () {
                  updateFilter(showlistfilter, filter[index]);

                  setState(() {});
                },
              );
            },
          )
        ],
      ),
    );
  }

  Widget filtersList({
    required List<String> values,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 15),
      height: 30,
      child: Row(
        children: [
          Flexible(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: values.length,
              itemBuilder: (context, index) {
                return filterchips(
                  overlayChild: widgetfilters(),
                  label: Text(values[index]),
                  onDeleted: () {
                    //             setState(() {
                    //   showlistfilter.forEach((key, value) {
                    //     showlistfilter[key] = false;
                    //   });
                    // });
                  },
                  show: showfilterOverlay == false
                      ? showlistfilter[values[index]] ?? false
                      : false,
                  onPressed: () {
                    setState(() {
                      updateFilter(showlistfilter, values[index]);
                    });
                  },
                );
              },
            ),
          ),
          const SizedBox(width: 15),
          OverlayButtonBuilder(
            overlay:  Card(
              child: BodyWidget(filters: const {}, filterSeach: widget.filtersearch,),

              // showlistfilter.values.contains(true)
              //     ? widgetfilters()
              //     : filterDropDown(context, filter)
            ),
            showOverlay: showfilterOverlay,
            child: IconButton.filledTonal(
              iconSize: 17,
              onPressed: () {
                showfilterOverlay = !showfilterOverlay;
                if (showfilterOverlay == false) {
                  showlistfilter.forEach((key, value) {
                    showlistfilter[key] = false;
                  });
                }
                setState(() {});
              },
              icon: const Icon(Icons.add),
              alignment: Alignment.topCenter,
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
            ),
          )
        ],
      ),
    );
  }

  Widget widgetfilters() {
    var g = showlistfilter.entries
        .where((element) => element.value == true)
        .toList();

    var c = g.isEmpty
        ? filterDropDown(context, filter)
        : g[0].key == "Dates"
            ? datefilter(isdatefilter: true, isgretearfilter: false)
            : g[0].key == "customer"
                ? widget.filtersearch
                : filterDropDown(context, filter);

    return c;
  }

  Widget filterchips(
      {required bool show,
      required Widget overlayChild,
      required void Function() onDeleted,
      required Widget label,
      void Function()? onPressed}) {
    return OverlayButtonBuilder(
      showOverlay: show,
      overlay: Card(
        child: overlayChild,
      ),
      child: InputChip(
          deleteIcon: const Icon(
            Icons.cancel,
            size: 14,
          ),
          onDeleted: onDeleted,
          showCheckmark: false,
          selected: true,
          label: label,
          onPressed: onPressed),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlotLayout(config: {
      Breakpoints.standard: SlotLayout.from(
        key: const Key("value"),
        builder: (context) {
          return filtersList(
            values: filter,
          );
        },
      )
    });
  }
}

class BodyWidget extends ConsumerStatefulWidget {
  const BodyWidget({super.key, required this.filters, required this.filterSeach});

  final Map<String, bool> filters;
  final Widget filterSeach;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends ConsumerState<BodyWidget> {
  bool show = true;
  List<String> filter = ['Dates', "customer", "total"];

  String text = '1';
  Widget getWIdget(bool get) {
    return text == '1'
        ? SizedBox(
            height: 250,
            width: 200,
            child: Column(
              children: [
                ListView.builder(
                  itemCount: filter.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      titleTextStyle: Theme.of(context).textTheme.labelMedium,
                      contentPadding: const EdgeInsets.only(
                          left: 8, right: 0.0, top: 0, bottom: 0),
                      minVerticalPadding: 4,
                      title: Text(filter[index]),
                      onTap: () {
                        text = filter[index];
                        setState(() {});
                      },
                    );
                  },
                )
              ],
            ),
          )
        : text == "Dates"
            ? datefilter(isgretearfilter: false, isdatefilter: true)
            : text == "customer"
                ? widget.filterSeach
                : text == "total"
                    ? datefilter(isgretearfilter: true, isdatefilter: false)
                    : const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getWIdget(show),
    );
  }
}
