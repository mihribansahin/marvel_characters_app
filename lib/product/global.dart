import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';

class Global{

  static String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
static Timestamp myTimeStamp =
    Timestamp.fromDate(DateTime.now()); //To TimeStamp
    
}