import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/constants/Constant.dart';
import 'package:yemenwe/models/Issue.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/IssuePage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/LoadingListShimmer.dart';
import 'package:yemenwe/ui/widgets/issueItem.dart';
import 'package:yemenwe/ui/widgets/noInternetConnection.dart';
import 'package:yemenwe/utils/internetConnection.dart';
class WomanIssueScreen extends StatelessWidget {

  List<Issue> issues=[];


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(

      future: InternetConnection.instance.isConnected(),
      builder: (bc,snapshot){



        return  snapshot.data!=null &&snapshot.data?  Container(


            color: colors.white,




            child: IssuePage()):Center(

          child: noInternetConnection(),
        );

      },

    );
    }
}




/*




    return FutureBuilder(

      future: getResponseData().getData(url: urls().allWissuse),
      builder: (bc,snapshot){
try {
   //  print(snapshot.data);
  var d = jsonDecode(snapshot.data.toString());
  //print(d);
  var dd = d["Posts"]['data'] as List;
 // print(dd);
  dd.forEach((element) {
    var i = Issue();
    i.id = element['id'];
    i.title = element['title'];
    i.details = element['body'] == null ? " " : element['body'];
    i.img = element['image'] == null ? " " : element['image'];
    i.book = element['book'] == null ? " " : element['book'];
    i.sound = element['sound'] == null ? " " : element['sound'];
    i.ext_book = element['book_external_link'] == null ? " " : element['book_external_link'];
    i.video = element['video_url'] == null ? " " : element['video_url'];
//  i.img=element['image'];
//  i.book=element['book'];
//  i.sound=element['sound'];
//  i.video=element['video_url'];
    i.date = element['published'];

    issues.add(i);
  });

//  issues.forEach((element) {
//  //  print(element.title);
//  });
}catch(e){}


        return  issues.length!=null &&issues.length>0?  Container(

            color: Color(0xfffafafa),




            child: IssuePage()):Container();

      },

    );





 */


