import 'package:ny_times_flutter/domain/entity/article_entity.dart';
import 'package:ny_times_flutter/presentation/pages/home/article_grid_item.dart';
import 'package:flutter/widgets.dart';

class ArticlesGrid extends StatelessWidget {
  final List<ArticleEntity> articles;
  final void Function(ArticleEntity article) onArticleClicked;

  const ArticlesGrid({
    super.key,
    required this.articles,
    required this.onArticleClicked,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 300,
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 4,
      ),
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        return ArticleGridItem(
          article: articles[index],
          onTap: () => onArticleClicked(articles[index]),
        );
      },
    );
  }
}
