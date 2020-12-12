import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/Issue.dart';
import 'package:yemenwe/models/training/Course.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/screens/FavConsulations.dart';
import 'package:yemenwe/ui/screens/FavWomenPosts.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/CourseItem.dart';
import 'package:yemenwe/ui/widgets/LoadingListShimmer.dart';
import 'package:yemenwe/ui/widgets/cosulationItem.dart';
import 'package:yemenwe/ui/widgets/courseItemList.dart';
import 'package:yemenwe/ui/widgets/issueItem.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';
class MyCourses extends StatefulWidget {

  var token="";
  MyCourses({this.token});

  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//     SharedPref().read( "user").then((value) {
//
//       //   print(value['token']);
//
//       getResponseData().getDataWithToken(url: urls().mylikes,token: widget.token,data: {"token":widget.token,"liked_id":21,"type":"trainings"}).then((res) {
//
//
//         print(res.data);
// //
// var d=res.data['data'] as List;
//
// d.forEach((element) {
//
//
// });
//
//         print(value);
//         //    Provider.of<ContentProvider>(context,listen: true).update();
//
//       });
//
//
//     });



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("دوراتي",style: Styles().TitleTextStyle16White,),backgroundColor: colors.brown,),

      body: FutureBuilder(

          future:getResponseData().getDataWithToken(url: urls.myTraining,token: widget.token,data: {"token":widget.token,"liked_id":21,"type":"trainings"}) ,

          builder: (bc,snapshot){
        if(snapshot.hasData){
          print(snapshot.data);

          List<Course> courses=[];
          var dd=json.decode(snapshot.data.toString())  ;
          var d=dd['Trainings']['data'] as List;

print(d);
          d.forEach((element) {

            var c=Course(
              id: element['id'],
              title: element['name'],
              type: element['type'],
              shortDescription: element['description'],
              start_date: element['start_at'],
              end_date: element['end_at'],
              length:  element['length'],
              category: element['category_id'].toString(),
              instractor: element['instructor'],
              img: element['thumbnail'],
              registered:  element['is_register']!=null?1:0,
              liked:  element['is_like']!=null?1:0,

            );

            courses.add(c);
          });


          return courses.length!=null&&courses.length>0?ListView.builder(
            itemCount: courses.length,

              itemBuilder: (bc,index)=>courseItemList(course: courses[index],)):Center(


            child: SpinKitFadingFour(color: colors.primary,),
          );

        }
        else
          {
            return Center(child: SpinKitFadingFour(color: colors.primary,),);
          }

      }),

    );
  }
}
