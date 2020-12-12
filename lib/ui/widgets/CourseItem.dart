import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/training/Course.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/dialogs.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';

import 'favItem.dart';
class CourseItem extends StatefulWidget {

  Course course;

  CourseItem({this.course}){

    this.isFav=this.course.liked;
 //   print("++++++++++++++++++++++++++++++\n liked :");
//print(course.liked);
  //  print("++++++++++++++++++++++++++++++");

  }
  var isFav=0;

  @override
  _CourseItemState createState() => _CourseItemState();
}

class _CourseItemState extends State<CourseItem> {
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
    return Container(
height: 350,
      child: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            Card(
              shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),

              ),

              elevation: 10,
              child: Container(
                //    height: 250,
                width: w/2,
                child: Column(
                  children: <Widget>[
                    ClipRRect(

                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                        child: CachedNetworkImage(imageUrl:urls.images+widget.course.img,fit: BoxFit.fill,height: 140,width: w/2,)),

                    Row(
                      children: <Widget>[
                        Expanded(


                            child: GestureDetector(
                              onTap: (){
                                dialogs().feedback(context,id: widget.course.id);
                              },

                              child: Container(
                                // width: 60,
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                   //   topRight: Radius.circular(5),
                                    ),
                                    color: colors.bg3

                                ),

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("(${widget.course.ratecount})",style: Styles().consualtionStatisc(fsize: 10,mcolor: colors.black),),

                                    Text("${widget.course.rateaverage}/5",style: Styles().consualtionStatisc(fsize: 12),),
                                    Icon(Icons.star,color: Colors.amber,size: 20,),

                                  ],
                                ),

                              ),
                            )),
                        Expanded(


                            child: Container(
                              // width: 60,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    //topLeft: Radius.circular(10),
                                  ),
                                  color: colors.bg3

                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  favItem(isFav:widget.isFav==1?true:false,course: widget.course,)

                                ],
                              ),

                            )),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                      child: Text(widget.course.title,maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,style: Styles().consualtionStatisc(fsize: 12),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(widget.course.instractor!=null?widget.course.instractor: "",textAlign: TextAlign.right,maxLines: 1,overflow: TextOverflow.ellipsis,style: Styles().consualtionStatiscNormalFont(fsize: 11),),
                            )),

                            Image.asset("images/instructor.png",height: 20,width: 20,)

                          ],
                        ),
                      ),
                    ),

                    //  Divider(height: 1,color: colors().blueDark,),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
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
            )


          ],

        ),


      ),


    );
  }
}
