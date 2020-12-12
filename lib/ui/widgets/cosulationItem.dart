import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:get/get.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/consulation/Consulation.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/ConsulationPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';
import 'package:yemenwe/utils/launcher.dart';

class consulationItem extends StatefulWidget {
  Consulation consulation;

  consulationItem({this.consulation});

  @override
  _consulationItemState createState() => _consulationItemState();
}

class _consulationItemState extends State<consulationItem> {
var isLike=false;

  Widget liked(BuildContext context){

    return GestureDetector(

      onTap: (){

        SharedPref().getString(key: "token").then((value) {

          if(value!=null||value!=""){


            getResponseData().getDataWithToken(url: urls.like,
                token: value,
                data: {"type": "posts", "liked_id": widget.consulation.id}).then((res) {
              setState(() {
                widget.consulation.fav==1 ;

              });
              print(res);
            });

          }

          else{
            mToast().show(context,msg: "يجب تسجيل الدخول أولا");
          }



        });



      },
      child: Row(children: <Widget>[

        Icon(Icons.favorite_border,size: 20,)

        ,
        Text("أعجبني",style: Styles().consualtionStatisc(fsize: 10),)


      ],),
    );

  }

  Future<bool> onLikeButtonTapped(bool isLiked) async{
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;


    SharedPref().getString(key: "token").then((value){

print(value);

if(value!=null||value!="") {

  setState(() {
    if(value!="")
    {isLike=true;}
    else{
      isLike=false;
    }

  });

  getResponseData().getDataWithToken(url: urls.like,
      token: value,
      data: {"type": "posts", "liked_id": widget.consulation.id}).then((res) {

    print(res);
  });
}
else{
  print("يجب تسجيل الدخول");

 // mToast().show(,msg: "يجب تسجيل الدخول");
}


    });





    return isLike;
  }



  Widget likeBtn(BuildContext context){


    return GestureDetector(

      onTap: (){

        SharedPref().getString(key: "token").then((value){

        //  print(value.length);

          if(value.length>0&&value!="") {

print("token=$value");

            getResponseData().getDataWithToken(url: urls.like,
                token: value,
                data: {"type": "posts", "token":value,"liked_id": widget.consulation.id}).then((res) {

                  if(res.data['data']=="1"){


                    setState(() {
                   //   isLike=true;
                      widget.consulation.fav=1;
                    });

                  }

                  else{



                    setState(() {
                    //  isLike=false;
                      widget.consulation.fav=0;

                    });
                  }
              print("  respnose =$res  ");
            });
          }
          else{
         //   print("يجب تسجيل الدخول");

             mToast().show(context,msg: "يجب تسجيل الدخول أولا");
          }


        });



      },


      child: Row(children: <Widget>[


      Icon(widget.consulation.fav==0?  Icons.favorite_border:Icons.favorite,color: widget.consulation.fav!=0?colors.primary:Colors.grey,)

    ],),);


  }



