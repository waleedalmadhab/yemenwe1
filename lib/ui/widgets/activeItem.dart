import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:frino_icons/frino_icons.dart';
import 'package:get/get.dart';
//import 'package:simple_url_preview/simple_url_preview.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/constants/Constant.dart';
import 'package:yemenwe/models/Active.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/ActiveDetails.dart';
import 'package:yemenwe/ui/pages/ConsulationPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:yemenwe/ui/widgets/htmlItem.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';
import 'package:yemenwe/utils/launcher.dart';

import 'customUrlPreview.dart';
class activeItem extends StatelessWidget {

  Active active;
  activeItem({this.active});


  var kUrl1 = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';


  @override
  Widget build(BuildContext context) {



    var w=MediaQuery.of(context).size.width;

var data=active.details.length>100? ""+active.details.substring(0,100)+"":active.details;






    return GestureDetector(


      onTap: (){

        Get.to(ActiveDetails(active: active,));

      },
      child: Container(
        // padding: EdgeInsets.all(5),
        child: Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),

          child: Column(



            children: <Widget>[


              Container(
                width: w,
                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                //  color: colors().orange,

                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap:  ()  {
//                    getResponseData().  getData(url: urls().allWissuse).then((value) {
//
//                      // print(value.data);
//                      var d=value.data['Posts']['data'] as List;
//
//
//
//                      print(d);
//
//                    });
                    },

                    child: Container(
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[


                          GestureDetector(

                            onTap: (){

                              launcher().shareText(active.title+"\n\n\n"+active.details);

                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Icon(Icons.share,size: 20,color: colors.grey,)),
                          ),


                          Expanded(child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(active.date,textAlign: TextAlign.left,style: Styles().consualtionStatisc(fsize: 8),),
                          )),
                          Text("اتحاد نساء اليمن",style: Styles().consualtionStatisc(fsize: 10),),
                          Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(

                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset("images/logo.png",width: 30,height: 30,)),
                          )


                        ],),
                    ),
                  ),
                ),

              ),


              active.thumbnail!=null&&     active.thumbnail.length>0?

              Container(
                padding: EdgeInsets.all(1),
                child: ClipRRect(

                    borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                    child:
                    // CachedNetworkImage(imageUrl: urls().images+active.img,width: w,height: 200,fit: BoxFit.fill,)
                    CachedNetworkImage( imageUrl:urls.images+ active.thumbnail,width: w,height: 200,fit: BoxFit.fill,)

                ),
              ):Container(),

              active.title!=null&&     active.title.length>0?   Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),

                  width: w,
                  //  alignment: Alignment.center,
                  child: Text(active.title,maxLines: 2,textAlign: TextAlign.right,style: Styles().consualtionStatisc(fsize: 16,mcolor: Colors.black))):Container(),
//              active.details!=null&&     active.details.length>0?     Container(
//                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 3),
//
//                  width: w,
//                    alignment: Alignment.center,
//                  child: Text(active.details,maxLines: 3,textAlign: TextAlign.right,style: Styles().consualtionStatiscNormalFont(fsize: 12,mcolor: Colors.black))):Container(),
              active.details!=null&&     active.details.length>0?     htmlItem(data: data,):Container(),


//              active.url!=null&&     active.url.length>0?     GestureDetector(
//
//                onTap: (){
//
//                  launcher().openUrl(active.url);
//
//                },
//                child: customUrlPreview(url: active.url,),
//              ):Container(),
            ],

          ),


        ),
      ),
    );
  }
}
