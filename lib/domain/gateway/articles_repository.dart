import 'package:ny_times_flutter/domain/entity/article_entity.dart';
import 'package:ny_times_flutter/domain/interactor/get_articles_use_case.dart';

abstract class IArticlesRepository {
  Future<List<ArticleEntity>> getArticles(GetArticlesParams? params);
}
