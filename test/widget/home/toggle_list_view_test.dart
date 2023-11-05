import 'package:bab_alomda_assessment_flutter/presentation/pages/home/toggle_list_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../util/app/testing_app.dart';

void main() {
  group("ToggleListView tests", () {
    final gridFinder = find.byKey(ToggleListActionButton.gridKey);
    final listFinder = find.byKey(ToggleListActionButton.listKey);

    testWidgets("grid icon when isListView is true", (tester) async {
      await tester.pumpWidget(
        TestingMaterialApp(
          home: ToggleListActionButton(
            isListView: true,
            onToggled: () {},
          ),
        ),
      );

      expect(gridFinder, findsOneWidget);
    });

    testWidgets("list icon when isListView is false", (tester) async {
      await tester.pumpWidget(
        TestingMaterialApp(
          home: ToggleListActionButton(
            isListView: false,
            onToggled: () {},
          ),
        ),
      );

      expect(listFinder, findsOneWidget);
    });
  });
}
