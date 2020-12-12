import 'package:flutter/material.dart';
import 'package:yemenwe/models/store/Space.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/utils/MQSize.dart';

class cardSpaceItem extends StatelessWidget {
  Space space;
  cardSpaceItem({this.space});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

child: Container(
  padding: EdgeInsets.symmetric(horizontal: 10),

alignment: Alignment.center,

child: Column(
  children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
        //  width: MQSize().width,
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 1),

          color: colors.primary,
              child: Text(space.parent,style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.white),)),
        ),
        Expanded(
flex: 3,
            child: Container(
                alignment: Alignment.center,
                child: Text(space.name,style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.black),))),
  ],
),

),

    );
  }
}
