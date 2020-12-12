import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/constants/Constant.dart';
import 'package:yemenwe/models/consulation/Comment.dart';
import 'package:yemenwe/models/consulation/Consulation.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/cosulationItem.dart';
class MyConsulationsPage extends StatelessWidget {

  var token="";
  MyConsulationsPage({this.token});

  List<Consulation> consulations=[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("استشاراتي",style: Styles().TitleTextStyle16White,),backgroundColor: colors.brown,),
      body: Container(
      child:    FutureBuilder(
              future: getResponseData().getDataWithToken(url: urls.myCons,token: token),

              builder: (bc,snapshot){
                 // print(snapshot.data);

                try {
                  var d = jsonDecode(snapshot.data.toString());
                  //   print(d);
                  var dd = d["Posts"] as List;
                  consulations.clear();
                  dd.forEach((element) {
                    List<Comment> comments=[];

                    var c=   element["comments"] as List;
                    c.forEach((el) {

                      //   print(c.length);
                      Comment com=Comment(

                        id: el['id'],
                        msg: el['body'],
                        date: el['published'],
                        type: el['user_id']!=null ?"مستخدم":"استشاري",

                      );
                      comments.add(com);

                    });
                   // print(comments.length);

//              print(element["category"]["name"]);
                    var i=Consulation(id: element['id']
                      ,
                      title: element["title"],
                      type: element["category"]["name"],
                      cat: element["category"]["id"],
                      description: element["body"],
                      date: element["published"],
                      fav: element["favorite"],
                      img: "images/logo.png",
                      comments: comments,
                    );

                    consulations.add(i);



                  });

                  //  print(dd);
                }catch(e){}
                return consulations.length!=null&&consulations.length>0? Container(

                    color: Color(0xfffafafa),


                    child: AnimationLimiter(


                        child: Stack(
                          children: <Widget>[
                            ListView.builder(itemCount: consulations.length,itemBuilder: (bc,index)=>
                                AnimationConfiguration.staggeredList(


                                    duration: const Duration(milliseconds: 1000),


                                    child: SlideAnimation(
                                        verticalOffset: 200.0,


                                        child: FadeInAnimation(child: consulationItem(consulation:consulations[index] ,))))),



                          ],
                        ))):Center(child: Text("لا يوجد استشارات بعد",style: Styles().TitleTextStyle14Black,),);
              })

      ),

    );
  }
}
