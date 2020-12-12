
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';

class mToast{


  show(BuildContext context,{String msg,Color color= const Color(0xff593c97)}){



    FlutterToast(


        context).showToast(
        toastDuration: Duration(seconds: 4),
        child: Container(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)

          ,color: color

      ),
      child: Text("$msg",textAlign: TextAlign.center,style: Styles().consualtionStatisc(fsize: 12,mcolor: Colors.white),),




    ));



  }


}