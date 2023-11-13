import 'package:ny_times_flutter/data/remote/dto/json.dart';
import 'package:ny_times_flutter/data/remote/model/article_rmodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_articles_response.g.dart';

@JsonSerializable()
class GetArticlesResponse {
  final List<ArticleRemoteModel> results;

  GetArticlesResponse(this.results);

  factory GetArticlesResponse.fromJson(Json json) =>
      _$GetArticlesResponseFromJson(json);
}
