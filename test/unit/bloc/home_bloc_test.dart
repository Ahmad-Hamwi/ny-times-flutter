import 'package:bab_alomda_assessment_flutter/domain/entity/section_entity.dart';
import 'package:bab_alomda_assessment_flutter/presentation/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/domain/domain_mocks_registry.mocks.dart';

void main() {
  group("HomeBloc tests", () {
    late MockGetArticlesUseCase mockGetArticlesUseCase;
    late MockGetSectionsUseCase mockGetSectionsUseCase;
    late HomeBloc bloc;

    const timeoutDuration = Duration(milliseconds: 200);

    setUp(() {
      mockGetArticlesUseCase = MockGetArticlesUseCase();
      mockGetSectionsUseCase = MockGetSectionsUseCase();
      bloc = HomeBloc(mockGetArticlesUseCase, mockGetSectionsUseCase);
    });

    test("initial state of home bloc is HomeInitial", () {
      expect(bloc.state, isA<HomeInitial>());
    });

    test("emits loading and loaded when fetch home page event", () {
      when(mockGetSectionsUseCase.execute()).thenAnswer((_) async => []);
      when(mockGetArticlesUseCase.execute()).thenAnswer((_) async => []);

      bloc.add(FetchHomePage());

      expect(
        bloc.stream.timeout(timeoutDuration),
        emitsInOrder([isA<HomeLoading>(), isA<HomeLoaded>()]),
      );
    });

    test("emits loading and error when fetch home page event but sections fail",
        () {
      when(mockGetSectionsUseCase.execute()).thenThrow(Exception());
      when(mockGetArticlesUseCase.execute()).thenAnswer((_) async => []);

      bloc.add(FetchHomePage());

      expect(
        bloc.stream.timeout(timeoutDuration),
        emitsInOrder([isA<HomeLoading>(), isA<HomeError>()]),
      );
    });

    test("emits loading and error when fetch home page event but articles fail",
        () {
      when(mockGetSectionsUseCase.execute()).thenAnswer((_) async => []);
      when(mockGetArticlesUseCase.execute()).thenThrow(Exception());

      bloc.add(FetchHomePage());

      expect(
        bloc.stream.timeout(timeoutDuration),
        emitsInOrder([isA<HomeLoading>(), isA<HomeError>()]),
      );
    });

    test("emits loading and loaded when fetch articles event", () {
      when(mockGetArticlesUseCase.execute(any)).thenAnswer((_) async => []);

      bloc.add(FetchArticles("any"));

      expect(
        bloc.stream.timeout(timeoutDuration),
        emitsInOrder([isA<ArticlesLoading>(), isA<ArticlesLoaded>()]),
      );
    });

    test(
      "emits loading and error when fetch articles event but articles fail",
      () {
        when(mockGetArticlesUseCase.execute(any)).thenThrow(Exception());

        bloc.add(FetchArticles("any"));

        expect(
          bloc.stream.timeout(timeoutDuration),
          emitsInOrder([isA<ArticlesLoading>(), isA<ArticlesError>()]),
        );
      },
    );
  });
}
