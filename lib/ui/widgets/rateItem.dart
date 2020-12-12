
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/utils/MQSize.dart';

class rateItem extends StatelessWidget {

  double persent=0.0;
 int  raters=0;
 int no=0;
  rateItem({this.persent,this.raters,this.no});


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
height: 15,
        child: Row(children: <Widget>[
          // Text("$no",style: Styles().consualtionStatisc(fsize: 10,mcolor: colors().black),),

          LinearPercentIndicator(
            isRTL: true,
            width: MQSize.width/2,
            lineHeight: 7.0,
            percent: persent,
            backgroundColor: Colors.grey[300],
            progressColor: colors.secondry,
          ),
          // Container(
          //    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 0),
          //     margin: EdgeInsets.all(1),
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       //  shape: BoxShape.circle,
          //         color: colors().white,
          //         // boxShadow:[
          //         //   BoxShadow(
          //         //     //  color: colors().grey,
          //         //   //    blurRadius: 1
          //         //   )
          //         //
          //         //
          //         // ]
          //
          //     ),
          //     child: Text("$raters",style: Styles().consualtionStatiscNormalFont(fsize: 8),)),

        ],),

      ),
    );
  }
}
