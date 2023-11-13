import 'package:ny_times_flutter/domain/interactor/get_articles_use_case.dart';
import 'package:ny_times_flutter/domain/interactor/get_filters_use_case.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<GetSectionsUseCase>(),
  MockSpec<GetArticlesUseCase>(),
])
class _DomainMockRegistry {}
