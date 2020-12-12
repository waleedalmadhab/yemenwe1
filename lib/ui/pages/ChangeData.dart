import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/screens/ChangeNameScreen.dart';
import 'package:yemenwe/ui/screens/ChangepasswordScreen.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
class ChangeData extends StatelessWidget {

  var type="pass";
  ChangeData({this.type});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(


        appBar: AppBar(backgroundColor: colors.primary,title: Text(type=="pass"?"تغيير كلمة المرور":"تعديل الاسم",style: Styles().consualtionStatiscNormalFont(fsize: 14,mcolor: Colors.white),),),

        body: type=="pass"?ChangepasswordScreen():ChangeNameScreen(),


      ),
    );
  }
}
