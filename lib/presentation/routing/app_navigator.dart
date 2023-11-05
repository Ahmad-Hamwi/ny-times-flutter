import 'package:bab_alomda_assessment_flutter/presentation/pages/article_details/article_details_page.dart';
import 'package:bab_alomda_assessment_flutter/presentation/routing/routing.dart';
import 'package:flutter/material.dart';

abstract class IAppNavigator {
  const IAppNavigator();

  void pushArticleDetails(
    BuildContext context,
    ArticleDetailsPageArgs pageArgs, {
    bool finish = false,
  });

  void pushWebPage(
    BuildContext context,
    String src, {
    bool finish = false,
  });
}

class AppNavigator extends IAppNavigator {
  const AppNavigator();

  @override
  void pushArticleDetails(
    BuildContext context,
    ArticleDetailsPageArgs pageArgs, {
    bool finish = false,
  }) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routing.articleDetails,
      (route) => !finish,
      arguments: pageArgs,
    );
  }

  @override
  void pushWebPage(
    BuildContext context,
    String src, {
    bool finish = false,
  }) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routing.webPage,
      (route) => !finish,
      arguments: src,
    );
  }
}
