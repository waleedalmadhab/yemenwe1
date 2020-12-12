import 'package:flutter/material.dart';
class Page2 extends StatelessWidget {

  String img="";
  Page2({this.img});

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF41B578),
        //  title: Text(""),
        ),
        body: Hero(
          tag: "$img",
          child:   ClipRRect(

                            borderRadius: BorderRadius.only(topRight: Radius.circular(2),topLeft: Radius.circular(2)),
                            child: Image.asset(img,width: w,height: 500,fit: BoxFit.fill,)),
        ));
  }
}