import 'dart:math';

import 'package:ny_times_flutter/di/di_container.dart';
import 'package:ny_times_flutter/domain/interactor/get_articles_use_case.dart';
import 'package:ny_times_flutter/domain/interactor/get_filters_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    initDiContainer();
  });

  tearDownAll(() {
    disposeDiContainer();
  });

  group("GetArticlesUseCase tests", () {
    test("gets filtered articles by a section provided", () async {
      final getSectionsUseCase = sl<GetSectionsUseCase>();
      final getArticlesUseCase = sl<GetArticlesUseCase>();

      final sections = await getSectionsUseCase.execute();

      final articles = await getArticlesUseCase.execute(
        GetArticlesParams(sectionFilter: sections[0]),
      );

      expect(articles, isNotNull);
    });
  });
}
