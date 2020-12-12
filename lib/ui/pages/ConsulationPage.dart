
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/AddData.dart';
import 'package:yemenwe/models/consulation/Consulation.dart';
import 'package:yemenwe/providers/ConsulationsProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';

class ConsulationPage extends StatelessWidget {

  ConsulationPage({this.consulation});

  TextEditingController textEditingController=TextEditingController(

  );
  Consulation consulation;

  var body="";
  ProgressDialog pr;

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
                "جار إضافة الرد"
                "",style: Styles().consualtionStatisc(fsize: 14,mcolor: colors.primary),)

          ],
        ),
      ),
    );
    pr.style(
//      message: 'Downloading file...',
      message:
      "جار   إضافة الرد",
      borderRadius: 20.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progressWidgetAlignment: Alignment.center,

      messageTextStyle: Styles().consualtionStatisc(fsize: 14,mcolor: colors.primary),
    );

    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text(consulation.title,style: Styles().consualtionStatisc(fsize: 14,mcolor: colors.white),),backgroundColor: colors.primary,),
      body: Container(
color: colors.bg3,

        child: Column(
          children: <Widget>[
            Expanded(

              child: SingleChildScrollView(

                child: Column(

                  children: <Widget>[

                    Card(
                      child: Container(
                        width: w,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Wrap(
                        children: <Widget>[
                          Container(
                              width: w,
                              child: Text(consulation.title,textAlign: TextAlign.center,style: Styles().consualtionStatisc(fsize: 14,mcolor: Colors.black),)),
                          Text(consulation.description,textAlign: TextAlign.center,style: Styles().consualtionStatiscNormalFont(fsize: 14,mcolor: Colors.black),),
//                          Container(
//                            decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: Colors.grey))),
//
//                            height: 40,
//
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: <Widget>[
//
//                                Expanded(child: Icon(Icons.share,color: Colors.grey,size: 20,)),
//                                Expanded(child: Icon(  consulation.fav==0 ? Icons.favorite_border:Icons.favorite,color:consulation.fav!=0 ?colors().orange: Colors.grey,size: 20,)),
//                                Expanded(
//                                    flex: 4,
//                                    child: Align(
//                                      alignment: Alignment.centerRight,
//                                      child:
//                                      Directionality(
//                                        textDirection: TextDirection.rtl,
//                                        child: Row(
//                                          mainAxisSize: MainAxisSize.max,
//                                          children: <Widget>[
//
//                                            Icon(Icons.local_offer,color: Colors.black54,),
//
//                                            Padding(
//                                              padding: const EdgeInsets.symmetric(horizontal: 10),
//                                              child: Text(consulation.type,style: Styles().consualtionStatisc(mcolor: colors().orange,fsize: 10),),
//                                            ),
//
//                                            Text(consulation.date,textDirection: TextDirection.ltr,style: Styles().consualtionStatisc(mcolor: Colors.grey,fsize: 8),),
//
//                                          ],),
//                                      ),
//                                    )),
//
//
//                              ],
//
//                            ),),
                        ],
                      ),
                      ),
                    )

                    ,


                    ListView.builder(

                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: consulation.comments.length,itemBuilder: (bc,index)=>Container(

alignment: consulation.comments[index].type!="استشاري"?  Alignment.centerRight:Alignment.centerLeft,

                          child: Column(


                            children: <Widget>[
                              Card(
margin: EdgeInsets.all(5),
                                child: Container(

                                     width: w,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                          width: w,
                                        padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
//border: Border(bottom: BorderSide(width: 1,color: colors().orange)),
                                            //  color:consulation.comments[index].type!="الاستشاري"? colors().orange.withOpacity(0.7):colors().green2,

                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                                    width: w,
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(consulation.comments[index].date,style: Styles().consualtionStatiscNormalFont(fsize: 10,mcolor: Colors.black),)),
                                              ),


                                              Expanded(child
                                                  : Directionality(
                                                textDirection: TextDirection.rtl,
                                                    child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Icon(Icons.account_circle)
,
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                                          child: Text(consulation.comments[index].type,style: Styles().consualtionStatisc(fsize: 12,mcolor: Colors.black),textAlign: TextAlign.right,),
                                                        ),

                                                      ],
                                                    ),
                                                  )),
                                            ],
                                          )),
                                      Divider(
                                        color: colors.primary,
                                        height: 1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(30.0),
                                        child: Text(consulation.comments[index].msg,style: Styles().TitleTextStyle14Black,textAlign: TextAlign.center,),
                                      ),
                                    ],
                                  ),
                                ),

                    ),
                            ],
                          ),
                        ))

                  ],


                ),
              ),
            ),
Container(
  color: colors.primary,
  child:   Directionality(
    textDirection: TextDirection.rtl,
    child: ExpansionTile(
trailing: Icon(Icons.keyboard_arrow_down,color: Colors.white,),
    //  backgroundColor: colors().orange,



      title:             Container(

        height: 50,

        color: colors.primary,

        child:

        Row(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            Icon(FrinoIcons.f_chat_text,color: Colors.white,size: 30,),

            Padding(

              padding: const EdgeInsets.all(8.0),

              child: Text("رد",style: Styles().TitleTextStyle16White,),

            ),

          ],

        )

    )



        ,

      children: <Widget>[



        Container(
          constraints: BoxConstraints(maxHeight: 200,minHeight: 60),
      //  height: 60,
          padding: EdgeInsets.symmetric(vertical: 10),
          color: colors.bg3,

        child: Directionality(

          textDirection: TextDirection.rtl,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),


                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
                        //     keyboardType: TextInputType.multiline,
                        //    expands: true,
                        maxLines: null,
textAlign: TextAlign.right,
textDirection: TextDirection.rtl,
controller: textEditingController,
                        onChanged: (value){

body=value;
                       //   textEditingController.text=value;

                        },
                        style: Styles().consualtionStatisc(fsize: 14,mcolor: Colors.black87),

                        decoration: InputDecoration(

                            border: InputBorder.none,
                            hintText: "اكتب رسالتك",hintStyle: Styles().consualtionStatisc(fsize: 12,mcolor: colors.grey),

                        ),

                      ),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){

                //  print(textEditingController.text);

                  if(body.length>3) {


                    SharedPref().read( "user").then((user) {


                      if( user!=null&& user['token']!=""){


var token=user['token'];

//print(token);
                        pr.show();

                        AddData().addReplyConsulation( textEditingController.text, consulation.id,token).then((value) {

textEditingController.clear();
pr.hide();
//                          print(value);
                          var msg=value.data["msg"];

                          Provider.of<ConsulationsProvider>(context,listen: false).update();

                          mToast().show(context,msg: msg,color: Colors.black);


                        });





                      }


                    });

                  }
                  else{

                    mToast().show(context,msg: "يجب إدخال بيانات صحيحة",color: Colors.black);


                  }


                },

                child: Card(

       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
       child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Icon(Icons.send,color: colors.primary,size: 30,),
       ),),
              )
     ,

            ],
          ),
        ),

        )



      ],

    ),
  ),
)
          ],
        ),




      ),
    );
  }
}
