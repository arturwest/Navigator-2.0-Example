import 'package:flutter/material.dart';

import 'app_configuration.dart';

class AppRouteInfoParser extends RouteInformationParser<AppConfiguration> {
  @override
  RouteInformation? restoreRouteInformation(AppConfiguration configuration) {
    return RouteInformation(
        location: "/${AppConfiguration.toUri(configuration).toString()}");
  }

  @override
  Future<AppConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    return AppConfiguration.fromUri(uri);
  }
}
