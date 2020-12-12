import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/training/Course.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';


class subjectItem extends StatelessWidget {
  Course course;
  subjectItem({this.course});


  @override
  Widget build(BuildContext context) {

    print(course.title);
    print(course.category);
//print(urls().images+ subject.img);
    var w=MediaQuery.of(context).size.width/2;
   // var w=200.0;
    return Container(
     // padding: EdgeInsets.symmetric(vertical: 1,horizontal: 3),

      child:Card(
elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),

//color: Color(0xfffefefe),
        margin: EdgeInsets.symmetric( vertical: 10,horizontal: 10),
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[


            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: <Widget>[

                  Container(
                    width: w, height: 128,
                 //   margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                   //   color: colors().bg,
borderRadius: BorderRadius.only(
    topRight: Radius.circular(10),
    bottomRight: Radius.circular(10),

)
                    ),
                //   margin: EdgeInsets.only(left: 5),
                  //  padding: EdgeInsets.all(2),
                    child: Stack(
                   //   overflow: Overflow.visible,
                      children: <Widget>[
                      //  Image.network(urls().images+ course.img, fit: BoxFit.fill,width: w,height: 200,),

                        CachedNetworkImage(
                          imageUrl:urls.images+ course.img,
                          fit: BoxFit.fill,width: w,height: 128,
                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),


Positioned(

    right: 0,
    top: 0,

    child:


 course.featured!=null? Container(
  alignment: Alignment.center,
 // margin: EdgeInsets.symmetric(horizontal: 5),
  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 1),
  decoration: BoxDecoration(
    color: colors.red1,
    //  color: colors().bg.withOpacity(.9),

    //borderRadius: BorderRadius.circular(5)
  ),

  //  height: 30,
 // width: w,
  child: Text("${course.featured!=null?course.featured:""}",style: Styles().issueItemText(fsize: 12,mcolor: Colors.white),maxLines: 1,),

):Container()
)


                      ],
                    ),

                  ),
                  Container(
                    alignment: Alignment.center,
                   // constraints: BoxConstraints(maxWidth: w-10),
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                    child: Text(course.title!=null?course.title:"",overflow: TextOverflow.ellipsis ,textAlign: TextAlign.center,maxLines: 3,style: Styles().consualtionStatisc(fsize: 13),),
                  ),
                  Spacer(),


                  course.start_date!=null&&course.length!=null?             Container(
                    width: w,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(width: 1,color: colors.bg3))
                    ),
//margin: EdgeInsets.symmetric(horizontal: 1),
                 //   padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[


                          course.start_date!=null&&course.start_date.length>0?       Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,

                              children: <Widget>[

                              Text( course.start_date!=null? course.start_date.substring(0,10):"",style: Styles().issueItemText(fsize: 10),),
                              Icon(Icons.date_range ),




                            ],),
                          ):Container(),



                          course.length!=null &&course.length.length>0?       Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(

                                mainAxisAlignment: MainAxisAlignment.end,

                                children: <Widget>[

                                Text(course.length!=null? course.length:"",style: Styles().issueItemText(fsize: 10),),
                                Icon(Icons.access_time ),




                              ],),
                            ),
                          ):Container(),



                        ],
                      ),
                    ),
                  ):Container()

                  ,                  Spacer(),



                  Container(
                    height: 30,
                    width: w,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 2,vertical: 5),
                    decoration: BoxDecoration(
                      //  color: Colors.orange[100],
                        color: colors.blueDark,
                        borderRadius: BorderRadius.circular(3)
                    ),


                    child: Flexible(child: Text(course.category,maxLines: 1,overflow: TextOverflow.ellipsis,style: Styles().consualtionStatisc(fsize: 10,mcolor: Colors.white),)),
                  )

                ],
              ),
            ),
//            Positioned(
//                right: -20,
//                top: 20,
//
//                child: Card(
//
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(30)
//                  ),
//
//                  shadowColor: Colors.grey[300],
//                  elevation: 10,
//
//                  child: Container(
//
//                    padding: EdgeInsets.all(7),
//                    child: Image.asset(subject.img, width: 40, height: 40,),
//
//                  ),
//                ))

          ],
        )
      )
    );
  }
}
