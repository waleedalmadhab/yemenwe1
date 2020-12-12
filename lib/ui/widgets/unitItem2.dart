
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:yemenwe/models/training/Course.dart';
import 'package:yemenwe/models/training/Titles.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/DetailsPage.dart';
import 'package:yemenwe/ui/pages/ExamPage.dart';
import 'package:yemenwe/ui/pages/LecturePage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/utils/IssueType.dart';

class unitItem2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
   // var titles=Chapter().getTitles();
    List<Titles> titles=[];

Course course;

print(course);

    return Container(
      color: Colors.white,

      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child:                             ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: course.titles.length!=null ?course.titles.length:0,
                  itemBuilder: (bc,lvelIndex)=>Column(
                    children: <Widget>[
                      (Container(
//decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: colors().grey))),

                        child: GestureDetector(
                          onTap: (){
                               //Get.to(LecturePage(level: titles[lvelIndex],));
                          },
                          child: ExpansionTile(title: Container(
                            margin: EdgeInsets.only(left: 0,),

                            child: Row(
                              children: <Widget>[
                                Container(

                                    margin: EdgeInsets.only(right: 5),
                                    child: Icon(  Icons.check_circle,color: course.titles[lvelIndex].isComplete==1? colors.primary:colors.grey,)),

                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(course.titles[lvelIndex].title,style: Styles().TitleTextStyle16Black,overflow: TextOverflow.visible,),
                                  ),
                                ),
                              ],
                            ),
                          )

                            ,children:course. titles[lvelIndex].contents.map((content) => Container(

                              child: GestureDetector(
                                onTap: (){

                             //     Get.to(DetailsPage(content: content,subjects: titles,outer: lvelIndex,inner:titles[lvelIndex].contents.indexOf(content) ,));
                                  //  Get.to(ExpandableListView());

                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 15,top: 15,bottom: 15),
                                  margin: EdgeInsets.only(left: 30,
                                  ),
                                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: colors.bg3))),
                                  child: Row(
                                    children: <Widget>[
                                    //  Icon(lecIcon(content.issueType,),color: colors().blueDark,),

                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Text(content.title,style: Styles().TitleTextStyle16Black,

                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                ),
                              ),

                            )).toList(),
                          ),
                        ),

                      )),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: colors.grey))),

                      )
                    ],
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
            color: colors.primary,
            ),
          )
        ],
      ),

    );
  }

  IconData lecIcon(IssueType issueType){

    switch(issueType) {
      case IssueType.book:
        return Icons.library_books;
        break;
      case IssueType.sound:
        return Icons.library_music;
        break;
      case IssueType.video:
        return Icons.video_library;
        break;


    }



  }

}
