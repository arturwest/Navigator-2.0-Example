import 'package:declarative_navigation_example/prefs_data_source.dart';
import 'package:declarative_navigation_example/router/app_route_info_parser.dart';
import 'package:declarative_navigation_example/router/app_router_delegate.dart';
import 'package:flutter/material.dart';

import 'configure_non_web.dart' if (dart.library.html) 'configure_web.dart';

final PrefsDataSource prefsDataSource = PrefsDataSource();

void main() async {
  configureApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(NavigationTestApp());
}

//ignore: use_key_in_widget_constructors
class NavigationTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Navigation Test',
        routerDelegate: AppRouterDelegate(),
        routeInformationParser: AppRouteInfoParser());
  }
}
