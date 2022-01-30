import 'package:declarative_navigation_example/actions/home_action.dart';
import 'package:declarative_navigation_example/router/pages/home_page.dart';
import 'package:declarative_navigation_example/router/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'app_configuration.dart';

class AppRouterDelegate extends RouterDelegate<AppConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  AppConfiguration _myConfiguration = AppConfiguration.login();

  bool _isLoggedIn = false;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  AppConfiguration? get currentConfiguration {
    return _myConfiguration;
  }

  AppRouterDelegate() {
    _subscribeOnAppUpdates();
  }

  void _subscribeOnAppUpdates() {
    prefsDataSource.getLoggedInStateStream().listen((isLoggedIn) {
      _isLoggedIn = isLoggedIn;
      _myConfiguration = AppConfiguration.home(0);
      notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Page<dynamic>> stack = List.empty(growable: true);
    var configuration = _myConfiguration;
    if (configuration is LoginNavState) {
      stack.add(const LoginPage());
    } else if (configuration is HomeNavState) {
      stack.add(HomePage(configuration.selectedIndex, _processHomeClick));
    }
    return Navigator(
        key: navigatorKey, pages: stack, onPopPage: _handlePopPage);
  }

  bool _handlePopPage(Route<dynamic> route, dynamic result) {
    return false;
  }

  @override
  Future<void> setNewRoutePath(AppConfiguration configuration) async {
    if (configuration is! LoginNavState && !_isLoggedIn) {
      //Here you can write your own logic to save user intent and open it after login
      _myConfiguration = AppConfiguration.login();
    } else if (configuration is LoginNavState && _isLoggedIn) {
      //Check if user wants to login page even if he is already logged in and do nothing
    } else {
      _myConfiguration = configuration;
    }
  }

  void _processHomeClick(HomeAction action) {
    if (action is SideMenuClick) {
      _myConfiguration = AppConfiguration.home(action.selectedIndex);
    }
    notifyListeners();
  }
}
