import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';

class Global{

  static String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

   static Timestamp myTimeStamp =
    Timestamp.fromDate(DateTime.now()); //To TimeStamp

    //ONLY NUMERIC CONTROL
  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
    //ONLY FOR COMIC NAME
 static String myComicNameFunc(String comicName) {
    var newComicName = comicName.replaceAll(RegExp('\\(.*?\\)'), '');
    print(newComicName); //
    return newComicName;
  }
  //ONLY FOR COMIC DATE
  static String myComicDateFunc(String myText) {
    String str = myText;
    String start = "(";
    String end = ")";
    final startIndex = str.indexOf(start);
    final endIndex = str.indexOf(end, startIndex + start.length);
    String date = str.substring(startIndex + start.length, endIndex);

    return (date);
  }

}