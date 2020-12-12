

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/providers/ContentProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/ChangeData.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/dialogs.dart';
import 'package:yemenwe/utils/SharedPref.dart';

class ProfilePage extends StatelessWidget {



  var id=1;
  var type=0;
  var info=false;
  ProfilePage({this.id,this.type,this.info});


  Widget myInfo({double w,BuildContext context}){

    return Container(

      child: ListView(children: <Widget>[

        Container(
          child: Row(
            children: <Widget>[

              GestureDetector(

                onTap: (){

                  Get.to(ChangeData(type: "name",));
                },

                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 20
                  ),
                  decoration: BoxDecoration(border: Border.all(width: 2,color: colors.brown)

                      ,borderRadius: BorderRadius.circular(5)
                  ),
                  child: Text("تعديل",textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: Styles().consualtionStatisc(fsize: 14,mcolor: colors.brown),),

                ),
              ),
              Expanded(child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("معلوماتي",textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: Styles().consualtionStatisc(fsize: 16,mcolor: Colors.black87),),

              )),
            ],
          ),

        ),

        Container(
          width: w,
          decoration: BoxDecoration(

            //color: mColors().primaryColor,
              border: Border(bottom: BorderSide(width: 2,color: Colors.grey[300]))),
          margin: EdgeInsets.all(10),
          child: Column(

            children: <Widget>[


              Row(
                children: <Widget>[
                  Expanded(child: Text("الاسم:",textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: Styles().consualtionStatiscNormalFont(fsize: 14,mcolor: Colors.black87),)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child:
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        FutureBuilder(
                          initialData: {"name":"","phone":""},
                          future: SharedPref().read("user" ),
                          builder: (context,snapshot)=>Container(

                              child: Text("${ snapshot.data['name']!=null? snapshot.data['name'].toString():""}",textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: Styles().consualtionStatisc(fsize: 16,mcolor: Colors.black87))),


                        )                  ),
                  ),
                ],
              ),



            ],



          ),

        ),
        Container(
          width: w,
          decoration: BoxDecoration(

            //color: mColors().primaryColor,
              border: Border(bottom: BorderSide(width: 2,color: Colors.grey[300]))),
          margin: EdgeInsets.all(10),
          child: Column(

            children: <Widget>[


              Row(
                children: <Widget>[
                  Expanded(child: Text("رقم الهاتف:",textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: Styles().consualtionStatiscNormalFont(fsize: 14,mcolor: Colors.black87))),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder(
                        initialData: "",
                        future: SharedPref().read("user"),
                        builder: (context,snapshot)=>Container(

                            child: Text("${ snapshot.data['phone']!=null? snapshot.data['phone'].toString():""}",textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: Styles().consualtionStatisc(fsize: 16,mcolor: Colors.black87),)),


                      ),


                    ),
                  ),
                ],
              ),

            ],

          ),

        ),
        Container(
          width: w,
          decoration: BoxDecoration(

            //color: mColors().primaryColor,
              border: Border(bottom: BorderSide(width: 2,color: Colors.grey[300]))),
          margin: EdgeInsets.all(10),
          child: Column(

            children: <Widget>[


              Row(
                children: <Widget>[
                  Expanded(child: Text("معلومات الأمن:",textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: Styles().consualtionStatiscNormalFont(fsize: 14,mcolor: Colors.black87),)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Container()),


                  GestureDetector(
                    onTap: (){
                      //dialogs().ChangeUserPasswordDialog(context);
                      Get.to(ChangeData(type: "pass",));
                    },

                    child: Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(horizontal: 20
                      ),
                      decoration: BoxDecoration(border: Border.all(width: 2,color: colors.brown)

                          ,borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text("تغيير كلمة المرور",textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: Styles().consualtionStatisc(fsize: 16,mcolor: colors.primary),),

                    ),
                  ),
                ],
              ),



            ],



          ),

        ),



      ],),

    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ContentProvider>(context,listen: true).update();
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text( info?"معلوماتي الشخصية": "استشاراتي",style: Styles().TitleTextStyle16White,),backgroundColor: colors.brown,),
      body: Container(
        color: colors.bg3,
        child: info?myInfo(w: w,context: context) : Container(),

      ),
    );
  }






}
