import 'package:bab_alomda_assessment_flutter/domain/entity/article_entity.dart';
import 'package:bab_alomda_assessment_flutter/domain/entity/section_entity.dart';
import 'package:bab_alomda_assessment_flutter/presentation/pages/home/article_grid_item.dart';
import 'package:bab_alomda_assessment_flutter/presentation/pages/home/article_list_item.dart';
import 'package:bab_alomda_assessment_flutter/presentation/pages/home/article_lists_toggler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../util/app/testing_app.dart';

void main() {
  group("ArticleListToggler tests", () {
    final article = ArticleEntity(
      section: SectionEntity(name: "world"),
      title: "4 Shows to Catch at the New York Comedy Festival",
      author: "By Jason Zinoman",
      thumbnailSrc:
          "https://static01.nyt.com/images/2023/11/03/multimedia/03nycomedy-picks-gcjq/03nycomedy-picks-gcjq-thumbLarge.jpg",
      largeImageSrc:
          "https://static01.nyt.com/images/2023/11/03/multimedia/03nycomedy-picks-gcjq/03nycomedy-picks-gcjq-threeByTwoSmallAt2X.jpg",
      description:
          "It’s a sprawling, citywide event, but our expert has a strategy and some suggestions for you.",
      articleHtml:
          "https://www.nytimes.com/2023/11/03/arts/new-york-comedy-festival-picks.html",
    );

    testWidgets("renders ListView when isListView true", (tester) async {
      await tester.pumpWidget(
        TestingMaterialApp(
          home: ArticleListsToggler(
            articles: [],
            isListView: true,
            onArticleClicked: (article) {},
          ),
        ),
      );

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets("renders GridView when isListView false", (tester) async {
      await tester.pumpWidget(
        TestingMaterialApp(
          home: ArticleListsToggler(
            articles: [],
            isListView: false,
            onArticleClicked: (article) {},
          ),
        ),
      );

      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets("callback works when an item is clicked and a listview is rendered", (tester) async {
      late final ArticleEntity articleFromCallback;

      await tester.pumpWidget(
        TestingMaterialApp(
          home: ArticleListsToggler(
            articles: [article],
            isListView: true,
            onArticleClicked: (art) {
              articleFromCallback = art;
            },
          ),
        ),
      );

      await tester.tap(find.byType(ArticleListItem));
      await tester.pump();

      expect(articleFromCallback, equals(article));
    });

    testWidgets("callback works when an item is clicked and a gridview is rendered", (tester) async {
      late final ArticleEntity articleFromCallback;

      await tester.pumpWidget(
        TestingMaterialApp(
          home: ArticleListsToggler(
            articles: [article],
            isListView: false,
            onArticleClicked: (art) {
              articleFromCallback = art;
            },
          ),
        ),
      );

      await tester.tap(find.byType(ArticleGridItem));
      await tester.pump();

      expect(articleFromCallback, equals(article));
    });
  });
}
