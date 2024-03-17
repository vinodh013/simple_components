import 'package:flutter/material.dart';

// class OverlayWidget extends StatefulWidget {
//   const OverlayWidget(
//       {super.key,
//       required this.child,
//       required this.button,
//       required this.showOverlay});

//   final Widget child;
//   final Widget button;
//   final bool showOverlay;

//   @override
//   State<OverlayWidget> createState() => _OverlayWidgetState();
// }

// class _OverlayWidgetState extends State<OverlayWidget> {
//   // bool showOverlay = false;
//   @override
//   Widget build(BuildContext context) {
//     return OverlayButtonBuilder(
//         showOverlay: widget.showOverlay,
//         anchor: const OverlayAnchor(
//           button: Alignment.bottomRight,
//           dialog: Alignment.topRight,
//           dialogOffset: Offset(0, 8),
//         ),
//         overlay: widget.child,
//         child: widget.button);
//   }
// }

class OverlayButtonBuilder extends StatefulWidget {
  final Widget child;
  final Widget overlay;
  final bool showOverlay;
  final OverlayAnchor anchor;
  // final GlobalKey newkey;

  const OverlayButtonBuilder({
    super.key,
    required this.child,
    required this.overlay,
    required this.showOverlay,
    // required this.newkey,
    this.anchor = OverlayAnchor.dropdown,
  });

  @override
  State<OverlayButtonBuilder> createState() => _OverlayButtonBuilderState();
}

class _OverlayButtonBuilderState extends State<OverlayButtonBuilder> {
  OverlayEntry? entry;
  final layerLink = LayerLink();

  @override
  void dispose() {
    if (entry != null) {
      entry?.remove();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    applyVisibilityState();
  }

  @override
  void didUpdateWidget(covariant OverlayButtonBuilder oldWidget) {
    applyVisibilityState();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: widget.child,
    );
  }

  void applyVisibilityState() {
    final isShowOverlay = widget.showOverlay && entry == null;
    final isHideOverlay = !widget.showOverlay && entry != null;

    WidgetsBinding.instance.addPostFrameCallback((timer) {
      if (isShowOverlay) showOverlay();
      if (isHideOverlay) hideOverlay();
    });
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  void showOverlay() {
    if (entry != null) return;
    entry = OverlayEntry(
      opaque: false,
      builder: (context) => Material(
        type: MaterialType.transparency,
        child: Center(
          child: CompositedTransformFollower(
            link: layerLink,
            offset: widget.anchor.dialogOffset,
            followerAnchor: widget.anchor.dialog,
            targetAnchor: widget.anchor.button,
            child: widget.overlay,
          ),
        ),
      ),
    );
    Overlay.of(context).insert(entry!);
  }
}


class OverlayAnchor {
  final Alignment button;
  final Alignment dialog;
  final Offset dialogOffset;
  const OverlayAnchor({
    required this.button,
    required this.dialog,
    this.dialogOffset = Offset.zero,
  });

  static const dropdown = OverlayAnchor(
    button: Alignment.bottomLeft,
    dialog: Alignment.topLeft,
    dialogOffset: Offset(0, 8),
  );

  OverlayAnchor copyWith({
    Alignment? button,
    Alignment? dialog,
    Offset? dialogOffset,
  }) {
    return OverlayAnchor(
      button: button ?? this.button,
      dialog: dialog ?? this.dialog,
      dialogOffset: dialogOffset ?? this.dialogOffset,
    );
  }
}
