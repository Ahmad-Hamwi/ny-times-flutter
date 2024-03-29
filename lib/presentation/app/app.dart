import 'package:ny_times_flutter/presentation/app/theme_data.dart';
import 'package:ny_times_flutter/presentation/routing/routing.dart';
import 'package:flutter/material.dart';

class MyMaterialApp extends MaterialApp {
  MyMaterialApp({
    String? initialRoute,
    RouteFactory? onGenerateRoute,
    super.home,
    super.navigatorKey,
    super.key,
    super.navigatorObservers,
  }) : super(
          theme: themeData,
          initialRoute: initialRoute ?? Routing.home,
          onGenerateRoute: onGenerateRoute ?? Routing.onGenerateRoute,
        );
}
