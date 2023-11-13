import 'package:ny_times_flutter/domain/entity/section_entity.dart';

abstract class ISectionsRepository {
  Future<List<SectionEntity>> getSections();
}