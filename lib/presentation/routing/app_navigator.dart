import 'package:bab_alomda_assessment_flutter/presentation/pages/article_details_page.dart';
import 'package:bab_alomda_assessment_flutter/presentation/routing/routing.dart';
import 'package:flutter/material.dart';

abstract class IAppNavigator {
  const IAppNavigator();

  void pushArticleDetails(
    BuildContext context,
    bool finish,
    ArticleDetailsPageArgs pageArgs,
  );
}

class AppNavigator extends IAppNavigator {
  const AppNavigator();

  @override
  void pushArticleDetails(
    BuildContext context,
    bool finish,
    ArticleDetailsPageArgs pageArgs,
  ) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routing.articleDetails,
      (route) => !finish,
      arguments: pageArgs,
    );
  }
}
