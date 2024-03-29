import 'package:ny_times_flutter/domain/entity/article_entity.dart';
import 'package:ny_times_flutter/presentation/bloc/home_bloc.dart';
import 'package:ny_times_flutter/presentation/pages/home/article_lists_toggler.dart';
import 'package:ny_times_flutter/presentation/pages/home/layout_empty.dart';
import 'package:ny_times_flutter/presentation/pages/home/layout_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBodyBlocBuilder extends StatelessWidget {
  final bool isListView;
  final String searchQuery;
  final void Function(ArticleEntity article) onArticleClicked;
  final void Function(String? section) onRetry;

  const HomeBodyBlocBuilder({
    super.key,
    required this.isListView,
    required this.searchQuery,
    required this.onArticleClicked,
    required this.onRetry,
  });

  List<ArticleEntity> filterArticles(
    String q,
    List<ArticleEntity> allArticles,
  ) {
    if (q.isEmpty) {
      return allArticles;
    }

    final qLowerCase = q.toLowerCase();

    List<ArticleEntity> filteredTitles = [];

    for (ArticleEntity article in allArticles) {
      if (article.title.toLowerCase().contains(qLowerCase)) {
        filteredTitles.add(article);
      } else if (article.author.toLowerCase().contains(qLowerCase)) {
        filteredTitles.add(article);
      }
    }

    return filteredTitles;
  }

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
            final articles = filterArticles(
              searchQuery,
              stateWithArticles.articles,
            );
            return articles.isEmpty
                ? const LayoutEmpty()
                : ArticleListsToggler(
                    articles: articles,
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
