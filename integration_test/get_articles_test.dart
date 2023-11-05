import 'package:bab_alomda_assessment_flutter/di/di_container.dart';
import 'package:bab_alomda_assessment_flutter/domain/entity/section_entity.dart';
import 'package:bab_alomda_assessment_flutter/domain/interactor/get_articles_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    initDiContainer();
  });

  tearDownAll(() {
    disposeDiContainer();
  });

  group("GetArticlesUseCase tests", () {
    test("gets filtered articles by a valid section", () async {
      final getArticlesUseCase = sl<GetArticlesUseCase>();

      final articles = await getArticlesUseCase.execute(
        GetArticlesParams(
          sectionFilter: SectionEntity(name: "arts"),
        ),
      );

      expect(articles, isNotNull);
    });

    test("gets 'home' articles by passing no section", () async {
      final getArticlesUseCase = sl<GetArticlesUseCase>();

      final articles = await getArticlesUseCase.execute();

      expect(articles, isNotNull);
    });

    test("throws an exception when passing an invalid section", () {
      final getArticlesUseCase = sl<GetArticlesUseCase>();

      execution() => getArticlesUseCase.execute(
            GetArticlesParams(
              sectionFilter: SectionEntity(name: "invalid"),
            ),
          );

      expect(execution, throwsException);
    });
  });
}
