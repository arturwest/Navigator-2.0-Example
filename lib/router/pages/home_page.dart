import 'package:declarative_navigation_example/actions/home_action.dart';
import 'package:declarative_navigation_example/helpers/no_animation_material_page_route.dart';
import 'package:flutter/material.dart';

import '../../home_widget.dart';

class HomePage extends Page<HomeWidget> {
  final Function(HomeAction) _onHomeAction;
  final bool forceUpdate;

  const HomePage(int selectedIndex, this._onHomeAction,
      {this.forceUpdate = false})
      : super(
            name: "home",
            arguments: selectedIndex,
            key: const ValueKey<String>("home"));

  @override
  Route<HomeWidget> createRoute(BuildContext context) {
    return NoAnimationMaterialPageRoute(
        settings: this,
        builder: (BuildContext context) {
          return HomeWidget(_onHomeAction);
        });
  }

  @override
  bool canUpdate(Page<dynamic> other) {
    var canUpdate = super.canUpdate(other) && !forceUpdate;
    return canUpdate;
  }
}
