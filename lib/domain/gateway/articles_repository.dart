import 'package:bab_alomda_assessment_flutter/domain/entity/article_entity.dart';
import 'package:bab_alomda_assessment_flutter/domain/interactor/get_articles_use_case.dart';

abstract class IArticlesRepository {
  Future<List<ArticleEntity>> getArticles(GetArticlesParams params);
}
