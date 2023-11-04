import 'package:bab_alomda_assessment_flutter/data/remote/mapper/mapper.dart';
import 'package:bab_alomda_assessment_flutter/data/remote/model/article_rmodel.dart';
import 'package:bab_alomda_assessment_flutter/domain/entity/article_entity.dart';
import 'package:bab_alomda_assessment_flutter/domain/entity/section_entity.dart';

class ArticleEntityMapper extends Mapper<ArticleEntity, ArticleRemoteModel> {
  @override
  ArticleEntity? map(ArticleRemoteModel? from) {
    return from == null
        ? null
        : ArticleEntity(
            section: SectionEntity(name: from.section),
            title: from.title,
            author: from.byLine,
            thumbnailSrc: from.multimedia.last.url,
            largeImageSrc: from.multimedia[1].url,
            description: from.abstract,
            articleHtml: from.url,
          );
  }
}
