import 'package:declarative_navigation_example/helpers/no_animation_material_page_route.dart';
import 'package:flutter/material.dart';

import '../../auth_widget.dart';

class AuthPage extends Page<AuthWidget> {
  const AuthPage() : super(name: "auth", key: const ValueKey<String>("auth"));

  @override
  Route<AuthWidget> createRoute(BuildContext context) {
    return NoAnimationMaterialPageRoute(
        settings: this,
        builder: (BuildContext context) {
          return const AuthWidget();
        });
  }
}