  @override
  Widget build(BuildContext context) {

//print("id=${widget.consulation.id}");
//    if( consulation.comments.length!=null){
//
    //  print(  " length = ${widget.consulation.comments.length}");
//    }
//    else {
//
//      print("length 0");
//    }

    var w = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Directionality(
                textDirection: TextDirection.ltr,
                child: ListTile(

                  onTap: (){

                    Get.to(ConsulationPage(consulation: widget.consulation,));
                  //  getResponseData().  getDataWithToken(url: urls().allCons,token: Constant().token);


                  },
                  contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),



                  title:   Container(child:
                  Column(
                    children: <Widget>[
                      Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
//
//                                    Expanded(child: Icon(Icons.share,color: Colors.grey,size: 20,)),
//                                    Expanded(child: Icon(  consulation.fav==0 ? Icons.favorite_border:Icons.favorite,color:consulation.fav!=0 ?colors().orange: Colors.grey,size: 20,)),
//
//                                    Expanded(child: Row(
//                                      children: <Widget>[
//                                        Icon(FrinoIcons.f_chat_text,size: 15,),
//                                        Padding(
//                                          padding: const EdgeInsets.symmetric( horizontal: 5),
//                                          child: Text(consulation.comments.length!=null ? "${consulation.comments.length}" :"0",style: Styles().consualtionStatiscDefFont(fsize: 10,mcolor: Colors.black54),),
//                                        )
//                                      ],
//                                    )),


                            Expanded(
                                flex: 4,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child:
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[

                                                Icon(Icons.access_time,color: Colors.black54,),



                                                //  Text("منذ ساعة واحدة",style: Styles().consualtionStatisc(mcolor: Colors.grey,fsize: 8),),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                                  child:
                                                  Text(widget.consulation.date!=null ?widget.consulation.date:"",textDirection: TextDirection.ltr,style: Styles().consualtionStatisc(mcolor: Colors.black54,fsize: 10),),
                                                ),

                                              ],),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            Expanded(
                                flex: 4,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child:
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child:
                                                  Text(widget.consulation.type!=null ?widget.consulation.type:"",textDirection: TextDirection.ltr,style: Styles().consualtionStatiscDefFont(mcolor: Colors.black,fsize: 15),),
                                                ),

                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(10),
                                                  child:
                                                  Image.asset("images/" +getCat(widget.consulation.cat),width: 35,height: 35,),


                                                )
,


                                                //  Text("منذ ساعة واحدة",style: Styles().consualtionStatisc(mcolor: Colors.grey,fsize: 8),),

                                              ],),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),


                          ],

                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[

                                    Container(
                                        width: w,
                                        child: Text(widget.consulation.title !=null ?widget.consulation.title:"",overflow: TextOverflow.ellipsis,textAlign: TextAlign.right,maxLines: 1,style: Styles().TitleTextStyle14BoldBlack


                                          ,)),
                                    Container(
                                      width: w,
                                      child: Text(widget.consulation.description !=null ?widget.consulation.description:""
                                        ,overflow: TextOverflow.ellipsis,textAlign: TextAlign.right,maxLines: 2,style: Styles().consualtionStatiscDefFont(mcolor: Colors.black54,fsize: 13),),
                                    ),


                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),


                  )



,
subtitle:                   Container(
                   decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: Colors.grey))),

                  height: 40,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Expanded(child: GestureDetector(
                        onTap: (){
                          launcher().shareText(widget.consulation.type+"\n\n\n"+widget.consulation.title+"\n\n"+widget.consulation.description);

                        },

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: <Widget>[
                            Text("مشاركة",style: Styles().issueItemText(fsize: 12,mcolor: Colors.black),),

                            Icon(Icons.share,color: Colors.grey,size: 20,),
                          ],
                        ),
                      )),
//                      Expanded(child: Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Padding(
//                            padding: const EdgeInsets.symmetric(horizontal: 10),
//                            child: Text("أعجبني",style: Styles().issueItemText(fsize: 12,mcolor: Colors.black),),
//                          ),
//
//                          Icon(  consulation.fav==0 ? Icons.favorite_border:Icons.favorite,color:consulation.fav!=0 ?colors().orange: Colors.grey,size: 20,),
//                        ],
//                      )),
//                      Expanded(child:
//
//likeBtn(context)
//
//                      ),


                      Expanded(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric( horizontal: 5),
                            child: Text(widget.consulation.comments.length!=null ? "${widget.consulation.comments.length}" :"0",style: Styles().consualtionStatiscDefFont(fsize: 12,mcolor: Colors.black),),
                          )
                          ,
                          Icon(FrinoIcons.f_chat_text,size: 15,),
                        ],
                      )),


