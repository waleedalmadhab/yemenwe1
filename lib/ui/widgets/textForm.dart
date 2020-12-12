import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
class textForm extends StatelessWidget {
  TextEditingController controller;
  bool ispassword=false;
  bool isnumber=false;
  IconData icon;
  String title;
  textForm({this.controller,this.icon,this.title,this.isnumber=false,this.ispassword=false});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
      child: Container(
        height: 70,
        decoration: BoxDecoration(color: colors.white,borderRadius: BorderRadius.circular(5)),
        //  margin: EdgeInsets.all(10),
          child
          : Container(
            padding: EdgeInsets.symmetric( horizontal: 10,),


            child: Column(
          children: <Widget>[
            Container(
              height: 25,
             padding: EdgeInsets.only(top: 5,),
              child: Row(children: <Widget>[

                Icon(icon,size: 20,color: colors.primary,),
                Container(width: 10,),
                Text(title,style: Styles().consualtionStatisc(fsize: 10,mcolor: colors.primary),)

              ],),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 30),
                child: TextFormField(
obscuringCharacter: '*',
                  decoration: InputDecoration(

                    border: InputBorder.none,
                    hintStyle: Styles().consualtionStatiscNormalFont(fsize: 12,mcolor: colors.grey),
                    hintText: title
                  ),
                  controller: controller,
                  obscureText: ispassword,

                  keyboardType: isnumber? TextInputType.number: TextInputType.text,
                  inputFormatters: [
                    isnumber ?WhitelistingTextInputFormatter.digitsOnly:BlacklistingTextInputFormatter.singleLineFormatter
                  ],


                ),
              ),
            )
          ],
        ),

      )),
    );
  }
}
