import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/constants/Constant.dart';
import 'package:yemenwe/models/training/Course.dart';
import 'package:yemenwe/models/training/SubjectCats.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/providers/TrainingProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/MaterialPage.dart';
import 'package:yemenwe/ui/pages/TitlesPage.dart';
import 'package:yemenwe/ui/pages/ViewMorePage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/CourseItem.dart';
import 'package:yemenwe/ui/widgets/appBarItem.dart';
import 'package:yemenwe/ui/widgets/noInternetConnection.dart';
import 'package:yemenwe/ui/widgets/subjectItem.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';
import 'package:yemenwe/utils/gridWidth.dart';
import 'package:yemenwe/utils/internetConnection.dart';
class TrainingScreen extends StatelessWidget {

  //List<Course> courses=[];
  List<SubjectCats> cats=[];

  @override
  Widget build(BuildContext context) {
    Provider.of<TrainingProvider>(context,listen: false).update();

    var items2=Course().getSubjects();

var w=MediaQuery.of(context).size.width;


    return Container(
height: MediaQuery.of(context).size.height,
        color: colors.white,


        child:FutureBuilder(
initialData: false,
            future: InternetConnection.instance.isConnected(),
            builder: (bc,connected){

            return connected.data!=null &&connected.data? FutureBuilder(

            future: getResponseData().getDataWithToken(url: urls.ShowsubjectCategories,token: TokenProvider.token,data:{"token":TokenProvider.token,"type":"trainings"}),
            builder: (bc,snapshot){
               print(snapshot.data);
//print(urls().trainings);
              var d = jsonDecode(snapshot.data.toString());

                try {
                  //         print(snapshot.data);
                  //   print(d);
                  var dd = d["Trainings"] as List;
                  if(d['status']==true) {

    print(dd);
                  cats.clear();
                  dd.forEach((element) {
                    List <Course> courses = [];

                    var t = element['trainings'] as List;

                    t.forEach((cours) {
                      var like = cours['is_like'] != null ? 1 : 0;

                      Course course = Course(
                        id: cours['id'],
                        instractor: cours['instructor'] != null
                            ? cours['instructor']
                            : "",
                        title: cours['name'],
                        img: cours['thumbnail'],
                        registered: element['is_register'] != null ? 1 : 0,
                        liked: like,
                        //  featured: cours['featured'],
                        type: cours['type'],
                        start_date: cours['start_at'],
                        end_date: cours['end_at'],
                        length: cours['length'],
                        ratecount: cours['count_rating'],
                        rateaverage: cours['average_rating'],
                        shortDescription: cours['description'] != null
                            ? cours['description']
                            : "",


                      );

                      courses.add(course);
                    });
                    courses.forEach((element) {


                    });


                    var cat = SubjectCats(
                        id: element['id'],
                        name: element['name'],
                        courses: courses


                    );


                    if (cat.courses.length > 0) {
                      cats.add(cat);
                    }
                  });}
                  else{
                    return Center(

                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[



                            GestureDetector(
                              onTap: (){
                                Provider.of<TrainingProvider>(context,listen: true).update();

                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),

                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)

                                    ,color: colors.primary
                                ),

                                child: Text(" أعد المحاولة",style: Styles().consualtionStatisc(fsize: 14,mcolor: Colors.white),),
                              ),
                            )
                            ,


                          ],
                        ),
                      ),
                    );
                  }

                } catch (e) {}

              return  cats.length!=null&&cats.length>0? Container(
                color: colors.white,
                child: Column(
                  children: <Widget>[
                    appBarItem(title: "التدريب",type: Constant().search_training,),

                    Expanded(
                      child: SingleChildScrollView(


                        child: ListView.builder(

                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),

                            itemCount: cats.length!=null ?cats.length:0,itemBuilder: (bc,outIndex)=>Container(
                         // margin: EdgeInsets.all(5),
                        //  height: 370,

                          child:
                          Card(
                            margin: EdgeInsets.only(top: 1,bottom: 10,right: 0,left: 0),
                            child: Container(
                              decoration: BoxDecoration(border: Border.all(width: 1,color: colors.bg3.withOpacity(.5))),
                              //    margin: EdgeInsets.all(5),
                              child: Wrap(
                                children: <Widget>[
                                  Container(
                                    width:w ,
                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                    decoration: BoxDecoration(
                                        color: colors.bg3.withOpacity(.5),
                                        borderRadius: BorderRadius.circular(2)
                                    ),

                                    child: Row(
                                      children: <Widget>[
                                        GestureDetector(

                                          onTap: (){

                                            Get.to(ViewMorePage(coureses:cats[outIndex].courses ,));

                                          },

                                          child: Card(
                                            elevation: 10,
                                            margin: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                                              //height: 25,width: 50,
                                              alignment: Alignment.center,

                                              child: Text("عرض الكل >>",textDirection: TextDirection.rtl,style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.blueDark),),

                                            ),
                                          ),
                                        ),

                                        Expanded(child
                                            : Text("${cats[outIndex].name}",textAlign: TextAlign.right ,style: Styles().TitleTextStyle16BlackBold,)),
                                      ],
                                    ),

                                  ),



                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: GridView.builder(
                                    //  scrollDirection: Axis.horizontal,

                                        physics: NeverScrollableScrollPhysics(),

                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                                        crossAxisCount: 2,
                                        childAspectRatio: gridWidth().aspectRatio(width: w,count: 2,height: 350)


                                      ),
                                        shrinkWrap: true,
                                      //  scrollDirection: Axis.horizontal,
                                        itemCount:cats[outIndex].courses.length >5 ?6 :cats[outIndex].courses.length ,itemBuilder: (bc,inIndex)=>Container(

                                      // width: 200,
                                      child: inIndex==5? GestureDetector(

                                        onTap: (){

                                          Get.to(ViewMorePage(coureses:cats[outIndex].courses ,));

                                        },

                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Card(
                                              elevation: 10,
                                              margin: EdgeInsets.symmetric(vertical: 25,horizontal: 10),
                                              child: Container(height: 100,width: 150,
alignment: Alignment.center,

                                              child: Text("عرض الكل >>",textDirection: TextDirection.rtl,style: Styles().consualtionStatisc(fsize: 18,mcolor: colors.blueDark),),

                                              ),
                                            ),
                                          ],
                                        ),
                                      ) :GestureDetector(
                                          onTap: (){

                                            Get.to(TitlesPage(
                                              course: cats[outIndex].courses[inIndex]
                                              , token:  TokenProvider.token,));

                                          // print(  cats[outIndex].courses[inIndex].id);
                                          //   //    try {

                                            //    }catch(e){}
                                          },

                                          child: CourseItem(  course: cats[outIndex].courses[inIndex],)),
                                    )),
                                  )


                                ],
                              ),
                            ),
                          ),

                        )),

                      ),
                    ),
                  ],
                ),


              ):Center(child:
              SpinKitRipple(color: colors.blueDark,),
                // Text("")
              );

            },):Center(

              child: noInternetConnection(),
          );

        })
    );
  }


