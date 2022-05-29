import 'package:marvel_characters_app/product/model/thumbnail_model.dart';

import 'comics_model.dart';

class ResultModel {
  int? id;
  String? name;
  String? description;
  ThumbnailModel? thumbNail;
  ComicModel? comics;
  ResultModel(
      {this.id, this.name, this.description, this.thumbNail, this.comics});

  factory ResultModel.fromJson(Map json) {
    return ResultModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        thumbNail: ThumbnailModel.fromJson(json['thumbnail']),
        comics: ComicModel.fromJson(json['comics']));
  }
}
