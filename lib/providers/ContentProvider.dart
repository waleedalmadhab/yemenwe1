
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ContentProvider extends ChangeNotifier{
  var index = 0;
  increment() => index++;
  decrement() => index--;


  update(){

    notifyListeners();

  }

}