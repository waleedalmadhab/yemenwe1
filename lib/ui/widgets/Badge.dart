import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
class Badge extends StatelessWidget {

  Widget child;
  int count=0;

  Badge({this.child,this.count});
  Future<double> get _height => Future<double>.value(100);

  @override
  Widget build(BuildContext context) {
    return Stack(

      overflow: Overflow.visible,
      children: <Widget>[

      child,

      Positioned(
        top: -5,
        right: -5,
        child:   count>0? Container(
          padding: EdgeInsets.all(3),
decoration: BoxDecoration(
  shape: BoxShape.circle,
  color: colors.red1,

),
         // radius: 8,
          //  radius: 20,
            child: Text(count.toString(),style: Styles().consualtionStatiscNormalFont(fsize: 8,mcolor: colors.white),)):Container(),
      )



    ],);
  }
}
