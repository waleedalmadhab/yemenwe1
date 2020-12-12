
import 'package:flutter/material.dart';

class unitItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

//    var w=MediaQuery.of(context).size.width;
//    var units=Chapter().getChapters();
//
//
//    return Container(
//      color: Colors.white,
//
//      child: SingleChildScrollView(
//        child: ListView.builder(
//            itemCount: units.length,
//            shrinkWrap: true,
//            physics: NeverScrollableScrollPhysics(),
//
//            itemBuilder: (bc,unitIndex)=>
//
//
//
//                Container(
//                //  margin: EdgeInsets.only(top: 2),
//          child: Column(
//            children: <Widget>[
//
//              Container(
//                child: Container(
//                  width: w,
//                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
//                  decoration: BoxDecoration(
//                    //  color: colors().bg3,
//                    border: Border(top: BorderSide(width: 1,color: colors().bg3)),
//                    //  borderRadius: BorderRadius.circular(2)
//                  ),
//
//                  child: Text(units[unitIndex].title,textAlign: TextAlign.left ,style: Styles().issueItemText(fsize: 13),),
//
//                ),
//              ),
//
//
//              ListView.builder(
//                  shrinkWrap: true,
//                  physics: NeverScrollableScrollPhysics(),
//                  itemCount: units[unitIndex].levels.length,
//                  itemBuilder: (bc,lvelIndex)=>(Container(
//
//
//
//                child: GestureDetector(
//                  onTap: (){
//                    Get.to(LecturePage(level: units[unitIndex].levels[lvelIndex],));
//                  },
//                  child: Container(
//                    margin: EdgeInsets.symmetric(horizontal: 20,),
//                    decoration: BoxDecoration(
//                      border: Border(bottom: BorderSide(width: ((units[unitIndex].levels.length-1)==lvelIndex)?0:1,color: colors().bg3))
//                    ),
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Text(units[unitIndex].levels[lvelIndex].title,style: Styles().TitleTextStyle16Black,),
//                    ),
//                  ),
//                ),
//
//              )))
//
//
//
//            ],
//          ),
//
//
//
//
//        )),
//      ),
//
//    );
  }
}
