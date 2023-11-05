import 'package:bab_alomda_assessment_flutter/domain/entity/article_entity.dart';
import 'package:bab_alomda_assessment_flutter/presentation/bloc/home_bloc.dart';
import 'package:bab_alomda_assessment_flutter/presentation/pages/home/article_lists_toggler.dart';
import 'package:bab_alomda_assessment_flutter/presentation/pages/home/layout_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBodyBlocBuilder extends StatelessWidget {
  final bool isListView;
  final void Function(ArticleEntity article) onArticleClicked;
  final void Function(String? section) onRetry;

  const HomeBodyBlocBuilder({
    super.key,
    required this.isListView,
    required this.onArticleClicked,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeInitial:
          case HomeLoading:
          case ArticlesLoading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case HomeLoaded:
          case ArticlesLoaded:
            final stateWithArticles = state as HomeStateHasArticles;
            return ArticleListsToggler(
              articles: stateWithArticles.articles,
              isListView: isListView,
              onArticleClicked: onArticleClicked,
            );
          case HomeError:
          case ArticlesError:
            final stateWithError = state as HomeStateHasError;
            return LayoutError(
              onRetry: () {
                onRetry(state is ArticlesError ? state.sectionFilter : null);
              },
              e: stateWithError.e,
            );
          default:
            throw UnimplementedError();
        }
      },
    );
  }
}
