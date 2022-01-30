import 'package:declarative_navigation_example/page_widget.dart';
import 'package:flutter/material.dart';

import 'actions/home_action.dart';

class HomeWidget extends StatefulWidget {
  final int selectedIndex;
  final Function(HomeAction) onHomeAction;

  const HomeWidget(this.selectedIndex, this.onHomeAction, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeWidgetState();
  }
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        NavigationRail(
          extended: true,
          minExtendedWidth: 200,
          destinations: const [
            NavigationRailDestination(
                icon: Icon(Icons.home), label: Text("PAGE 1")),
            NavigationRailDestination(
                icon: Icon(Icons.emoji_symbols), label: Text("PAGE 2"))
          ],
          selectedIndex: widget.selectedIndex,
          onDestinationSelected: (value) {
            widget.onHomeAction(HomeAction.sideMenuClick(value));
          },
        ),
        Container(width: 2),
        Expanded(child: PageWidget(widget.selectedIndex))
      ],
    ));
  }
}
