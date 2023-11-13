import 'package:ny_times_flutter/data/remote/api/articles_backend_api.dart';
import 'package:ny_times_flutter/data/remote/mapper/to_domain/article_entity_mapper.dart';
import 'package:ny_times_flutter/domain/entity/article_entity.dart';
import 'package:ny_times_flutter/domain/gateway/articles_repository.dart';
import 'package:ny_times_flutter/domain/interactor/get_articles_use_case.dart';

class ArticlesRepositoryImpl extends IArticlesRepository {
  final IArticleApi _articleApi;

  ArticlesRepositoryImpl(this._articleApi);

  @override
  Future<List<ArticleEntity>> getArticles(GetArticlesParams? params) async {
    final getArticlesResponse = await _articleApi.getArticles(
      section: params?.sectionFilter?.name ?? "home",
    );

    return ArticleEntityMapper().mapList(getArticlesResponse.results)!;
  }
}
