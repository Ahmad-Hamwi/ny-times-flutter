import 'package:bab_alomda_assessment_flutter/domain/entity/section_entity.dart';

abstract class ISectionsRepository {
  Future<List<SectionEntity>> getSections();
}