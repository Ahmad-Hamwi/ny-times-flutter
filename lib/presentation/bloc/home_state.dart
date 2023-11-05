part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

abstract class PageState extends HomeState {}

class HomeLoading extends PageState {}

class HomeLoaded extends PageState
    implements HomeStateHasArticles, HomeStateHasSections {
  @override
  final List<SectionEntity> sections;
  @override
  final List<ArticleEntity> articles;

  HomeLoaded(this.sections, this.articles);
}

class HomeError extends PageState implements HomeStateHasError {
  @override
  final dynamic e;

  HomeError(this.e);
}

abstract class ListState extends HomeState {}

class ArticlesLoading extends ListState implements HomeStateHasSections {
  @override
  final List<SectionEntity> sections;

  ArticlesLoading(this.sections);
}

class ArticlesLoaded extends ListState
    implements HomeStateHasArticles, HomeStateHasSections {
  @override
  final List<ArticleEntity> articles;
  @override
  final List<SectionEntity> sections;

  ArticlesLoaded(this.articles, this.sections);
}

class ArticlesError extends ListState
    implements HomeStateHasError, HomeStateHasSections {
  @override
  final dynamic e;
  @override
  final List<SectionEntity> sections;
  final String? sectionFilter;

  ArticlesError(this.e, this.sections, this.sectionFilter);
}

abstract class HomeStateHasArticles {
  final List<ArticleEntity> articles;

  HomeStateHasArticles(this.articles);
}

abstract class HomeStateHasSections {
  final List<SectionEntity> sections;

  HomeStateHasSections(this.sections);
}

abstract class HomeStateHasError {
  final dynamic e;

  HomeStateHasError(this.e);
}
