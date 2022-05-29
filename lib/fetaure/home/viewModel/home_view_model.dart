import 'package:flutter/cupertino.dart';
import 'package:marvel_characters_app/product/model/chars_model.dart';
import 'package:marvel_characters_app/product/service/base_api_service.dart';
import 'package:marvel_characters_app/product/service/network_api_service.dart';
import 'package:marvel_characters_app/product/service/status.dart';

class HomeViewModel with ChangeNotifier {
  Status? _status;
  CharsModel? charsModel;

  HomeViewModel() {
    charsModel = CharsModel();
    _status = Status.IDLE;
    fetchCharsModel();
  }
  Status get state => _status!;
  set state(Status state) {
    _status = state;
    notifyListeners();
  }

  Future<CharsModel?>? fetchCharsModel() async {
    try {
      state = Status.BUSY;
      charsModel =
          (await NetworkApiService().getResponse(BaseApiService.FULL_URL))!;
      state = Status.IDLE;
      return charsModel!;
    } catch (e) {
      state = Status.ERROR;
      print("STATUS.ERROR: $e ");
      return null;
    }
  }
  /* getUsers() async {
    setLoading(true);
    var response = await Service.getCharacterData();

    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse,
      );
      setUserError(userError);
    }
    setLoading(false);
  }*/
}
