import 'package:bab_alomda_assessment_flutter/domain/entity/article_entity.dart';
import 'package:bab_alomda_assessment_flutter/domain/entity/section_entity.dart';
import 'package:bab_alomda_assessment_flutter/domain/gateway/articles_repository.dart';

import 'use_cases.dart';

class GetArticlesUseCase
    extends UseCase<List<ArticleEntity>, GetArticlesParams> {
  final IArticlesRepository _articlesRepository;

  GetArticlesUseCase(this._articlesRepository);

  @override
  Future<List<ArticleEntity>> execute(GetArticlesParams params) {
    return _articlesRepository.getArticles(params);
  }
}

class GetArticlesParams {
  final String? query;
  final SectionEntity? sectionFilter;

  GetArticlesParams({this.query, this.sectionFilter});
}
