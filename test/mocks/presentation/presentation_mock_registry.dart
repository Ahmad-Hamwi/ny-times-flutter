import 'package:ny_times_flutter/presentation/bloc/home_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}
class FakeHomeEvent extends Fake implements HomeEvent {}
class FakeHomeState extends Fake implements HomeState {}

void registerFallBackFakeBlocValues() {
  registerFallbackValue(FakeHomeEvent());
  registerFallbackValue(FakeHomeState());
}
