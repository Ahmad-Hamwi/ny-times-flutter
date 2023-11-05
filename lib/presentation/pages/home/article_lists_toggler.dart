import 'package:bab_alomda_assessment_flutter/domain/entity/article_entity.dart';
import 'package:bab_alomda_assessment_flutter/domain/entity/section_entity.dart';
import 'package:bab_alomda_assessment_flutter/presentation/pages/home/articles_grid.dart';
import 'package:bab_alomda_assessment_flutter/presentation/pages/home/articles_list.dart';
import 'package:flutter/cupertino.dart';

class ArticleListsToggler extends StatelessWidget {
  final List<ArticleEntity> articles;
  final bool isListView;
  final void Function(ArticleEntity article) onArticleClicked;

  const ArticleListsToggler({
    super.key,
    required this.articles,
    required this.isListView,
    required this.onArticleClicked,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isListView
          ? ArticlesList(
              articles: articles,
              onArticleClicked: onArticleClicked,
            )
          : ArticlesGrid(
              articles: articles,
              onArticleClicked: onArticleClicked,
            ),
    );
  }
}
