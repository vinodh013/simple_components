import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResponsiveTabsScreen extends ConsumerStatefulWidget {
  const ResponsiveTabsScreen({
    required this.tabs,
    required this.tabbarView,
    required this.showtabs,
    required this.isScrollable,
    this.tabShowSmallScreen,
    this.showAppbartitle,
    this.endDrawer,
    this.addbuttons,
    this.width,
    this.tabtap,
    required this.onTap,
    this.actionWidgets,
    super.key,
  });

  final Map<String, void Function()?>? addbuttons;
  final Map<String, Widget?>? actionWidgets;
  final List<String> tabs;
  final List<Widget> tabbarView;
  final bool showtabs;
  final bool isScrollable;
  final bool? tabShowSmallScreen;
  final bool? showAppbartitle;
  final Widget? endDrawer;
  final double? width;
  final void Function(int) onTap;
  final void Function(int)? tabtap;
  // final Widget? appBarActionWidget;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      ResponsiveTabsScreenState();
}

class ResponsiveTabsScreenState extends ConsumerState<ResponsiveTabsScreen> {
  GlobalKey<ScaffoldState> customerDrowerkey = GlobalKey();
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget getPeoplesTabs(
        {required bool isSmallScreen, required bool isScrollable}) {
      return DefaultTabController(
        length: widget.tabs.length,
        initialIndex: 0,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(widget.width ?? 1000, 100),
              child: Card(
                margin: const EdgeInsets.all(0),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.zero),
                child: TabBar(
                    onTap: widget.tabtap,
                    tabAlignment: isSmallScreen && widget.tabs.length == 2
                        ? TabAlignment.fill
                        : null,
                    isScrollable:
                        widget.tabs.length == 2 ? false : isScrollable,
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: widget.tabs
                        .map((e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Tab(child: Text(e)),
                            ))
                        .toList()),
              )),
          body: TabBarView(children: widget.tabbarView),
        ),
      );
    }

    Widget getBodywithSideNav({required bool showappBar}) {
      return Scaffold(
        appBar: showappBar
            ? AppBar(
                leading: IconButton(
                    onPressed: () {
                      customerDrowerkey.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu)),
                title: widget.showAppbartitle == true
                    ? Text(widget.tabs[selectedIndex])
                    : null,
                actions: [
                  widget.addbuttons?[widget.tabs[selectedIndex]] != null
                      ? TextButton(
                          onPressed:
                              widget.addbuttons?[widget.tabs[selectedIndex]],
                          child: Text("Add ${widget.tabs[selectedIndex]}"))
                      : const SizedBox(),
                  widget.actionWidgets?[widget.tabs[selectedIndex]] ??
                      const SizedBox()
                ],
              )
            : null,
        body: widget.tabbarView[selectedIndex],
      );
    }

    Widget navigationListTiles() {
      return Container(
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(
                    color: Theme.of(context).colorScheme.outlineVariant))),
        margin: const EdgeInsets.only(left: 20, top: 20),
        width: 200,
        child: Column(children: [
          // widget.dialogTopWidget ?? const SizedBox(),
          ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            shrinkWrap: true,
            itemCount: widget.tabs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  widget.tabs[index],
                  style: TextStyle(
                      color: index == selectedIndex
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onBackground),
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  widget.onTap(index);
                },
                shape: Border(
                  left: BorderSide(
                      width: 2,
                      color: index == selectedIndex
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent),
                ),
              );
            },
          )
        ]),
      );
    }

    return Scaffold(
      key: customerDrowerkey,
      endDrawer: Drawer(child: widget.endDrawer),
      drawer: Drawer(child: navigationListTiles()),
      body: AdaptiveLayout(
        primaryNavigation: !widget.showtabs
            ? SlotLayout(config: {
                Breakpoints.large: SlotLayout.from(
                  key: const Key('largenavscreens'),
                  builder: (context) {
                    return navigationListTiles();
                  },
                )
              })
            : null,
        body: SlotLayout(
          config: {
            Breakpoints.large: SlotLayout.from(
              key: const Key('people Screen large'),
              builder: (context) {
                return widget.showtabs == false
                    ? getBodywithSideNav(showappBar: false)
                    : getPeoplesTabs(isSmallScreen: false, isScrollable: true);
              },
            ),
            Breakpoints.medium: SlotLayout.from(
              key: const Key('people Screen large'),
              builder: (context) {
                return widget.showtabs == false
                    ? getBodywithSideNav(showappBar: true)
                    : getPeoplesTabs(isScrollable: true, isSmallScreen: false);
              },
            ),
            Breakpoints.small: SlotLayout.from(
              key: const Key("People Screen small"),
              builder: (context) {
                return widget.showtabs == false &&
                        widget.tabShowSmallScreen == null
                    ? getBodywithSideNav(
                        showappBar: true,
                      )
                    : getPeoplesTabs(isScrollable: true, isSmallScreen: true);
              },
            )
          },
        ),
      ),
    );
  }
}
