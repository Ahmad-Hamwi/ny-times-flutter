import 'package:ny_times_flutter/data/remote/dto/json.dart';
import 'package:ny_times_flutter/data/remote/model/multimedia_rmodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_rmodel.g.dart';

@JsonSerializable()
class ArticleRemoteModel {
  final String section;
  final String title;
  final String abstract;
  final String url;
  final List<MultiMediaRemoteModel> multimedia;
  @JsonKey(name: "byline")
  final String byLine;

  ArticleRemoteModel(this.section, this.title, this.abstract, this.url,
      this.multimedia, this.byLine);

  factory ArticleRemoteModel.fromJson(Json json) =>
      _$ArticleRemoteModelFromJson(json);
}
