import 'package:bab_alomda_assessment_flutter/presentation/app/app.dart';

import 'testing_routes.dart';

class TestingMaterialApp extends MyMaterialApp {
  TestingMaterialApp({
    super.key,
    super.navigatorKey,
    super.initialRoute,
    super.home,
    super.navigatorObservers,
    RouteStubbingOptions routeStubbingOptions = const {},
  }) : super(
          onGenerateRoute: (settings) {
            return TestRouting.onGenerateRoute(
              routeSettings: settings,
              routeStubbingOptions: routeStubbingOptions,
            );
          },
        );
}
