import 'package:bab_alomda_assessment_flutter/domain/entity/article_entity.dart';
import 'package:bab_alomda_assessment_flutter/presentation/widgets/remote_image.dart';
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
    final title = args.article.section.name[0].toUpperCase() +
        args.article.section.name.substring(1);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RemoteImage(
              fit: BoxFit.cover,
              src: args.article.largeImageSrc,
              height: 250,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    args.article.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    args.article.author,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    args.article.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Read more...",
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
