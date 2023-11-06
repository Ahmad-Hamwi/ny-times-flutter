import 'package:bab_alomda_assessment_flutter/domain/entity/article_entity.dart';
import 'package:bab_alomda_assessment_flutter/domain/entity/section_entity.dart';
import 'package:bab_alomda_assessment_flutter/domain/interactor/get_articles_use_case.dart';
import 'package:bab_alomda_assessment_flutter/domain/interactor/get_filters_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetArticlesUseCase _getArticlesUseCase;
  final GetSectionsUseCase _getSectionsUseCase;

  HomeBloc(
    this._getArticlesUseCase,
    this._getSectionsUseCase, {
    HomeState initialState = const HomeInitial(),
  }) : super(initialState) {
    on<FetchHomePage>((event, emit) async {
      if (state is HomeLoading) {
        return;
      }

      emit(HomeLoading());

      try {
        final sectionsFuture = _getSectionsUseCase.execute();
        final articlesFuture = _getArticlesUseCase.execute();

        final results = await Future.wait([sectionsFuture, articlesFuture]);

        emit(
          HomeLoaded(
            results[0] as List<SectionEntity>,
            results[1] as List<ArticleEntity>,
          ),
        );
      } catch (e) {
        emit(HomeError(e));
      }
    });

    on<FetchArticles>((event, emit) async {
      final sections = (state as HomeStateHasSections).sections;

      emit(ArticlesLoading(sections));

      try {
        final articles = await _getArticlesUseCase.execute(
          GetArticlesParams(
            sectionFilter: event.section == null
                ? null
                : SectionEntity(name: event.section!),
          ),
        );

        emit(ArticlesLoaded(articles, sections));
      } catch (e) {
        emit(ArticlesError(e, sections, event.section));
      }
    });
  }
}
