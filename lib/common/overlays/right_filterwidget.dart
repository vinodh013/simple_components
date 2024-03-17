// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

class RightFilterOverlay extends StatefulWidget {
  const RightFilterOverlay({
    Key? key,
    required this.widthOfFirstMenu,
    required this.widthOfSecondMenu,
    required this.offset,
    required this.heightOfSecondName,
    required this.heightOfFistMenuChild,
  }) : super(key: key);

  final double heightOfFistMenuChild;
  final double widthOfFirstMenu;
  final double widthOfSecondMenu;
  final double heightOfSecondName;
  final Offset offset;

  @override
  State<RightFilterOverlay> createState() => _RightFilterOverlayState();
}

class _RightFilterOverlayState extends State<RightFilterOverlay> {
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
              MouseRegion(
                onExit: (event) {
                  var dy = event.position.dy;
                  if (event.position.dx < widget.offset.dx) {
                    setState(() {
                      deepMenu = false;
                      showMenu = false;
                    });
                  } else {
                    setState(() {
                      deepMenu = true;
                    });
                  }

                  dy < widget.offset.dy || dy > widget.offset.dy + widget.widthOfFirstMenu
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
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        onHover: (value) {
                          if (value) {
                            setState(() {
                              selectedindex = 0;
                              deepMenu = true;
                            });
                          }
                        },
                        child: SizedBox(
                          width: widget.widthOfFirstMenu,
                          height: widget.heightOfFistMenuChild,
                          child: const Center(child: Text('first')),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        onHover: (value) {
                          if (value) {
                            selectedindex = 1;
                            setState(() {
                              deepMenu = true;
                              
                            });
                          }
                         
                        },
                        child: SizedBox(
                          width: widget.widthOfFirstMenu,
                          height: widget.heightOfFistMenuChild,
                          child: const Center(child: Text('second')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              deepMenu
                  ? MouseRegion(
                      onExit: (event) {
                        final dx = event.position.dx;
                        final dy = event.position.dy;
                        final widgetX = widget.offset.dx;
                        final widgetY = widget.offset.dy;
                        final thresholdX = widgetX + 80 + 100;
                        final thresholdYMax = widgetY + 100 + 40;
                        final thresholdYMin = widgetY + 60;

                        if (dx < widgetX) {
                          setState(() {
                            deepMenu = false;
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
                          height: 150,
                          width: 150,
                        ),
                      ),
                    )
                  : const SizedBox()
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
        child: Container(
            color: Colors.red,
            height: 40,
            width: 100,
            child: const Center(child: Text('show menu'))),
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
          follower: Alignment.topLeft,
          target: Alignment.bottomLeft,
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
