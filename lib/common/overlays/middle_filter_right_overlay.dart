import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:simple_components/common/widgets/widgets.dart';

class MiddleFilterRightOverlay extends StatefulWidget {
  const MiddleFilterRightOverlay(
      {Key? key,
      required this.child,
      required this.width,
      required this.controller})
      : super(key: key);

  final Widget child;
  final double width;
  final TextEditingController controller;

  @override
  State<MiddleFilterRightOverlay> createState() =>
      _MiddleFilterRightOverlayState();
}

class _MiddleFilterRightOverlayState extends State<MiddleFilterRightOverlay> {
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
              const SizedBox(),
              MouseRegion(
                onExit: (event) {
                  setState(() {
                    showMenu = false;
                  });
                },
                child: SizedBox(
                  // height: widget.heightOfFistMenuChild,
                  // width: widget.widthOfFirstMenu,
                  child: Card(
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    elevation: 5,
                    child: widget.child,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      child: MouseRegion(
          onExit: (event) {},
          // onHover: (event) {
          //   setState(() => showMenu = true);
          // },
          child: SizedBox(
            // height: 32,
            width: widget.width,
            child: Row(
              children: [
                SettingsTextField(
                  fieldname: 'Date',
                  controller: widget.controller,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      border: OutlineInputBorder()),
                  readonly: true,

                  // shape: RoundedRectangleBorder(

                  //     side: BorderSide.none,
                  //     borderRadius: BorderRadius.circular(18)),
                  // style: ButtonStyle(
                  //     shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(15),
                  //     )),
                  //     side: const MaterialStatePropertyAll(BorderSide.none)),
                  // icon: const Icon(Icons.arrow_drop_down),
                  ontap: () {
                    setState(() => showMenu = true);
                  },
                  //  : widget.label

                  //  RichText(
                  //   text: TextSpan(text: '', children: []),
                  // ),
                ),
              ],
            ),
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
