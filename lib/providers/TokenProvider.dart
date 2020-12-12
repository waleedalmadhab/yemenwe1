
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class TokenProvider extends ChangeNotifier{
  var index = 0;
  increment() => index++;
  decrement() => index--;

  static String token="";

  update(){

    notifyListeners();

  }

}