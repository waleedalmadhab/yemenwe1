import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/Issue.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/VideoPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/htmlItem.dart';

import 'PdfPage.dart';
class IssueItemPage extends StatelessWidget {

  Issue issue;
  IssueItemPage(this.issue);


  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;



    print(issue.video);


    return Scaffold(

      appBar: AppBar(title: Text(issue.title,style: Styles().consualtionStatisc(fsize: 16,mcolor: Colors.white),),backgroundColor: colors.green2,),

      body: Container(

        child: Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
          child: SingleChildScrollView(
            child: Column(



              children: <Widget>[




                Row(
                  children: <Widget>[



                    Expanded(
                      child: Column(children: <Widget>[




                        Row(children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: <Widget>[



                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 3),

                                    width: w,
                                    //  alignment: Alignment.center,
                                    child: Text(issue.title,textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: Styles().consualtionStatisc(fsize: 16,mcolor: Colors.black))),





                                // issue.img!=null&&     issue.img.trim().length>0?
                                //
                                // Container(
                                //   margin: EdgeInsets.all(10),
                                //   padding: EdgeInsets.all(5),
                                //   child: ClipRRect(
                                //
                                //       borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                                //       child: CachedNetworkImage(imageUrl: urls().images+issue.img,width: w,height: 200,fit: BoxFit.fill,)),
                                // ):Container(),
                                //



//                                Container(
//                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 3),
//
//                                    width: w,
//                                    //  alignment: Alignment.center,
//                                    child: Text(issue.details,textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: Styles().consualtionStatiscNormalFont(fsize: 14,mcolor: Colors.black))),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child:   htmlItem(data: issue.details,showImg: true,),
),


//                                 issue.video!=null&&     issue.video.trim().length>0?
//
//                                 Container(
//                                   margin: EdgeInsets.all(10),
//                                   padding: EdgeInsets.all(5),
//                                   child: GestureDetector(
//                                     onTap: (){
//
//                                 //      Get.to(VideoPage(url: issue.video,));
//                                     },
//                                     child: Container(
//                                       padding: EdgeInsets.all(1),
//                                       child: Stack(
//                                         children: <Widget>[
//                                           ClipRRect(
//
//                                               borderRadius: BorderRadius.only(topRight: Radius.circular(1),topLeft: Radius.circular(1)),
//                                               child: CachedNetworkImage(imageUrl: "https://img.youtube.com/vi/${issue.video}/sddefault.jpg",width: w,height: 200,fit: BoxFit.fill,)),
//
//
//
//
//
//                                           Positioned(
//
//                                               top: 0,
//                                               right: 0,
//                                               bottom: 0,
//                                               left: 0,
//                                               child: Container(
//                                             color: Colors.black.withOpacity(.5),
//                                           ))
// ,
//                                           Positioned(
//
//                                               top: 90,
//                                               right: (w/2)-50,
//                                               child: Icon(Icons.play_circle_outline,color: Colors.white,size: 50,))
//
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ):Container(),

                              ],
                            ),
                          ),



                          Container(width: 2,),
                          // video

                        ],)


                      ],),
                    ),
                  ],
                ),



//            Container(
//                width: w,
//                alignment: Alignment.centerRight,
//                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                child: Text(issue.subtitle,style: Styles().issueItemText(fsize: 10,mcolor: Colors.black87))),


//             issue.ext_book!=null&&    issue.ext_book.trim().length>0?  GestureDetector(
//               onTap: (){
//
//             //    Get.to(PdfPage(title: issue.book,url: issue.ext_book,));
//
//               },
//               child: Container(
//                 margin: EdgeInsets.only(top: 5),
//                 padding: EdgeInsets.all(5),
//                 color: colors().bg,
//                 child: Row(
//
//                   children: <Widget>[
//
// //                    Container(
// //                        padding: EdgeInsets.all(1),
// //
// //                        child: Icon(Icons.chrome_reader_mode,color: Colors.grey[500],)),
//                     Expanded(child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 5),
//                       child: Text(issue.title,textAlign: TextAlign.right,style: Styles().issueItemText(fsize: 12,mcolor: Colors.black),),
//                     )),
//                     Image.asset("images/ic_pdf1.jpeg",height: 35,width: 35,),
//
//
//                   ],
//
//                 ),
//               ),
//             ):Container(),
//             issue.book!=null&&    issue.book.trim().length>0?  GestureDetector(
//               onTap: (){
//
//            //     Get.to(PdfPage(url:urls().books+ issue.book,title: issue.title,));
//
//               },
//               child: Container(
//                 margin: EdgeInsets.only(top: 5),
//                 padding: EdgeInsets.all(5),
//                 color: colors().bg,
//                 child: Row(
//
//                   children: <Widget>[
//
// //                    Container(
// //                        padding: EdgeInsets.all(1),
// //
// //                        child: Icon(Icons.chrome_reader_mode,color: Colors.grey[500],)),
//                     Expanded(child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 5),
//                       child: Text(issue.title,textAlign: TextAlign.right,style: Styles().issueItemText(fsize: 12,mcolor: Colors.black),),
//                     )),
//                     Image.asset("images/ic_pdf1.jpeg",height: 35,width: 35,),
//
//
//                   ],
//
//                 ),
//               ),
//             ):Container(),
//       issue.sound!=null&&     issue.sound.trim().length>0?
//            Container(
//              margin: EdgeInsets.only(top: 5),
//            //  padding: EdgeInsets.all(5),
//              color: colors().bg,
//              child:
//
//              Row(
//
//                children: <Widget>[
//
//                  Expanded(child: Container(
//                    margin: EdgeInsets.symmetric(horizontal: 5),
//                    decoration: BoxDecoration(
//
//                      borderRadius: BorderRadius.circular(5),
//                      border: Border.all(width: 2,color: colors().grey)
//
//                    ),
//                    child: Row(
//mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//
//                        Icon(Icons.file_download,color: colors().grey,),
//                        Text("تحميل")
//
//
//                      ],
//
//                    ),
//                  )),
//                  Expanded(child: GestureDetector(
//                    onTap: (){
//                      Get.to(AudioPage(url: issue.sound,));
//                    },
//                    child: Container(
//                      margin: EdgeInsets.symmetric(horizontal: 5),
//                      decoration: BoxDecoration(
//
//                        borderRadius: BorderRadius.circular(5),
//                        border: Border.all(width: 2,color: colors().grey)
//
//                      ),
//                      child: Row(
//mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//
//                          Icon(Icons.play_arrow,color: colors().grey,),
//                          Text("استماع")
//
//
//
//
//                        ],
//
//                      ),
//                    ),
//                  )),
//                  Container(
//                    margin: EdgeInsets.symmetric(horizontal: 1),
//                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
//
//decoration: BoxDecoration(
//
//    color: colors().green2,
//
//    borderRadius: BorderRadius.circular(3)),
//                    child: Column(
//                      children: <Widget>[
//                        Icon(Icons.headset,color: Colors.white,),
//                        Text("3:03",style: Styles().issueItemText(mcolor: Colors.white,fsize: 12),)
//
//                      ],
//                    ),
//                  ),
//
//
//                ],
//
//              ),
//            ):Container(),




              ],

            ),
          ),
        ),

      ),

    );
  }
}
