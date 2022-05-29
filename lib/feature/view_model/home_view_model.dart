import 'package:flutter/cupertino.dart';
import 'package:marvel_characters_app/product/model/chars_model.dart';
import 'package:marvel_characters_app/product/constant/api_url.dart';
import 'package:marvel_characters_app/product/service/api_service.dart';

import '../../product/constant/enum/status_enum.dart';

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
      //todo:
      charsModel = await APIService().getResponse(ApiUrl.CURRENT_URL);
      state = Status.IDLE;
      return charsModel!;
    } catch (e) {
      state = Status.ERROR;
      print("STATUS.ERROR: $e ");
      return null;
    }
  }
}
