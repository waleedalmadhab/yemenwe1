import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:yemenwe/models/training/Course.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/courseItemList.dart';
import 'package:yemenwe/utils/MQSize.dart';
class ViewMorePage extends StatelessWidget {

  ViewMorePage({this.coureses});

  List <Course> coureses=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),

      body: Container(

       child: ListView.builder(
           itemCount: coureses.length,
           itemBuilder: (bc,index)=>courseItemList(course: coureses[index],)),
      ),

    );
  }
}