//  cats1(){
//
//    return Container(
//
//        color: Color(0xfff5f5f5),
//
//
//        child: FutureBuilder(
//
//          future: getResponseData().getData(url: urls().trainings),
//          builder: (bc,snapshot){
//            print(snapshot.data);
//            print(urls().trainings);
//
//            try {
//              print(snapshot.data);
//              var d = jsonDecode(snapshot.data.toString());
//              //   print(d);
//              var dd = d["Trainings"]['data'] as List;
//              //print(dd);
//              courses.clear();
//              dd.forEach((element) {
//
//                List <Titles> titles=[];
//
//
//                var t=element['titles'] as List;
//
//                t.forEach((el) {
//
//                  var c=el['contents'] as List;
//
//
//                  List <Content> contents=[];
//                  c.forEach((cont) {
//
//
//                    var content=Content(
//
//                      id: cont['id'],
//                      title: cont['title'],
//                      text: cont['body'],
//                      img: cont['image'],
//                      book: cont['book'],
//                      sound: cont['sound']
//                      ,
//                      video: cont['video_url'],
//
//
//
//
//
//                    );
//
//                    print(content.sound);
//                    contents.add(content);
//                  });
//
//
//
//
//
//                  var ti=Titles(
//                      id: el['id'],
//                      title: el['name'],
//                      isComplete: el['isCompleted'],
//                      contents: contents
//
//                  );
//                  titles.add(ti);
//
//
//                });
//                print(titles.length);
//
//
//                Course course=Course(
//                    id: element['id'],
//                    title: element['name'],
//                    img: element['thumbnail'],
//                    start_date: element['start_at'],
//                    end_date: element['end_at'],
//                    category: element['subject']['name'],
//                    length: element['length'],
//                    titles: titles
//
//                );
//                courses.add(course);
//              });
//
//
//
//
//            }catch(e){}
//            return  courses.length!=null&&courses.length>0? AnimationLimiter(
//
//                child: ListView.builder(itemCount: courses.length,itemBuilder: (bc,index)=>AnimationConfiguration.staggeredList(
//                    duration: const Duration(milliseconds: 1000),
//
//
//                    child: SlideAnimation(
//                        verticalOffset: 50.0,
//
//                        child: FlipAnimation(child: GestureDetector(
//
//                            onTap: (){
//
//                              Get.to(MaterialPage(course: courses[index],));
//                            },
//                            child: subjectItem(subject:courses[index] ,))))))):Center(child:
//            SpinKitRipple(color: colors().blueDark,),
//              // Text("")
//            );
//
//          },)
//    );
//  }

}
