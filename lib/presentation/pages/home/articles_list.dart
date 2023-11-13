import 'package:ny_times_flutter/domain/entity/article_entity.dart';
import 'package:ny_times_flutter/presentation/pages/home/article_list_item.dart';
import 'package:flutter/widgets.dart';

class ArticlesList extends StatelessWidget {
  final List<ArticleEntity> articles;
  final void Function(ArticleEntity article) onArticleClicked;

  const ArticlesList({
    super.key,
    required this.articles,
    required this.onArticleClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      itemBuilder: (BuildContext context, int index) => ArticleListItem(
        article: articles[index],
        onTap: () => onArticleClicked(articles[index]),
      ),
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 4),
      itemCount: articles.length,
    );
  }
}
