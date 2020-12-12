
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FavProvider extends ChangeNotifier{

  static int count=1;
  static double price=1.0;

  update(){
    notifyListeners();
  }

}