import 'package:bab_alomda_assessment_flutter/domain/entity/section_entity.dart';
import 'package:bab_alomda_assessment_flutter/domain/gateway/sections_repository.dart';
import 'package:bab_alomda_assessment_flutter/domain/interactor/use_cases.dart';

class GetSectionsUseCase extends UseCase<List<SectionEntity>, void> {

  final ISectionsRepository _sectionsRepository;

  GetSectionsUseCase(this._sectionsRepository);

  @override
  Future<List<SectionEntity>> execute([params]) async {
    return await _sectionsRepository.getSections();
  }
}