import 'package:marvel_characters_app/product/model/results_model.dart';

class DataModel {

  int? count;
  List<ResultModel>? results;

  DataModel({this.count, this.results});

  factory DataModel.fromJson(Map json) {
    return DataModel(
        count: json['count'],
        results:(json['results'] ?? []).map((r) => ResultModel.fromJson(r)).toList().cast<ResultModel>());
  }
}
