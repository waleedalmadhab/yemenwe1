import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/training/Course.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/TitlesPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/favItem.dart';
import 'package:yemenwe/utils/MQSize.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';

import 'dialogs.dart';
class courseItemList extends StatefulWidget {

  Course course;
courseItemList({this.course}){

  this.isFav=this.course.liked;

}

var isFav=0;

  @override
  _courseItemListState createState() => _courseItemListState();
}

class _courseItemListState extends State<courseItemList> {
  addTofav(){


    SharedPref().read( "user").then((value) {

      //   print(value['token']);
if(value!=null) {

  getResponseData().getDataWithToken(url: urls.like,
      token: value['token'],
      data: {
        "token": value['token'],
      //  "training_id": widget.course.id,
        "liked_id": widget.course.id,
        "type": "training"
      }).then((res) {
    print(res.data);
   // var d=json.decode(res.data.toString());
    print(res.data['data']);

    setState(() {
      widget.isFav=int.parse(res.data['data'].toString().trim());
    });
  });
}
else{

  mToast().show(context,msg: "يجب تسجيل الدخول");
}

    });

  }

  @override
  Widget build(BuildContext context) {

var w=MediaQuery.of(context).size.width;
var h=MediaQuery.of(context).size.height;
    return            GestureDetector(
      onTap: (){
        Get.to(TitlesPage(
          course: widget.course
          , token:  TokenProvider.token,));
      },

      child: Card(
        elevation: 5,
        child: Container(
//        height: 150,
          width: MQSize.width,

          child: Row(


            children: <Widget>[


              Expanded(
                flex: 3,
                child: Container(

                  child: Column(

                    children: <Widget>[



                      Container(
                        width: w,
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                        child: Text("${widget.course.title}",maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.right,style: Styles().consualtionStatisc(fsize: 12),),
                      ),
                      Container(
                        height: 30,
                        width: w,
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            children: <Widget>[
                              Expanded(child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(widget.course.instractor!=null?widget.course.instractor:"",textAlign: TextAlign.right,maxLines: 1,overflow: TextOverflow.ellipsis,style: Styles().consualtionStatiscNormalFont(fsize: 11),),
                              )),

                              Image.asset("images/instructor.png",height: 20,width: 20,)

                            ],
                          ),
                        ),
                      ),



                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          height: 24,
                          width: w,
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){
                                  dialogs().feedback(context,id: widget.course.id);

                                },
                                child: SmoothStarRating(
                                    allowHalfRating: true,
                                    onRated: (v) {
                                    },
                                    starCount: 5,
                                    rating: widget.course.rateaverage.toDouble(),
                                    size: 20.0,
                                    isReadOnly:true,

                                    halfFilledIconData: Icons.star_half,
                                    filledIconData: Icons.star,
                                    defaultIconData: Icons.star_border,
                                    color: Colors.amber,
                                    borderColor: Colors.amberAccent,
                                    spacing:0.0
                                ),
                              ),
                              Text("${widget.course.rateaverage}(${widget.course.ratecount})",style: Styles().consualtionStatiscNormalFont(fsize: 10),),
                              Expanded(child: favItem(isFav:widget.isFav==1?true:false,course: widget.course,))
                          //    Expanded(child: Icon( course.liked==1?Icons.favorite: Icons.favorite_border,color:course.liked==1?Colors.amber:colors().grey))


                            ],
                          ),
                        ),
                      ),

                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          width: w,
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                  //  width: (w/2)-40,
                                  margin: EdgeInsets.symmetric(horizontal: 3,vertical: 5),

                                  decoration: BoxDecoration(
                                      color: colors.primary,
                                      border: Border.all(width: 2,color: colors.primary),
                                      borderRadius: BorderRadius.circular(5)

                                  ),
                                  child: Text("${widget.course.type}",textAlign: TextAlign.center,style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.white),),

                                ),
                              ),



//
//             SmoothStarRating(
//                 allowHalfRating: true,
//                 onRated: (v) {
//                 },
//                 starCount: 5,
//                 rating: 4.5,
//                 size: 20.0,
//                 isReadOnly:true,
//
// halfFilledIconData: Icons.star_half,
//                 filledIconData: Icons.star,
//                 defaultIconData: Icons.star_border,
//                 color: Colors.amber,
//                 borderColor: Colors.amberAccent,
//                 spacing:0.0
//             ),
//             Text("4.4(235)",style: Styles().consualtionStatiscNormalFont(fsize: 10),),

                            ],
                          ),
                        ),
                      )

                    ],

                  ),

                ),
              ),



              Expanded(
                flex: 2,
                child: Container(
               //   height:h ,
                constraints: BoxConstraints(maxHeight: 150,minHeight: 120),
                  color: colors.primary,
                  width: w/3.5,
                  child: ClipRRect(

                      borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5)),
                      child: CachedNetworkImage(imageUrl:urls.images+widget.course.img,width: MQSize.width/3,
                        fit: BoxFit.fill,)),
                ),
              ),


            ],

          ),

        ),


      ),
    )
    ;
  }
}
