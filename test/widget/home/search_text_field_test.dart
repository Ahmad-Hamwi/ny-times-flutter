import 'package:bab_alomda_assessment_flutter/presentation/pages/home/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../util/app/testing_app.dart';

void main() {
  group("SearechTextField tests", () {
    testWidgets('TextField submission', (WidgetTester tester) async {
      String expectedQuery = "Ahmad";
      String? submittedQuery;

      await tester.pumpWidget(
        TestingMaterialApp(
          home: Scaffold(
            body: SearchTextField(
              onQuerySubmitted: (q) {
                submittedQuery = q;
              },
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), expectedQuery);

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(submittedQuery, expectedQuery);
    });

    testWidgets('TextField clearing', (WidgetTester tester) async {
      String submittedQuery = "Ahmad";

      await tester.pumpWidget(
        TestingMaterialApp(
          home: Scaffold(
            body: SearchTextField(
              onQuerySubmitted: (q) {},
            ),
          ),
        ),
      );

      final textFieldFinder = find.byType(TextField);
      final submittedTextFinder = find.text(submittedQuery);
      await tester.enterText(textFieldFinder, submittedQuery);
      await tester.pump();
      expect(submittedTextFinder, findsOneWidget);

      await tester.tap(find.byKey(SearchTextField.closeKey));
      await tester.pump();
      expect(find.text(submittedQuery), findsNWidgets(0));
    });
  });
}
