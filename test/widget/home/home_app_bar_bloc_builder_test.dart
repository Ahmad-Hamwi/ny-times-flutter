import 'package:ny_times_flutter/presentation/bloc/home_bloc.dart';
import 'package:ny_times_flutter/presentation/pages/home/home_app_bar_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../mocks/presentation/presentation_mock_registry.dart';
import '../../util/app/testing_app.dart';

void main() {
  group("HomeAppBarBlocBuilder tests", () {
    late MockHomeBloc mockBloc;
    late Widget widgetUnderTest;

    setUpAll(() {
      registerFallBackFakeBlocValues();
    });

    setUp(() {
      mockBloc = MockHomeBloc();
      widgetUnderTest = TestingMaterialApp(
        home: BlocProvider<HomeBloc>(
          create: (context) => mockBloc,
          child: HomeAppBarBlocBuilder(
            isListView: true,
            onQuerySubmitted: (q) {},
            onViewToggled: () {},
            onFilterSelected: (filter) {},
          ),
        ),
      );
    });

    void whenListenInitialState(HomeState initialState) {
      whenListen(
        mockBloc,
        Stream.fromIterable(<HomeState>[]),
        initialState: initialState,
      );
    }

    testWidgets("InitialState does not render the AppBar", (tester) async {
      whenListenInitialState(const HomeInitial());

      await tester.pumpWidget(widgetUnderTest);

      expect(find.byType(AppBar), findsNothing);
    });

    testWidgets("HomeLoading does not render the AppBar", (tester) async {
      whenListenInitialState(HomeLoading());

      await tester.pumpWidget(widgetUnderTest);

      expect(find.byType(AppBar), findsNothing);
    });

    testWidgets("HomeError does not render the AppBar", (tester) async {
      whenListenInitialState(HomeError(Exception()));

      await tester.pumpWidget(widgetUnderTest);

      expect(find.byType(AppBar), findsNothing);
    });

    testWidgets("HomeLoaded DO render the AppBar", (tester) async {
      whenListenInitialState(HomeLoaded(const [], const []));

      await tester.pumpWidget(widgetUnderTest);

      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets("ArticlesLoading DO render the AppBar", (tester) async {
      whenListenInitialState(ArticlesLoading(const []));

      await tester.pumpWidget(widgetUnderTest);

      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets("ArticlesLoaded DO render the AppBar", (tester) async {
      whenListenInitialState(ArticlesLoaded(const [], const []));

      await tester.pumpWidget(widgetUnderTest);

      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets("ArticlesError DO render the AppBar", (tester) async {
      whenListenInitialState(ArticlesError(Exception(), const [], null));

      await tester.pumpWidget(widgetUnderTest);

      expect(find.byType(AppBar), findsOneWidget);
    });
  });
}