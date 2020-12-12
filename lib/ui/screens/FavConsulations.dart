
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/constants/Constant.dart';
import 'package:yemenwe/models/consulation/Comment.dart';
import 'package:yemenwe/models/consulation/Consulation.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/widgets/LoadingListShimmer.dart';
import 'package:yemenwe/ui/widgets/cosulationItem.dart';
import 'package:yemenwe/utils/SharedPref.dart';
class FavConsulations extends StatelessWidget {

  List<Consulation> consulations = [];
var token="";
FavConsulations({this.token});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getResponseData().getDataWithToken(url: urls.mylikes,token: "$token",data: {"token":token,"type":"posts"}),
        builder: (bc, snapshot) {
            print("***************************************");
            print(snapshot.data);

          try {
            var d = jsonDecode(snapshot.data.toString());
            //   print(d);
            var dd = d['data'] as List;
            consulations.clear();
            dd.forEach((element) {

              List<Comment> comments = [];

              var c = element['post']["comments"] as List;
              c.forEach((el) {
                //   print(c.length);
                Comment com = Comment(
                  id: el['id'],
                  msg: el['body'],
                  date: el['published'],
                  type: el['is_consonant'] != 1 ? "مستخدم" : "استشاري",
                );

                comments.add(com);
              });
              print(comments.length);

//              print(element["category"]["name"]);
              var i = Consulation(
                id: element['post']['id'],
                title: element['post']["title"],
                type: element['post']["category"]["name"],
                cat: element['post']["category"]["id"],
                description: element['post']["body"],
                date: element['post']["published"],
                fav: element['post']["user_like"]!=null ?1:0,
                img: "images/logo.png",
                comments: comments,
              );

              consulations.add(i);
            });

            //  print(dd);
          } catch (e) {}
//            return Center(child: LoadingListShimmer(),);
          return consulations.length != null && consulations.length > 0
              ? Container(
              color: Color(0xfffafafa),
              child: AnimationLimiter(
                  child: Stack(
                    children: <Widget>[
                      ListView.builder(
                          itemCount: consulations.length,
                          itemBuilder: (bc, index) =>
                              AnimationConfiguration.staggeredList(
                                  duration: const Duration(milliseconds: 1000),
                                  child: SlideAnimation(
                                      horizontalOffset: 50.0,
                                      child: FadeInAnimation(
                                          child: consulationItem(
                                            consulation: consulations[index],
                                          ))))),
                    ],
                  )))
              : Center(
            child: LoadingListShimmer(),
          );
        });
  }
}
