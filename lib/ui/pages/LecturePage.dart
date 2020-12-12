
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'file:///G:/flutter-projects/PrivateProjects/Me/yemenwe/lib/models/training/Titles.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/ExpandList.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/utils/IssueType.dart';
class LecturePage extends StatelessWidget {
  Titles title;
  LecturePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(title.title,style: Styles().TitleTextStyle16WhiteBold,),
      ),


      body: Container(

        child: ListView.builder(
            itemCount: title.title.length,
            itemBuilder: (bc,index)=>GestureDetector(
              onTap: (){

             //   Get.to(DetailsPage(content: level.lectures[index],));
                Get.to(ExpandableListView());

              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                margin: EdgeInsets.symmetric(horizontal: 20,
                ),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: colors.bg3))),
          child: Row(
              children: <Widget>[
              //  Icon(lecIcon(title.contents[index].issueType,),color: colors().blueDark,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(title.contents[index].title,style: Styles().TitleTextStyle16Black,),
                ),
              ],
          ),

        ),
            )),

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
