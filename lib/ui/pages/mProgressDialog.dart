import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
//mProgressDialog

class mProgressDialog extends StatefulWidget {
  @override
  _mProgressDialogState createState() => _mProgressDialogState();
}

class _mProgressDialogState extends State<mProgressDialog> {

  var b=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(


        child: RaisedButton(onPressed: (){
          dialog(context);

          Future.delayed(Duration(seconds: 3),(){


            setState(() {
              b=true;
            });

          });

        }),

      ),
    );
  }


  Widget dialog(BuildContext context){


     showDialog(



       //  barrierDismissible:true ,
         context: context,builder: (bc)=>Container(
       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          // color: Colors.white
       ),
         height: 100,
           width: 100,
           child: SpinKitRipple(color: colors.brown,),
         ));


  }



}