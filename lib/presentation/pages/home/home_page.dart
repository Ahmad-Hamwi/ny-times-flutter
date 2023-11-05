import 'package:bab_alomda_assessment_flutter/di/di_container.dart';
import 'package:bab_alomda_assessment_flutter/domain/entity/article_entity.dart';
import 'package:bab_alomda_assessment_flutter/presentation/bloc/home_bloc.dart';
import 'package:bab_alomda_assessment_flutter/presentation/pages/article_details/article_details_page.dart';
import 'package:bab_alomda_assessment_flutter/presentation/pages/home/home_app_bar_bloc_builder.dart';
import 'package:bab_alomda_assessment_flutter/presentation/pages/home/home_body_bloc_builder.dart';
import 'package:bab_alomda_assessment_flutter/presentation/routing/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool isListView;
  late HomeBloc bloc;

  @override
  void initState() {
    isListView = true;
    bloc = sl<HomeBloc>();
    super.initState();
  }

  void onViewToggled() {
    setState(() => isListView = !isListView);
  }

  void navigateToArticleDetails(BuildContext context, ArticleEntity article) {
    const AppNavigator().pushArticleDetails(
      context,
      ArticleDetailsPageArgs(article),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => bloc..add(FetchHomePage()),
      child: Scaffold(
        appBar: HomeAppBarBlocBuilder(
          isListView: isListView,
          onQuerySubmitted: (q) {},
          onViewToggled: onViewToggled,
          onFilterSelected: (String? filter) {
            bloc.add(FetchArticles(filter));
          },
        ),
        body: HomeBodyBlocBuilder(
          isListView: isListView,
          onArticleClicked: (article) {
            navigateToArticleDetails(context, article);
          },
          onRetry: (String? filter) {
            if (bloc.state is HomeError) {
              bloc.add(FetchHomePage());
            } else if (bloc.state is ArticlesError) {
              bloc.add(FetchArticles(filter));
            }
          },
        ),
      ),
    );
  }
}
