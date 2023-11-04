import 'package:flutter/material.dart';

class ArticleDetailsPageArgs {}

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
