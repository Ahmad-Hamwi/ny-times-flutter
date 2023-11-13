import 'package:ny_times_flutter/di/di_container.dart';
import 'package:ny_times_flutter/domain/interactor/get_articles_use_case.dart';
import 'package:ny_times_flutter/domain/interactor/get_filters_use_case.dart';
import 'package:ny_times_flutter/presentation/bloc/home_bloc.dart';

void registerPresentationLayer() {
  sl.registerFactory(
    () => HomeBloc(
      sl<GetArticlesUseCase>(),
      sl<GetSectionsUseCase>(),
    ),
  );
}
