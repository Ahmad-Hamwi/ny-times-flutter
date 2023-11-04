// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multimedia_rmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultiMediaRemoteModel _$MultiMediaRemoteModelFromJson(
        Map<String, dynamic> json) =>
    MultiMediaRemoteModel(
      json['type'] as String,
      json['url'] as String,
      json['width'] as int,
      json['height'] as int,
    );

Map<String, dynamic> _$MultiMediaRemoteModelToJson(
        MultiMediaRemoteModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
