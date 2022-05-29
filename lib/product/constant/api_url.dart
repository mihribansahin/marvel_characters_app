import 'package:marvel_characters_app/product/global.dart';

abstract class ApiUrl {
  static String PRIVATE_API_KEY = "4f02c000f235dcdb85b6c0cb1cfd43ed4069deff";
  static String PUBLIC_API_KEY = "52f00f335ced1b09f7df64b4fd8c8639";

  static String BASE_URL = "http://gateway.marvel.com/v1/";

  static  String CURRENT_URL =
      BASE_URL+"public/characters?orderBy=name&ts=" +
          Global.myTimeStamp.toString() +
          "&apikey="+PUBLIC_API_KEY+"&hash=" +
          Global.generateMd5(Global.myTimeStamp.toString() +
              PRIVATE_API_KEY +
              PUBLIC_API_KEY) +
          "&limit=100";

  Future<dynamic> getResponse(String url);
}
