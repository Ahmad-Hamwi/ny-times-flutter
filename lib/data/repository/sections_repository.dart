import 'package:bab_alomda_assessment_flutter/domain/entity/section_entity.dart';
import 'package:bab_alomda_assessment_flutter/domain/gateway/sections_repository.dart';

class SectionsRepositoryImpl extends ISectionsRepository {
  @override
  Future<List<SectionEntity>> getSections() async {
    // This is provided by the api docs, if there's an api for it we would
    // replace this with the corresponding endpoint
    return [
      SectionEntity(name: "arts"),
      SectionEntity(name: "automobiles"),
      SectionEntity(name: "books"),
      SectionEntity(name: "business"),
      SectionEntity(name: "fashion"),
      SectionEntity(name: "food"),
      SectionEntity(name: "health"),
      SectionEntity(name: "home"),
      SectionEntity(name: "insider"),
      SectionEntity(name: "magazine"),
      SectionEntity(name: "movies"),
      SectionEntity(name: "nyregion"),
      SectionEntity(name: "obituaries"),
      SectionEntity(name: "opinion"),
      SectionEntity(name: "politics"),
      SectionEntity(name: "realestate"),
      SectionEntity(name: "science"),
      SectionEntity(name: "sports"),
      SectionEntity(name: "sundayreview"),
      SectionEntity(name: "technology"),
      SectionEntity(name: "theater"),
      SectionEntity(name: "t-magazine"),
      SectionEntity(name: "travel"),
      SectionEntity(name: "upshot"),
      SectionEntity(name: "us"),
      SectionEntity(name: "world"),
    ];
  }
}
