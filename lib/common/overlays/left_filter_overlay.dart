import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

class LeftFilterOverlay extends StatefulWidget {
  const LeftFilterOverlay(
      {Key? key,
      required this.widthOfFirstMenu,
      required this.widthOfSecondMenu,
      required this.offset,
      required this.heightOfSecondMenu,
      required this.heightOfFistMenuChild,
      required this.filterFirstMenuNames})
      : super(key: key);

  final double heightOfFistMenuChild;
  final double widthOfFirstMenu;
  final double widthOfSecondMenu;
  final double heightOfSecondMenu;
  final Offset offset;
  final List<String> filterFirstMenuNames;
  

  @override
  State<LeftFilterOverlay> createState() => _LeftFilterOverlayState();
}

class _LeftFilterOverlayState extends State<LeftFilterOverlay> {
  bool showMenu = false;
  bool deepMenu = false;
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return ModalEntry(
      deepMenu: deepMenu,
      visible: showMenu,
      onClose: () => setState(() => showMenu = false),
      childAnchor: Alignment.topRight,
      menuAnchor: Alignment.topLeft,
      menu: Menu(
        deepMenu: deepMenu,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              deepMenu
                  ? MouseRegion(
                      onExit: (event) {
                        final dx = event.position.dx;
                        final dy = event.position.dy;
                        final widgetX = widget.offset.dx;
                        final widgetY = widget.offset.dy;
                        final thresholdX = widgetX -
                            widget.widthOfFirstMenu -
                            widget.widthOfSecondMenu;
                        final thresholdYMax =
                            widgetY + widget.heightOfFistMenuChild * 4 + 42;
                        final thresholdYMin = widgetY + 60;

                        if (dx > widgetX - widget.widthOfFirstMenu) {
                          setState(() {
                            //showMenu = true;
                            // deepMenu = false;
                          });
                        } else if (dx > thresholdX) {
                          setState(() {
                            showMenu = false;
                            deepMenu = false;
                          });
                        }

                        dy < thresholdYMin || dy > thresholdYMax
                            ? setState(
                                () {
                                  showMenu = false;
                                  deepMenu = false;
                                },
                              )
                            : null;
                      },
                      child: Card(
                        elevation: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:
                                selectedindex == 0 ? Colors.green : Colors.red,
                          ),
                          height: widget.heightOfSecondMenu,
                          width: widget.widthOfSecondMenu,
                        ),
                      ),
                    )
                  : const SizedBox(),
              MouseRegion(
                onExit: (event) {
                  var dy = event.position.dy;
                  if (event.position.dx > widget.offset.dx) {
                    setState(() {
                      deepMenu = false;
                      showMenu = false;
                    });
                  } else {
                    setState(() {
                      deepMenu = true;
                    });
                  }

                  dy < widget.offset.dy ||
                          dy >
                              widget.offset.dy +
                                  widget.heightOfFistMenuChild * 4 +
                                  50
                      ? setState(
                          () {
                            showMenu = false;
                            deepMenu = false;
                          },
                        )
                      : null;
                },
                child: SizedBox(
                  height: widget.heightOfFistMenuChild * 4 + 8,
                  width: widget.widthOfFirstMenu,
                  child: Card(
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    elevation: 5,
                    child: Column(
                      children: [
                        Flexible(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.filterFirstMenuNames.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                onHover: (value) {
                                  if (value) {
                                    setState(() {
                                      selectedindex = index;
                                      deepMenu = true;
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12))),
                                  padding: const EdgeInsets.all(10),
                                  width: widget.widthOfFirstMenu,
                                  height: widget.heightOfFistMenuChild,
                                  child: Row(
                                    children: [
                                      Transform.scale(
                                        scale: 0.75,
                                        child: Checkbox(
                                          shape: ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          value: false,
                                          onChanged: (value) {
                                              
                                          },
                                        ),
                                      ),
                                      Text(widget.filterFirstMenuNames[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge)
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      child: MouseRegion(
          onExit: (event) {
            if (event.position.dx < widget.offset.dx ||
                event.position.dx > widget.offset.dx + 100) {
              setState(() {
                showMenu = false;
                deepMenu = false;
              });
            }

            if (event.position.dy < widget.offset.dy) {
              setState(() {
                showMenu = false;
                deepMenu = false;
              });
            }
          },
          onHover: (event) {
            setState(() => showMenu = true);
          },
          child: SizedBox(
            height: 32,
            // width: 100,
            child: FilledButton.tonalIcon(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
                    side: const MaterialStatePropertyAll(BorderSide.none)),
                icon: const Icon(Icons.arrow_drop_down),
                onPressed: () {
                  // setState(() => showMenu = true);
                },
                label: const Text('Filter')),
          )

          //  Container(
          //     color: Colors.red,
          //     height: 40,
          //     width: 100,
          //     child: const Center(child: Text('left menu'))),
          ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
    required this.children,
    required this.deepMenu,
  }) : super(key: key);

  final List<Widget> children;
  final bool deepMenu;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}

class ModalEntry extends StatelessWidget {
  const ModalEntry({
    Key? key,
    required this.onClose,
    required this.menu,
    required this.visible,
    required this.menuAnchor,
    required this.childAnchor,
    required this.child,
    required this.deepMenu,
  }) : super(key: key);

  final VoidCallback onClose;
  final Widget menu;
  final bool visible;
  final Widget child;
  final Alignment menuAnchor;
  final Alignment childAnchor;
  final bool deepMenu;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: visible ? onClose : null,
      child: PortalTarget(
        visible: visible,
        portalFollower: menu,
        anchor: const Aligned(
          follower: Alignment.topRight,
          target: Alignment.bottomRight,
          // widthFactor: deepMenu ? 2 : 1,
          // heightFactor: deepMenu ? 4 : 3
          // backup: Aligned(
          //   follower: Alignment.bottomLeft,
          //   target: Alignment.topLeft,
          //   widthFactor: 1,
          // ),
        ),
        child: IgnorePointer(
          ignoring: visible,
          child: child,
        ),
      ),
    );
  }
}
