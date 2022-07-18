class AppConfiguration {
  static const String loginPath = "login";
  static const String page1Path = "page1";
  static const String page2Path = "page2";

  AppConfiguration._();

  factory AppConfiguration.login() = LoginNavState;

  factory AppConfiguration.home(int selectedIndex) = HomeNavState;

  static AppConfiguration fromUri(Uri uri) {
    if (uri.pathSegments.isEmpty) {
      return AppConfiguration.login();
    } else if (uri.pathSegments.length == 1) {
      String first = uri.pathSegments.first;
      switch (first) {
        case loginPath:
          return AppConfiguration.login();
        case page1Path:
          return AppConfiguration.home(0);
        case page2Path:
          return AppConfiguration.home(1);
      }
    }

    return AppConfiguration.login();
  }

  static Uri toUri(AppConfiguration configuration) {
    String path = "";
    if (configuration is LoginNavState) {
      path = loginPath;
    } else if (configuration is HomeNavState) {
      switch (configuration.selectedIndex) {
        case 0:
          path = page1Path;
          break;
        case 1:
          path = page2Path;
          break;
      }
    }
    return Uri.parse(path);
  }
}

class LoginNavState extends AppConfiguration {
  LoginNavState() : super._();
}

class HomeNavState extends AppConfiguration {
  final int selectedIndex;

  HomeNavState(this.selectedIndex) : super._();
}
