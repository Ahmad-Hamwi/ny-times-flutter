import 'entity.dart';
import 'section_entity.dart';

class ArticleEntity extends Entity {
  final SectionEntity section;
  final String title;
  final String author;
  final String thumbnailSrc;
  final String largeImageSrc;
  final String description;
  final String articleHtml;

  ArticleEntity({
    required this.section,
    required this.title,
    required this.author,
    required this.thumbnailSrc,
    required this.largeImageSrc,
    required this.description,
    required this.articleHtml,
  });
}
