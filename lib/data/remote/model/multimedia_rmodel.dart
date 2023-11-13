import 'package:ny_times_flutter/data/remote/dto/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'multimedia_rmodel.g.dart';

@JsonSerializable()
class MultiMediaRemoteModel {
  final String type;
  final String url;
  final int width;
  final int height;

  MultiMediaRemoteModel(this.type, this.url, this.width, this.height);

  factory MultiMediaRemoteModel.fromJson(Json json) {
    return _$MultiMediaRemoteModelFromJson(json);
  }
}