
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{


 Future<dynamic> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key)!=null? json.decode(prefs.getString(key)):null;
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }



  setString({String key,String value=""})async{

   SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString("$key",value);



  }
  setInt({String key,int value=0})async{

   SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setInt("$key",value);



  }
 Future<int> getInt({String key})async{

   SharedPreferences prefs = await SharedPreferences.getInstance();

 return prefs.getInt("$key")??0;



  }
 Future<String> getString({String key=""})async{

   SharedPreferences prefs = await SharedPreferences.getInstance();

 return prefs.getString("$key")??"";



  }




}