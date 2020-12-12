import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemenwe/constants/Constant.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/SearchPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';


class appBarItem extends StatelessWidget {

  var title;
  String type;
  appBarItem({this.title,this.type});

  @override
  Widget build(BuildContext context) {

    print("type $type");

    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
      //  borderRadius: BorderRadius.circular(20),
        color: colors.white
      ),
      child: Row(
        children: <Widget>[

          GestureDetector(
            onTap: (){

              Get.to(SearchPage(type: type,));

            },
            child: Container(
              width: 50,
height: 50,
alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                  color: colors.bg3

              ),
            //  margin: const EdgeInsets.all(10.0),
              child: Icon(CupertinoIcons.search,size: 30,),
            ),
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
            child: Text("$title",textAlign: TextAlign.right,style: Styles().consualtionStatisc(fsize: 18,mcolor: colors.black),),
          ))


        ],
      ),
    );
  }
}
