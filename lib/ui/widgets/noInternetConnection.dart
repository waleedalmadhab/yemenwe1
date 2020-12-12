import 'package:flutter/material.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
class noInternetConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Image.asset("images/no_internet.jpg",),

          Container(

              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text("لا يوجد اتصال بالإنترنت",style: Styles().consualtionStatisc(fsize: 16,mcolor: Colors.black),)),




        ],
      ),
    );
  }
}
