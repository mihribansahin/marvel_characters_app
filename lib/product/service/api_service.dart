import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:marvel_characters_app/product/model/chars_model.dart';
import 'package:marvel_characters_app/product/constant/api_url.dart';
import 'exception/app_exception.dart';


class APIService extends ApiUrl{
  CharsModel? _charsModel;

  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(ApiUrl.CURRENT_URL));
      responseJson = await returnResponse(response);
      _charsModel = CharsModel.fromJson(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return _charsModel;
  }

  dynamic returnResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = await jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
