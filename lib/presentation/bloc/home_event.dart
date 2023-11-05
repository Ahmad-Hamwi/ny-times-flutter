part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchHomePage extends HomeEvent {}

class FetchArticles extends HomeEvent {
  final String? section;

  FetchArticles(this.section);
}
