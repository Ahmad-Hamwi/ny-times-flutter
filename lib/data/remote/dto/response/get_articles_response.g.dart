// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_articles_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetArticlesResponse _$GetArticlesResponseFromJson(Map<String, dynamic> json) =>
    GetArticlesResponse(
      (json['results'] as List<dynamic>)
          .map((e) => ArticleRemoteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetArticlesResponseToJson(
        GetArticlesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
