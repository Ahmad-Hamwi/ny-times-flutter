import 'package:bab_alomda_assessment_flutter/presentation/routing/routing.dart';
import 'package:flutter/material.dart';

/// A map from a route name to a flag indicating if the route should stubbed
/// or not.
typedef RouteStubbingOptions = Map<String, bool>;

class TestRouting {
  static Route<dynamic> onGenerateRoute({
    required RouteSettings routeSettings,
    required RouteStubbingOptions routeStubbingOptions,
  }) {
    final routeName = routeSettings.name;
    return MaterialPageRoute(
      builder: (_) {
        final routeStubbingFlag = routeStubbingOptions[routeName] ?? false;

        Key key = Key(routeSettings.name!);

        return routeStubbingFlag
            ? Placeholder(key: key)
            : Routing.getWidgetOfRoute(routeSettings);
      },
      settings: routeSettings,
    );
  }
}