class ThumbnailModel {
  String? path;
  String? extension;
  

  ThumbnailModel({this.extension, this.path});


  factory ThumbnailModel.fromJson(Map json) {
    return ThumbnailModel(
      path: json['path'],
      extension: json['extension'],
    );
  }
}
