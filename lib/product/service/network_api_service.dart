import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:marvel_characters_app/product/model/chars_model.dart';
import 'package:marvel_characters_app/product/service/base_api_service.dart';
import 'exception/app_exception.dart';

//class NetworkApiService extends BaseApiService {

class NetworkApiService  {

  CharsModel? _charsModel;
  List<CharsModel>? _myCharList;

   /*Future<List<CharsModel>> fetchChars() async {
 final response = await http.get(Uri.parse(BaseApiService.FULL_URL));
 if (response.statusCode == 200) {
   print("mihrim ${CharsModelFromJson((response.body))}");
   
 return CharsModelFromJson((response.body));
    }
 return [];
  }*/


  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(BaseApiService.FULL_URL));
      responseJson = await returnResponse(response);
            _charsModel = CharsModel.fromJson(responseJson);

  

    }  on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return _charsModel;
  }

  dynamic returnResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = await jsonDecode(response.body);
      //  _charsModel = CharsModel.fromJson(responseJson);
      //  for(ResultModel rm in _charsModel!.data!)
       // var aaa = _charsModel!.data!.results![5].name;
      //  print("mihri :$aaa");
        
        // final _responseData = json.decode(response.body);
        // characterModel = CharacterModel.fromJson(_responseData);
        //print(_responseData);

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
    }    }

}
