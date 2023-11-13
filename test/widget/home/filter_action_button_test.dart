import 'package:ny_times_flutter/presentation/pages/home/filter_action_button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../util/app/testing_app.dart';

void main() {
  group("FilterActionButton tests", () {
    const options = ["arts", "automobiles", "books", "business"];
    final filterButtonFinder = find.byType(FilterActionButton);
    final removeFilterFinder = find.byKey(FilterActionButton.removeKey);
    final optionFinder = find.text("arts");

    Future<void> actionButtonTap(WidgetTester tester) async {
      await tester.tap(filterButtonFinder);
      await tester.pumpAndSettle();
    }

    Future<void> removeFilterTap(WidgetTester tester) async {
      await tester.tap(removeFilterFinder);
      await tester.pumpAndSettle();
    }

    Future<void> optionTap(WidgetTester tester) async {
      await tester.tap(optionFinder);
      await tester.pumpAndSettle();
    }

    testWidgets("No remove filter option initially", (tester) async {
      await tester.pumpWidget(
        TestingMaterialApp(
          home: FilterActionButton(
            onValueSelected: (String? value) {},
            options: const [],
          ),
        ),
      );

      await actionButtonTap(tester);

      expect(removeFilterFinder, findsNothing);
    });

    testWidgets("Remove filter option shows when selecting", (tester) async {
      await tester.pumpWidget(
        TestingMaterialApp(
          home: FilterActionButton(
            onValueSelected: (String? value) {},
            options: options,
          ),
        ),
      );

      await actionButtonTap(tester);
      await optionTap(tester);
      await actionButtonTap(tester);

      expect(removeFilterFinder, findsOneWidget);
    });

    testWidgets("No remove filter option after pressing on it", (tester) async {
      await tester.pumpWidget(
        TestingMaterialApp(
          home: FilterActionButton(
            onValueSelected: (String? value) {},
            options: options,
          ),
        ),
      );

      await actionButtonTap(tester);
      await optionTap(tester);
      await actionButtonTap(tester);
      await removeFilterTap(tester);
      await actionButtonTap(tester);

      expect(removeFilterFinder, findsNothing);
    });
  });
}
