import 'package:bab_alomda_assessment_flutter/domain/entity/article_entity.dart';
import 'package:flutter/material.dart';

class ArticleDetailsPageArgs {
  final ArticleEntity article;

  ArticleDetailsPageArgs(this.article);
}

class ArticleDetailsPage extends StatelessWidget {
  final ArticleDetailsPageArgs args;

  const ArticleDetailsPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ArticleDetails Page',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
