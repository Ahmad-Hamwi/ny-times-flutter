import 'package:bab_alomda_assessment_flutter/presentation/pages/home/toggle_list_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../util/app/testing_app.dart';

void main() {
  group("ToggleListView tests", () {
    testWidgets("Toggle initial state is a list view", (tester) async {
      await tester.pumpWidget(
        TestingMaterialApp(
          home: ToggleListActionButton(
            onToggled: (isListView) {},
          ),
        ),
      );

      expect(find.byKey(ToggleListActionButton.gridKey), findsOneWidget);
    });

    testWidgets("Toggle behavior works both ways", (tester) async {
      await tester.pumpWidget(
        TestingMaterialApp(
          home: ToggleListActionButton(
            onToggled: (isListView) {},
          ),
        ),
      );

      final gridFinder = find.byKey(ToggleListActionButton.gridKey);
      final listFinder = find.byKey(ToggleListActionButton.listKey);

      await tester.tap(gridFinder);
      await tester.pump();

      expect(listFinder, findsOneWidget);

      await tester.tap(listFinder);
      await tester.pump();

      expect(gridFinder, findsOneWidget);
    });
  });
}
