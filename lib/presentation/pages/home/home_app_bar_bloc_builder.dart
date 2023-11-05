import 'package:bab_alomda_assessment_flutter/presentation/bloc/home_bloc.dart';
import 'package:bab_alomda_assessment_flutter/presentation/pages/home/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppBarBlocBuilder extends StatelessWidget
    implements PreferredSizeWidget {
  final bool isListView;
  final void Function(String submittedQuery) onQuerySubmitted;
  final void Function() onViewToggled;
  final void Function(String? value) onFilterSelected;

  const HomeAppBarBlocBuilder({
    super.key,
    required this.isListView,
    required this.onQuerySubmitted,
    required this.onViewToggled,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeInitial:
          case HomeLoading:
          case HomeError:
          case ArticlesError:
            return Container(height: preferredSize.height);
          case HomeLoaded:
          case ArticlesLoading:
          case ArticlesLoaded:
            final stateWithSections = state as HomeStateHasSections;
            return HomeAppBar(
              options: stateWithSections.sections.map((e) => e.name).toList(),
              isListView: isListView,
              onQuerySubmitted: onQuerySubmitted,
              onViewToggled: onViewToggled,
              onFilterSelected: onFilterSelected,
            );
          default:
            throw UnimplementedError();
        }
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(58.0);
}
