import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/constants/Constant.dart';
import 'package:yemenwe/models/consulation/Comment.dart';
import 'package:yemenwe/models/consulation/Consulation.dart';
import 'package:yemenwe/providers/ConsulationsProvider.dart';
import 'package:yemenwe/providers/ContentProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/Home2.dart';
import 'package:yemenwe/ui/pages/addConsulationPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/LoadingListShimmer.dart';
import 'package:yemenwe/ui/widgets/appBarItem.dart';
import 'package:yemenwe/ui/widgets/cosulationItem.dart';
import 'package:yemenwe/ui/widgets/noInternetConnection.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';
import 'package:yemenwe/utils/internetConnection.dart';

class ConsulationsScreen extends StatelessWidget {
  parseData({String url, BuildContext context}) {
    getResponseData().getData(url: url).then((value) {
      print(" parse is : " + value.data);
      if (value.data['status'] == true) {
        //   t=1;
        print(value.data);

        //   context.read<ContentProvider>().update();
      }
    });
  }

  var t = 0;

  List<Consulation> consulations = [];

  @override
  Widget build(BuildContext context) {
    Provider.of<ConsulationsProvider>(context,listen: true).update();

    var w = MediaQuery.of(context).size.width;
    //  Provider.of<AccountNotifier>(context,listen: true);

    return Container(
      color: colors.white,
      child: FutureBuilder(
          future: InternetConnection.instance.isConnected(),
          builder: (bc,snapshotConnection){

        return snapshotConnection.data!=null&&snapshotConnection.data?Stack(
          children: <Widget>[


FutureBuilder(
    future: getResponseData().getData(url: urls.allCons),
    builder: (bc,snapshot){
      print(snapshot.data);
var res=snapshot.data;
var length;
try {
   length=res.data['Posts']['data'].length;

  List tList = new List();
consulations.clear();
  for (int i = 0; i < res.data['Posts']['data'].length; i++) {
    List<Comment> comments = [];

    var comnts = res.data['Posts']['data'][i]['comments'] as List;


    comnts.forEach((element) {
      var c = Comment(

        id: element['id'],
        msg: element['body'],
        type: element['is_consonant'] == 0 ? "مستخدم" : "استشاري",
        date: element['published'],

      );

      comments.add(c);
    });

    var con = Consulation(
        id: res.data['Posts']['data'][i]['id'],
        title: res.data['Posts']['data'][i]['title'],
        description: res.data['Posts']['data'][i]['body'],
        date: res.data['Posts']['data'][i]['published'],
        cat: res.data['Posts']['data'][i]['category']['id'],
        type: res.data['Posts']['data'][i]['category']['name'],
        comments: comments


    );
    consulations.add(con);
  //  tList.add(res.data['Posts']['data'][i]);
  }
  print("length:");
  print(consulations.length);
  print(tList.length);
}catch(e){
  print(e.toString());
}
      return  snapshot.data!=null && consulations.length>0?   Column(
        children: <Widget>[
          appBarItem(title: "الاستشارات",type: Constant().search_consulation,),


          Expanded(
            child: ListView.builder(
              itemCount: consulations.length , // Add one more item for progress indicator
              padding: EdgeInsets.symmetric(vertical: 8.0),
              itemBuilder: (BuildContext context, int index) {
                if (index == consulations.length) {
                  return CircularProgressIndicator();
                } else {
                  return new consulationItem(consulation: consulations[index],);
                }
              },
            //  controller: _sc,
            ),
          ),
        ],
      ):
      length!=null&&length==0?Center(
        child: Text("لا يوجد بيانات"),
      ):
      LoadingListShimmer();


    }),

            Positioned(
                left: 10,
                bottom: 20,
                child: FloatingActionButton(
                  backgroundColor: colors.primary,
                  onPressed: () {
                    SharedPref().getInt(key: "login").then((value) {
                      if (value == 0) {
                        mToast().show(context,
                            msg:
                            "قم بتسجيل الدخول أولا ثم إضافة استشارة");
                      } else {
                        Get.to(addConsulationPage());
                      }
                    });
                  },
                  child: Icon(
                    Ionicons.chatbubble_ellipses_outline,
                    color: Colors.white,
                  ),
                ))
          ],
        ):Center(

          child: noInternetConnection(),
        );

      }),
    );
  }
}





/*



    return FutureBuilder(
        future: InternetConnection.instance.isConnected(),
        builder: (bc,snapshotConnection){

      return snapshotConnection.data!=null&&snapshotConnection.data?FutureBuilder(
          future: getResponseData()
              .getDataWithToken(url: urls().allCons, token: Constant().token),
          builder: (bc, snapshot) {
            print(snapshot.data);

//            try {
//              var d = jsonDecode(snapshot.data.toString());
//              //   print(d);
//              var dd = d["Posts"]['data'] as List;
//              consulations.clear();
//              dd.forEach((element) {
//                List<Comment> comments = [];
//
//                var c = element["comments"] as List;
//                c.forEach((el) {
//                  //   print(c.length);
//                  Comment com = Comment(
//                    id: el['id'],
//                    msg: el['body'],
//                    date: el['published'],
//                    type: el['is_consonant'] != 1 ? "مستخدم" : "استشاري",
//                  );
//
//                  comments.add(com);
//                });
//                print(comments.length);
//
////              print(element["category"]["name"]);
//                var i = Consulation(
//                  id: element['id'],
//                  title: element["title"],
//                  type: element["category"]["name"],
//                  cat: element["category"]["id"],
//                  description: element["body"],
//                  date: element["published"],
//                  fav: element["user_like"]!=null ?1:0,
//                  img: "images/logo.png",
//                  comments: comments,
//                );
//
//                consulations.add(i);
//              });
//
//              //  print(dd);
//            } catch (e) {}
//            return Center(child: LoadingListShimmer(),);
            return consulations.length != null && consulations.length > 0
                ? Container(
                color: Color(0xfffafafa),
                child: AnimationLimiter(
                    child: Stack(
                      children: <Widget>[
                        ConsulationScreen(),
                        Positioned(
                            left: 10,
                            bottom: 20,
                            child: FloatingActionButton(
                              backgroundColor: colors().orange,
                              onPressed: () {
                                SharedPref().getInt(key: "login").then((value) {
                                  if (value == 0) {
                                    mToast().show(context,
                                        msg:
                                        "قم بتسجيل الدخول أولا ثم إضافة استشارة");
                                  } else {
                                    Get.to(addConsulationPage());
                                  }
                                });
                              },
                              child: Icon(
                                Icons.chat,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    )))
                : Center(
              child: LoadingListShimmer(),
            );
          }):Center(

        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),

          ),
          color: colors().bg3,
          child: Text("لا يوجد اتصال بالإنترنت",style: Styles().consualtionStatisc(fsize: 14,mcolor: Colors.black),),
        ),
      );

    });



*/