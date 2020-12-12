
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'file:///G:/flutter-projects/PrivateProjects/Me/yemenwe/lib/models/training/Content.dart';
import 'file:///G:/flutter-projects/PrivateProjects/Me/yemenwe/lib/models/training/Course.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/ContentPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/unitItem.dart';
import 'package:yemenwe/ui/widgets/unitItem2.dart';

import 'ExamPage.dart';

class MaterialPage extends StatelessWidget {

  Course course ;
  MaterialPage({this.course});


  @override
  Widget build(BuildContext context) {

    print(course);

    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(course.title,style: Styles().TitleTextStyle16White,),
      ),
      body: Container(
        color: Colors.white,

        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                  child:                             ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: course.titles.length!=null ?course.titles.length:0,
                      itemBuilder: (bc,lvelIndex)=>Card(
                    //    margin: EdgeInsets.symmetric(vertical: 0),
                        child: Column(
                          children: <Widget>[
                            (Container(
//decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: colors().grey))),

                              child: GestureDetector(
                                onTap: (){
                             //     Get.to(ContentPage(titles: course.titles[lvelIndex],));
                                },
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                    margin: EdgeInsets.only(left: 0,),

                                    child: Row(
                                      children: <Widget>[
                                        Container(

                                            margin: EdgeInsets.only(right: 5),
                                            child: Icon(  Icons.subdirectory_arrow_left,color: course.titles[lvelIndex].isComplete==1? colors.green2:colors.grey,)),

                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Text(course.titles[lvelIndex].title,style: Styles().TitleTextStyle16Black,overflow: TextOverflow.visible,),
                                          ),
                                        ),
                                        Container(

                                            margin: EdgeInsets.only(right: 5),
                                            child: Icon(  Icons.check_circle,color: course.titles[lvelIndex].isComplete==1? colors.green2:colors.grey,)),


                                      ],
                                    ),
                                  )

//                                ExpansionTile(
//                                    title: Container(
//                                  margin: EdgeInsets.only(left: 0,),
//
//                                  child: Row(
//                                    children: <Widget>[
//                                      Container(
//
//                                          margin: EdgeInsets.only(right: 5),
//                                          child: Icon(  Icons.check_circle,color: course.titles[lvelIndex].isComplete==1? colors().green2:colors().grey,)),
//
//                                      Expanded(
//                                        child: Container(
//                                          padding: const EdgeInsets.symmetric(horizontal: 10),
//                                          child: Text(course.titles[lvelIndex].title,style: Styles().TitleTextStyle16Black,overflow: TextOverflow.visible,),
//                                        ),
//                                      ),
//
//
//                                    ],
//                                  ),
//                                )
//
////                                  ,children:  course. titles[lvelIndex].contents!=null? course. titles[lvelIndex].contents.map((content) => Container(
////
////                                    child: GestureDetector(
////                                      onTap: (){
////
////                                        //     Get.to(DetailsPage(content: content,subjects: titles,outer: lvelIndex,inner:titles[lvelIndex].contents.indexOf(content) ,));
////                                        //  Get.to(ExpandableListView());
////
////                                      },
////                                      child: Container(
////                                        padding: EdgeInsets.only(left: 15,top: 15,bottom: 15),
////                                        margin: EdgeInsets.only(right: 50,
////                                        ),
////                                        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: colors().bg3))),
////                                        child: Directionality(
////                                          textDirection: TextDirection.rtl,
////                                          child: Row(
////                                            children: <Widget>[
////                                                Icon(Icons.chevron_right,color: colors().blueDark,),
////
////                                              Flexible(
////                                                child: Padding(
////                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
////                                                  child: Text(content.title,style: Styles().TitleTextStyle16Black,
////
////                                                  ),
////                                                ),
////                                              ),
////                                            ],
////                                          ),
////                                        ),
////
////                                      ),
////                                    ),
////
////                                  )).toList():[],
//                                ),
                                ),
                              ),

                            )),
//                            Container(
//                              margin: EdgeInsets.symmetric(horizontal: 20),
//                              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: colors().grey))),
//
//                            )
                          ],
                        ),
                      )
                  )

              ),
            ),
            GestureDetector(
              onTap: (){

                Get.to(ExamPage());

              },

              child: Container(height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.help_outline,color: Colors.white,),
                    Text("ابدأ الاختبار ",style: Styles().TitleTextStyle16White,)

                  ],

                ),
                color: colors.blue,
              ),
            )
          ],
        ),

      ),
    );
  }




}
