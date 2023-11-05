import 'package:bab_alomda_assessment_flutter/domain/entity/article_entity.dart';
import 'package:bab_alomda_assessment_flutter/domain/entity/section_entity.dart';
import 'package:bab_alomda_assessment_flutter/presentation/pages/article_details/article_details_page.dart';
import 'package:bab_alomda_assessment_flutter/presentation/pages/home/home_app_bar.dart';
import 'package:bab_alomda_assessment_flutter/presentation/pages/home/article_lists_toggler.dart';
import 'package:bab_alomda_assessment_flutter/presentation/routing/app_navigator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool isListView;

  @override
  void initState() {
    isListView = true;
    super.initState();
  }

  void onViewToggled() {
    setState(() => isListView = !isListView);
  }

  void navigateToArticleDetails(BuildContext context, ArticleEntity article) {
    const AppNavigator().pushArticleDetails(
      context,
      ArticleDetailsPageArgs(article),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(58.0),
        child: HomeAppBar(
          isListView: isListView,
          onQuerySubmitted: (q) {},
          onViewToggled: onViewToggled,
          onFilterSelected: (String? filter) {},
        ),
      ),
      body: ArticleListsToggler(
        articles: () {
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

          return [article, article, article, article, article, article];
        }(),
        isListView: isListView,
        onArticleClicked: (article) => navigateToArticleDetails(
          context,
          article,
        ),
      ),
    );
  }
}
