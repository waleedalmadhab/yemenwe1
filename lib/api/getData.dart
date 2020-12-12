
import 'dart:convert';

import 'package:dio/dio.dart';
//import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/constants/Constant.dart';
import 'package:yemenwe/utils/SharedPref.dart';

class getResponseData{

  //
  // DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());
  // Options _cacheOptions = buildCacheOptions(Duration(days: 7), forceRefresh: true);

  Dio _dio = Dio();
//var token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTAxOjgwMDBcL2FwaVwvcmVnaXN0ZXIiLCJpYXQiOjE1OTc4NjY1OTcsImV4cCI6MTU5Nzg3NjE5NywibmJmIjoxNTk3ODY2NTk3LCJqdGkiOiJ0SHM5RkRwNE04VHc1Q2oxIiwic3ViIjo0LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.Q0g7hc9uST9M384GXilscudCEhyt5_ji6E4nPkbHuJ8";

  Future<Response> getDataWithToken({String url,String token,Map <String,dynamic>data=const {"":""}})async{



    Dio dio;
    dio=Dio();
    //dio.options.headers['content-Type'] = 'application/json';
   // dio.options.connectTimeout = 5000; //5s
    //dio.options.receiveTimeout = 5000;
    Response response;



print("token length ${token.length}");
   // print(data);

  var a = { "token": "${token}"};
  //  var a1 = { "username": "admin@test.com","password":"123"};

   response = await dio.post(url, data: FormData.fromMap(data),
    options: Options(
        headers: {
        //  "ACCEPT": 'application/json',
          "Authorization": 'Bearer ${token}',
          //"CONTENT_TYPE": 'application/json',
          "X-localization": 'ar'
        },
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        }),

  );

//print(response.data);




//var json=jsonDecode(response.data.toString());
   // print(response.data.toString());



  return response;

  }
  Future<Response> getDataWithToken2({String url,String token,Map <String,dynamic>data=const {"":""}})async{
//    _dioCacheManager = DioCacheManager(CacheConfig());
//var formdata=FormData.fromMap({"token":"$token"});
//    Options _cacheOptions = buildCacheOptions(Duration(days: 7));
//    Dio _dio = Dio();
//    _dio.options.headers['content-Type'] = 'application/json';
//    _dio.options.headers["authorization"] = "token ${token}";
    //  _dio.interceptors.add(_dioCacheManager.interceptor);
//    Response response = await _dio.post(
//      url,
//
//        data: formdata,
//  //      options: _cacheOptions
//    );



    Dio dio;
    dio=Dio();
    //dio.options.headers['content-Type'] = 'application/json';
   // dio.options.connectTimeout = 5000; //5s
    //dio.options.receiveTimeout = 5000;
    Response response;




    print(data);

  var a = { "token": "${token}"};
  //  var a1 = { "username": "admin@test.com","password":"123"};

   response = await dio.post(url, data: (data),
    options: Options(
        headers: {
       //   "ACCEPT": 'application/json',
          "Authorization": 'Bearer ${token}',
         // "CONTENT_TYPE": 'application/json',
          "X-localization": 'ar'
        },
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        }),

  );

//print(response.data);




//var json=jsonDecode(response.data.toString());
   // print(response.data.toString());



  return response;

  }

 Future<Response> getData({String url,Map <String,dynamic> data=const {"":""}})async{



    Dio dio;
    dio=Dio();
    dio.options.headers['content-Type'] = 'application/json';
    //dio.options.connectTimeout = 5000; //5s
  //  dio.options.receiveTimeout = 5000;

//print(data);
  //  var a = { "": ""};
    //  var a1 = { "username": "admin@test.com","password":"123"};

    var response = await dio.post(url,

      data: (data),
//      options: Options(
//          headers: {
//            "ACCEPT": 'application/json',
//          //  "Authorization": 'Bearer ${token}',
//            "CONTENT_TYPE": 'application/json',
//            "X-localization": 'ar'
//          },
//          followRedirects: false,
//          validateStatus: (status) {
//            return status < 500;
//          }),

    );


//var json=jsonDecode(response.data.toString());

  if(response.data['status']==true) {
   // print(response.data.toString());
  //  print(response.data['Posts']['data']);
  }

  else{
    print("no data");
  }


  return response;

  }
 Future<Response> getData2({String url,Map <String,dynamic> data=const {"":""}})async{



    Dio dio;
    dio=Dio();
    dio.options.headers['content-Type'] = 'application/json';
    //dio.options.connectTimeout = 5000; //5s
  //  dio.options.receiveTimeout = 5000;

//print(data);
  //  var a = { "": ""};
    //  var a1 = { "username": "admin@test.com","password":"123"};

    var response = await dio.post(url,

      data: (FormData.fromMap(data)),
//      options: Options(
//          headers: {
//            "ACCEPT": 'application/json',
//          //  "Authorization": 'Bearer ${token}',
//            "CONTENT_TYPE": 'application/json',
//            "X-localization": 'ar'
//          },
//          followRedirects: false,
//          validateStatus: (status) {
//            return status < 500;
//          }),

    );


//var json=jsonDecode(response.data.toString());

  if(response.data['status']==true) {
   // print(response.data.toString());
  //  print(response.data['Posts']['data']);
  }

  else{
    print("no data");
  }


  return response;

  }


  Future<Response> Login({String url,String phone,String pass})async{



    Dio dio;
    dio=Dio();
    //dio.options.headers['content-Type'] = 'application/json';
    //dio.options.connectTimeout = 5000; //5s
  //  dio.options.receiveTimeout = 5000;

    var a = { "phone": "$phone","password":"$pass"};
    //  var a1 = { "username": "admin@test.com","password":"123"};

    var response = await dio.post(url,

      data: FormData.fromMap(a),

    );
  //  print(a);
//print(response.data);

//var json=jsonDecode(response.data.toString());

  if(response.data['status']==true) {
   // print(response.data.toString());
  //  print(response.data['Posts']['data']);
  }

  else{
    print("no data");
  }


  return response;

  }





}