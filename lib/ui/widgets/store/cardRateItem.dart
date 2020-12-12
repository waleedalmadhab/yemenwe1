import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemenwe/models/Rate.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/spaceItem.dart';
import 'package:yemenwe/utils/MQSize.dart';
class cardRateItem extends StatelessWidget {
  dynamic rate;

  cardRateItem({this.rate});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),

      child: Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: colors.grey))),
        child: Column(
          children: <Widget>[

            Container(height: 20,
margin: EdgeInsets.symmetric(vertical: 5),
            child: Row(children: <Widget>[
              Icon(Icons.star,color: Colors.amber,size: 15,),
              Text(rate['rating'].toString(),style: Styles().consualtionStatiscNormalFont(fsize: 10),),

            ],),

            ),
            Row(children: <Widget>[

              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(rate['user_name'],textAlign: TextAlign.right,style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.black),),
              )),
              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(rate['published'],textAlign: TextAlign.left,style: Styles().consualtionStatiscNormalFont(fsize: 10,mcolor: colors.grey),),
              )),

            ],),
            Container(
              width: MQSize.width,
              padding: EdgeInsets.all(10),

              child: Text(rate['message'],textAlign: TextAlign.right,style: Styles().consualtionStatiscNormalFont(fsize: 10),),
            )


          ],
        ),
      ),

    );
  }
}
