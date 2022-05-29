
import 'package:marvel_characters_app/product/model/data_model.dart';



 
class CharsModel {
  DataModel? data;

  CharsModel({this.data});

  factory CharsModel.fromJson(Map json)  =>
     CharsModel(data:DataModel.fromJson(json['data']));

}
