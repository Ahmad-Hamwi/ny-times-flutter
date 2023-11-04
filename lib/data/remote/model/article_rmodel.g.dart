// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_rmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleRemoteModel _$ArticleRemoteModelFromJson(Map<String, dynamic> json) =>
    ArticleRemoteModel(
      json['section'] as String,
      json['title'] as String,
      json['abstract'] as String,
      json['url'] as String,
      (json['multimedia'] as List<dynamic>)
          .map((e) => MultiMediaRemoteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['byline'] as String,
    );

Map<String, dynamic> _$ArticleRemoteModelToJson(ArticleRemoteModel instance) =>
    <String, dynamic>{
      'section': instance.section,
      'title': instance.title,
      'abstract': instance.abstract,
      'url': instance.url,
      'multimedia': instance.multimedia,
      'byline': instance.byLine,
    };
