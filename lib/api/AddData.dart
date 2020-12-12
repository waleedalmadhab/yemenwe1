
import 'package:dio/dio.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/constants/Constant.dart';

class AddData{


 Future<Response> addConsulation(String title,String body,int cat,String token)async{

    Dio dio;
    dio=Dio();
    //dio.options.headers['content-Type'] = 'application/json';
    // dio.options.connectTimeout = 5000; //5s
    //dio.options.receiveTimeout = 5000;


    var a = { "token": "${token}","title":"$title","body":"$body","category_id":cat};
    //  var a1 = { "username": "admin@test.com","password":"123"};

    var response = await dio.post(urls.addCons, data: FormData.fromMap(a),
      options: Options(
          headers: {
           // "ACCEPT": 'application/json',
            "Authorization": 'Bearer ${token}',
         //   "CONTENT_TYPE": 'application/json',
            "X-localization": 'ar'
          },
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          }),

    );

    return response;



  }
 Future<Response> addReplyConsulation(String body,int cons_id,String token)async{

    Dio dio;
    dio=Dio();
    //dio.options.headers['content-Type'] = 'application/json';
    // dio.options.connectTimeout = 5000; //5s
    //dio.options.receiveTimeout = 5000;


    var a = { "token": "${token}","body":"$body","post_id":cons_id};
    //  var a1 = { "username": "admin@test.com","password":"123"};

    var response = await dio.post(urls.addReplyCons, data: FormData.fromMap(a),
      options: Options(
          headers: {
         //   "ACCEPT": 'application/json',
            "Authorization": 'Bearer ${token}',
      //      "CONTENT_TYPE": 'application/json',
            "X-localization": 'ar'
          },
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          }),

    );

    return response;



  }




}