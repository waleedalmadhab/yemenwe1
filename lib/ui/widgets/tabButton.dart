import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/utils/MQSize.dart';
class tabButton extends StatelessWidget {

  String title;
  bool selected=false;
  tabButton({this.title,this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MQSize.width,
      padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: selected? colors.primary:colors.white,
        borderRadius: BorderRadius.circular(5)
    ),
    child: Text(title,textAlign: TextAlign.center,style: Styles().consualtionStatisc(fsize: 12,mcolor:selected? colors.white:colors.grey),),
    );
  }
}
