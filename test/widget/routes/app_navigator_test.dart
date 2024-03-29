import 'package:ny_times_flutter/presentation/pages/article_details/article_details_page.dart';
import 'package:ny_times_flutter/presentation/routing/app_navigator.dart';
import 'package:ny_times_flutter/presentation/routing/routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fakes/domain/entity_fakes.dart';
import '../../util/app/testing_app.dart';

void main() {
  group("AppNavigator tests", () {
    late IAppNavigator sut;

    setUp(() {
      sut = const AppNavigator();
    });

    testWidgets(
      "Navigates to article details",
      (widgetTester) async {
        final GlobalKey<NavigatorState> key = GlobalKey();

        await widgetTester.pumpWidget(
          TestingMaterialApp(
            navigatorKey: key,
            initialRoute: Routing.home,
            routeStubbingOptions: const {
              Routing.home: true,
              Routing.articleDetails: true,
            },
          ),
        );
        await widgetTester.pumpAndSettle();

        sut.pushArticleDetails(
          key.currentContext!,
          ArticleDetailsPageArgs(FakeArticleEntity()),
        );
        await widgetTester.pumpAndSettle(); // home to articleDetails

        expect(find.byKey(const Key(Routing.articleDetails)), findsOneWidget);
      },
    );

    testWidgets(
      "Navigates to web page",
      (widgetTester) async {
        final GlobalKey<NavigatorState> key = GlobalKey();

        await widgetTester.pumpWidget(
          TestingMaterialApp(
            navigatorKey: key,
            initialRoute: Routing.home,
            routeStubbingOptions: const {
              Routing.home: true,
              Routing.webPage: true,
            },
          ),
        );
        await widgetTester.pumpAndSettle();

        sut.pushWebPage(
          key.currentContext!,
          "",
        );
        await widgetTester.pumpAndSettle(); // home to web page

        expect(find.byKey(const Key(Routing.webPage)), findsOneWidget);
      },
    );
  });
}
