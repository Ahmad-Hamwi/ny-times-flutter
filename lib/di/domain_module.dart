import 'package:bab_alomda_assessment_flutter/data/remote/api/articles_backend_api.dart';
import 'package:bab_alomda_assessment_flutter/data/repository/aricles_repository.dart';
import 'package:bab_alomda_assessment_flutter/data/repository/sections_repository.dart';
import 'package:bab_alomda_assessment_flutter/domain/gateway/articles_repository.dart';
import 'package:bab_alomda_assessment_flutter/domain/gateway/sections_repository.dart';
import 'package:bab_alomda_assessment_flutter/domain/interactor/get_articles_use_case.dart';
import 'package:bab_alomda_assessment_flutter/domain/interactor/get_filters_use_case.dart';

import 'di_container.dart';

void registerDomainLayer() {
  sl.registerLazySingleton(() => GetArticlesUseCase(sl<IArticlesRepository>()));
  sl.registerLazySingleton(() => GetSectionsUseCase(sl<ISectionsRepository>()));

  sl.registerLazySingleton<ISectionsRepository>(
    () => SectionsRepositoryImpl(),
  );
  sl.registerLazySingleton<IArticlesRepository>(
    () => ArticlesRepositoryImpl(sl<IArticleApi>()),
  );
}
