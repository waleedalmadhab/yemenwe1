import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/AddData.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/providers/ConsulationsProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/utils/SharedPref.dart';


enum ConsulationCats{

  Phsyco,Family,Problems,Law


}


class addConsulationPage extends StatefulWidget {
  @override
  _addConsulationPageState createState() => _addConsulationPageState();
}

class _addConsulationPageState extends State<addConsulationPage> {


  var cats=["نفسية","اجتماعية","صحية","قانونية"];


  InputBorder decoration(){


   return OutlineInputBorder(

     borderRadius: BorderRadius.circular(10),


  );

  }
  var selected=ConsulationCats.Phsyco;
var catId=1;

TextEditingController titleTextEditingController=TextEditingController();
TextEditingController bodyTextEditingController=TextEditingController();
  ProgressDialog pr;

  var title="";
  var body="";
dynamic selectedCat=1;
  @override
  Widget build(BuildContext context) {

    pr = ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
      textDirection: TextDirection.rtl,
      isDismissible: true,
      customBody: Container(
        padding: EdgeInsets.all(20),
        height: 120,
        //width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(colors.primary),
              backgroundColor: Colors.white,
            ),
            Text(""
                "جار إضافة الاستشارة"
                "",style: Styles().consualtionStatisc(fsize: 14,mcolor: colors.primary),)

          ],
        ),
      ),
    );
    pr.style(
//      message: 'Downloading file...',
      message:

      "جار   إضافة الاستشارة",
      borderRadius: 20.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progressWidgetAlignment: Alignment.center,

      messageTextStyle: Styles().consualtionStatisc(fsize: 14,mcolor: colors.primary),
    );
    var w=MediaQuery.of(context).size.width;

    return Scaffold(

      appBar: AppBar(title: Text("إضافة استشارة",style: Styles().TitleTextStyle16White,),backgroundColor: colors.primary,),
      body: Container(

        child: ListView(
          children: <Widget>[

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  controller: titleTextEditingController,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  onChanged: (t){
                  //  titleTextEditingController.text=t;

                    title=t;

                  },
                  decoration: InputDecoration(
                    hintText: "عنوان الاستشارة",
                    labelText: "عنوان الاستشارة",
                    border: decoration(),
                    focusedBorder: decoration(),
                    enabledBorder: decoration(),

                  ),

                ),
              ),

            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
textDirection: TextDirection.rtl,
                  onChanged: (b){
                 //   bodyTextEditingController.text=b;


                    body=b;
                  },
                  controller: bodyTextEditingController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "تفاصيل الاستشارة",
                    labelText: "تفاصيل الاستشارة",
                    border: decoration(),
                    focusedBorder: decoration(),
                    enabledBorder: decoration(),

                  ),

                ),
              ),

            ),


            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Text("نوع الاستشارة:",style: Styles().consualtionStatiscNormalFont(fsize: 14,mcolor:Colors.black ),),


Container(
  margin: EdgeInsets.symmetric(horizontal: 10),
  child:   FutureBuilder(

      future: getResponseData().getData(url: urls.AllCategories,),

      builder: (bc,snapshot){

  if(snapshot.data!=null) {

    try {

      var data = json.decode(snapshot.data.toString());

      var d = data['categories'] as List;

   //   selectedCat=d[0]['id'];



      print("selectedCat  =$selectedCat");

             return DropdownButton(

          value:selectedCat ,



          items: d.map((e) {



            return DropdownMenuItem(

                  value: e['id'],

                  child: Text(e['name'].toString()));



          }).toList(), onChanged: (val){



        setState(() {

          selectedCat=val;

  print(selectedCat);

        });



      });



    } catch (e) {}

  }



      else return CircularProgressIndicator();



      }),
)

                  ],
                ),
              ),
            )
,
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: (){

                    print(title);
                    print(body);
                    print(selectedCat);
if(title.length>3&&body.length>3) {
pr.show();

SharedPref().read( "user").then((user) {


  if(user!=null){
print(user['token']);


    AddData().addConsulation(title, body, selectedCat,user['token']).then((value) {

      pr.hide();
      title = "";
      body = "";
      titleTextEditingController.clear();
      bodyTextEditingController.clear();

      print(value);
      var msg=value.data["msg"];
      Provider.of<ConsulationsProvider>(context,listen: false).update();

      FlutterToast(context).showToast(child:
      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(.9)

          ),
          padding: EdgeInsets.all(10),
          child: Text(msg,style: Styles().consualtionStatisc(fsize: 14,mcolor: Colors.white),))
      );

    });





  }


});

}
else{

  FlutterToast(context).showToast(child:
  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(.9)

      ),
      padding: EdgeInsets.all(10),
      child:


      Text("يجب إدخال بيانات صحيحة",style: Styles().consualtionStatisc(fsize: 14,mcolor: Colors.white),)
  )

  );

}

                  },

                  child: Container(
                    //height: 50,
                    width: w/2,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    margin: EdgeInsets.only(right: 20,left: 20,top: 50),
                  child: Text("إرسال",style: Styles().consualtionStatiscNormalFont(fsize: 14,mcolor: Colors.white),),

                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(20)



                  ),
                  ),
                ),
              ],
            )

          ],


        ),

      ),


    );
  }
}
