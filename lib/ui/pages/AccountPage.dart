import 'package:flutter/material.dart';
import 'package:yemenwe/constants/Constant.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/screens/LoginScreen.dart';
import 'package:yemenwe/ui/screens/RegisterScreen.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/utils/MQSize.dart';

class AccountPage extends StatefulWidget {

  var islogin=true;
  AccountPage({this.islogin=true});

  @override
  _AccountPageState createState() => _AccountPageState();
}


class _AccountPageState extends State<AccountPage> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.islogin?"تسجيل الدخول":"حساب جديد",style: Styles().TitleTextStyle16White,),
        backgroundColor: colors.primary,),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),

          children: <Widget>[

            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              height: 150,
              width: MQSize.width,
              child: Image.asset("images/newlogo.png",width: 100,height: 100,),),

widget.islogin?LoginScreen():RegisterScreen()
          ],
        ),
      ),


    );
  }
}
