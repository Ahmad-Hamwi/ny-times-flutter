import 'package:bab_alomda_assessment_flutter/presentation/pages/article_details/article_details_page.dart';
import 'package:bab_alomda_assessment_flutter/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class Routing {
  static const String home = "/";
  static const String articleDetails = "/articleDetails";

  static Map<String, Widget Function(RouteSettings)> routeToWidgetMappings = {
    home: (settings) => const HomePage(),
    articleDetails: (settings) => ArticleDetailsPage(
          args: settings.arguments as ArticleDetailsPageArgs,
        ),
  };

  static Widget getWidgetOfRoute(RouteSettings settings) {
    final routeName = settings.name;
    final widgetFunction = routeToWidgetMappings[routeName];
    assert(
      widgetFunction != null,
      "No route to widget mapping found for route \"${settings.name}\", make sure you have registered the widget as you're adding a new route.",
    );
    return widgetFunction!(settings);
  }

  static PageRoute onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => getWidgetOfRoute(settings),
      settings: settings,
    );
  }
}
