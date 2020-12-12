
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
//import 'package:like_button/like_button.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:permission_handler/permission_handler.dart';
import 'package:yemenwe/api/Download.dart';
import 'package:yemenwe/constants/Constant.dart';
import 'package:yemenwe/main.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/utils/MQSize.dart';
import 'package:yemenwe/utils/SharedPref.dart';

import 'HomePage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {



//   Future<void> requestPermission(Permission permission) async {
//     final status = await permission.request();
//
// //    Map<Permission, PermissionStatus> permissions = await Permission().requestPermissions([Permission.contacts]);
//
//
//     setState(() {
//       print(status);
//   //    _permissionStatus = status;
//      // print(_permissionStatus);
//     });
//   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SharedPref().read("user").then((value) {

      TokenProvider.token=value['token'];

    });

    Timer(Duration(seconds: 1), (){

//SharedPref().getString(key: "type").then((value) {
//
//print(value);
//  if(value=="visitor"||value==""){
//    Get.off(UserHomePage(title: Constant().app_name,));
//
//  }
//  else{
//    Get.off(EmpHomePage(title: Constant().app_name,));
//
//  }
//
//
//});

Get.off(HomePage(title: Constant().app_name,));


    });

  }

  //  getPath()async{
  //
  //   var dir = Directory('/storage/emulated/0/MyFile');
  //   print('${dir.path}');
  //
  //   Directory('/storage/emulated/0/MyFile1').create()
  //   // The created directory is returned as a Future.
  //       .then((Directory directory) {
  //     print(directory.path);
  //   });
  //
  //   var d= await getExternalStorageDirectory().then((value) {
  //
  //     print(value.path);
  //   });
  //
  //
  // }



  @override
  Widget build(BuildContext context) {

//    getPath().then((value) {
//
//      print(value.path);
//
//    });

    return Container(

      child: Scaffold(
        //appBar: AppBar(),
      body: Container(
       // color: colors().white.withOpacity(.9),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Image.asset("images/newlogo.png",width: 100,height: 100,),


       //   SpinKitFadingFour(color: colors().primary,),

          Padding(
            padding: const EdgeInsets.all(8.0),
          //  child: Text(Constant().app_name,style: Styles().consualtionStatisc(fsize: 20,mcolor: colors().green21),),
          ),



        ],
        ),
      ),

      ),

    );
  }
}