//                  Expanded(
//                      flex: 4,
//                      child: Align(
//                        alignment: Alignment.centerRight,
//                        child:
//                        Directionality(
//                          textDirection: TextDirection.rtl,
//                          child: Row(
//                            mainAxisSize: MainAxisSize.max,
//                            children: <Widget>[
//
//                              Icon(Icons.local_offer,color: Colors.black54,),
//
//
//
//                              //  Text("منذ ساعة واحدة",style: Styles().consualtionStatisc(mcolor: Colors.grey,fsize: 8),),
//                              Padding(
//                                padding: const EdgeInsets.symmetric(horizontal: 5),
//                                child: Text(consulation.type!=null ?consulation.type:"",textDirection: TextDirection.ltr,style: Styles().consualtionStatisc(mcolor: colors().orange,fsize: 14),),
//                              ),
//                              Text(consulation.date!=null ?consulation.date:"",textDirection: TextDirection.ltr,style: Styles().consualtionStatisc(mcolor: Colors.black54,fsize: 12),),
//
//                            ],),
//                        ),
//                      )),


                    ],

                  ),)



                )
            ),
          ),),
//        Positioned(
//          top: 1,
//          right: 5,
//
//          child:                                           Card(
//            color: colors().orange,
//            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
//            elevation: 2,
//            child: Container(
//              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//              child: Text(consulation.type!=null ?consulation.type:"",textDirection: TextDirection.ltr,style: Styles().consualtionStatisc(mcolor: Colors.white,fsize: 14),),
//            ),
//          ),
//
//        )

      ],
    );


  }

  conuItem(double w,BuildContext context){


    return Card(
elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ListTile(
            contentPadding: EdgeInsets.all(0),



            title:   Container(child:
            Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(" الإيجابيات والسلبيات للزواجالإيجابيات والسلبيات للزواج الإيجابيات والسلبيات للزواج المبكر ",overflow: TextOverflow.ellipsis,textAlign: TextAlign.right,maxLines: 1,style: Styles().consualtionStatiscDefFont(mcolor: Colors.black,fsize: 17),),
                            Text(" الإيجابيات والسلبيات للزواج المبكر  الإيجابيات والسلبيات للزواج المبكر  الإيجابيات والسلبيات للزواج المبكر  الإيجابيات والسلبيات للزواج المبكر "
                                " الإيجابيات والسلبيات للزواج المبكر  الإيجابيات والسلبيات للزواج المبكر ",overflow: TextOverflow.ellipsis,textAlign: TextAlign.right,maxLines: 2,style: Styles().consualtionStatiscDefFont(mcolor: Colors.black54,fsize: 14),),

                          ],
                        ),
                      ),
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("images/img_1.jpg",width: 80,height: 80,fit: BoxFit.fill,))

                  ],
                ),


              ],
            ),


            )

            ,subtitle:

          Container(
            decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: Colors.grey))),

            height: 40,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Expanded(child: Icon(Icons.share,color: Colors.grey,)),
                Expanded(child: Icon(Icons.favorite_border,color: Colors.grey,)),
                Expanded(child: Row(
                  children: <Widget>[
                    Icon(Icons.question_answer,color: Colors.grey,),
                    Text("9",style: Styles().consualtionStatiscDefFont(fsize: 10,mcolor: Colors.black54),)
                  ],
                )),
                Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child:
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[

                            Icon(Icons.local_offer,color: Colors.black54,),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text("استشارة نفسية",style: Styles().consualtionStatisc(mcolor: colors.primary,fsize: 10),),
                            ),

                            Text("منذ ساعة واحدة",style: Styles().consualtionStatisc(mcolor: Colors.grey,fsize: 8),),

                          ],),
                      ),
                    )),


              ],

            ),),





          )
        ),
      ),);
  }

 String getCat(int cat){

    if(cat==1){

      return "phsycho.png";
    }

    else if(cat==2){


      return "phsycho.png";

    }
    else if(cat==3){


      return "law.png";
    }
    else{

      return "logo.png";

    }


  }
}

