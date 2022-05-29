import 'package:flutter/cupertino.dart';
import 'package:marvel_characters_app/product/constant/enum/status_enum.dart';
import 'package:marvel_characters_app/product/service/api_service.dart';

class DetailViewModel extends ChangeNotifier{
  Status? _status;

  Status get state => _status!;

  set state(Status state) {
    _status = state;
    notifyListeners();
  }

  
  
}