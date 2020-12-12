import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
//import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/Issue.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/IssueItemPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/htmlItem.dart';
import 'package:yemenwe/utils/launcher.dart';

class issueItem extends StatelessWidget {

  Issue issue;
  issueItem({this.issue});
  Future<bool> onLikeButtonTapped(bool isLiked) async{
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }

  // DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());
  // Options _cacheOptions = buildCacheOptions(Duration(days: 7), forceRefresh: true);
  //
  // Dio _dio = Dio();
  // var kUrl1 = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';
  //
  // getData()async{
  //   _dioCacheManager = DioCacheManager(CacheConfig());
  //
  //   Options _cacheOptions = buildCacheOptions(Duration(days: 7));
  //   Dio _dio = Dio();
  // //  _dio.interceptors.add(_dioCacheManager.interceptor);
  //   Response response = await _dio.post(
  //       'http://192.168.1.101:8000/api/ShowP',
  //    //   options: _cacheOptions
  //   );
  //
  //   print(response.data.toString());
  //
  // }

  @override
  Widget build(BuildContext context) {
    var data=issue.details.length>100? ""+issue.details.substring(0,100)+"":issue.details;



    var w=MediaQuery.of(context).size.width;


    return GestureDetector(


onTap: (){

  Get.to(IssueItemPage(issue));

},
      child: Container(
       // padding: EdgeInsets.all(5),
        child: Card(
elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 8,vertical: 5),

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

                          issue.img!=null&&     issue.img.trim().length>0?

                          Container(
                            padding: EdgeInsets.all(1),
                            child: ClipRRect(

                                borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                                child: CachedNetworkImage(imageUrl: urls.images+issue.img,width: w,height: 200,fit: BoxFit.fill,)),
                          ):Container(),

                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),

                              width: w,
                              //  alignment: Alignment.center,
                              child: Text(issue.title,maxLines: 2,textAlign: TextAlign.right,style: Styles().consualtionStatisc(fsize: 16,mcolor: Colors.black))),

htmlItem(data: data,)
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
              Container(
                width: w,
                margin: EdgeInsets.only(top: 10,bottom: 5),
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

                              launcher().shareText(issue.title+"\n\n\n"+issue.details);

                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Icon(Icons.share,size: 20,color: colors.grey,)),
                          ),


                          Expanded(child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(issue.date,textAlign: TextAlign.left,style: Styles().consualtionStatisc(fsize: 8),),
                          )),
                          // Text("اتحاد نساء اليمن",style: Styles().consualtionStatisc(fsize: 10),),
                          // Card(
                          //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          //   child: ClipRRect(
                          //
                          //       borderRadius: BorderRadius.circular(50),
                          //       child: Image.asset("images/logo.png",width: 30,height: 30,)),
                          // )


                        ],),
                    ),
                  ),
                ),

              ),


//
////            Container(
////                width: w,
////                alignment: Alignment.centerRight,
////                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
////                child: Text(issue.subtitle,style: Styles().issueItemText(fsize: 10,mcolor: Colors.black87))),
//
//,
//            issue.ext_book!=null&&    issue.ext_book.trim().length>0?  GestureDetector(
//              onTap: (){
//
//                Get.to(PdfPage(title: issue.book,url: issue.ext_book,));
//
//              },
//              child: Container(
//                margin: EdgeInsets.only(top: 5),
//                padding: EdgeInsets.all(5),
//                color: colors().bg,
//                child: Row(
//
//                  children: <Widget>[
//
////                    Container(
////                        padding: EdgeInsets.all(1),
////
////                        child: Icon(Icons.chrome_reader_mode,color: Colors.grey[500],)),
//                    Expanded(child: Padding(
//                      padding: const EdgeInsets.symmetric(horizontal: 5),
//                      child: Text(issue.title,textAlign: TextAlign.right,style: Styles().issueItemText(fsize: 12,mcolor: Colors.black),),
//                    )),
//                    Image.asset("images/ic_pdf1.jpeg",height: 35,width: 35,),
//
//
//                  ],
//
//                ),
//              ),
//            ):Container(),
//            issue.book!=null&&    issue.book.trim().length>0?  GestureDetector(
//              onTap: (){
//
//                Get.to(PdfPage(url:urls().books+ issue.book,title: issue.title,));
//
//              },
//              child: Container(
//                margin: EdgeInsets.only(top: 5),
//                padding: EdgeInsets.all(5),
//                color: colors().bg,
//                child: Row(
//
//                  children: <Widget>[
//
////                    Container(
////                        padding: EdgeInsets.all(1),
////
////                        child: Icon(Icons.chrome_reader_mode,color: Colors.grey[500],)),
//                    Expanded(child: Padding(
//                      padding: const EdgeInsets.symmetric(horizontal: 5),
//                      child: Text(issue.title,textAlign: TextAlign.right,style: Styles().issueItemText(fsize: 12,mcolor: Colors.black),),
//                    )),
//                    Image.asset("images/ic_pdf1.jpeg",height: 35,width: 35,),
//
//
//                  ],
//
//                ),
//              ),
//            ):Container(),
////       issue.sound!=null&&     issue.sound.trim().length>0?
////            Container(
////              margin: EdgeInsets.only(top: 5),
////            //  padding: EdgeInsets.all(5),
////              color: colors().bg,
////              child:
////
////              Row(
////
////                children: <Widget>[
////
////                  Expanded(child: Container(
////                    margin: EdgeInsets.symmetric(horizontal: 5),
////                    decoration: BoxDecoration(
////
////                      borderRadius: BorderRadius.circular(5),
////                      border: Border.all(width: 2,color: colors().grey)
////
////                    ),
////                    child: Row(
////mainAxisAlignment: MainAxisAlignment.center,
////                      children: <Widget>[
////
////                        Icon(Icons.file_download,color: colors().grey,),
////                        Text("تحميل")
////
////
////                      ],
////
////                    ),
////                  )),
////                  Expanded(child: GestureDetector(
////                    onTap: (){
////                      Get.to(AudioPage(url: issue.sound,));
////                    },
////                    child: Container(
////                      margin: EdgeInsets.symmetric(horizontal: 5),
////                      decoration: BoxDecoration(
////
////                        borderRadius: BorderRadius.circular(5),
////                        border: Border.all(width: 2,color: colors().grey)
////
////                      ),
////                      child: Row(
////mainAxisAlignment: MainAxisAlignment.center,
////                        children: <Widget>[
////
////                          Icon(Icons.play_arrow,color: colors().grey,),
////                          Text("استماع")
////
////
////
////
////                        ],
////
////                      ),
////                    ),
////                  )),
////                  Container(
////                    margin: EdgeInsets.symmetric(horizontal: 1),
////                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
////
////decoration: BoxDecoration(
////
////    color: colors().green2,
////
////    borderRadius: BorderRadius.circular(3)),
////                    child: Column(
////                      children: <Widget>[
////                        Icon(Icons.headset,color: Colors.white,),
////                        Text("3:03",style: Styles().issueItemText(mcolor: Colors.white,fsize: 12),)
////
////                      ],
////                    ),
////                  ),
////
////
////                ],
////
////              ),
////            ):Container(),
//
//
//
//            Container(
//              height: 45,
//              decoration: BoxDecoration(
//                border: Border(top: BorderSide(width: 1,color: colors().grey))
//              ),
//              margin: EdgeInsets.only(bottom: 1,top: 0,left: 3,right: 3),
//
//              padding: const EdgeInsets.symmetric(
//                  horizontal: 8, vertical: 5),
//              child: Row(
//                children: <Widget>[
////                  Expanded(
////                    flex: 3,
////                      child: Row(
////                        children: <Widget>[
////                          Row(
////                            children: <Widget>[
////                              Icon(
////                                  Icons.date_range,
////                                  size: 20,
////                                  color:
////                                  colors().grey
////                              ),
////                              Container(
////                                alignment: Alignment.center,
////                                padding: const EdgeInsets.symmetric(
////                                    horizontal: 5),
////                                child: Text(
////                                  issue.date,
////                                  style: Styles().issueItemText(
////                                      mcolor:
////                                      Colors.black87,fsize: 10
////                                  ),
////                                ),
////                              )
////                            ],
////                          ),
////
////                        ],
////                      )),
//
////                  Expanded(
////                    flex: 2,
////                      child:
////                      Row(
////                        children: <Widget>[
////                          Row(
////                            children: <Widget>[
////                              Icon(
////                                  Icons.visibility,
////                                  size: 20,
////                                  color:
////                                  colors().grey
////                              ),
////                              Container(
////                                alignment: Alignment.center,
////                                padding: const EdgeInsets.symmetric(
////                                    horizontal: 5),
////                                child: Text(
////                                  "38",
////                                  style: Styles().issueItemText(
////                                      mcolor:
////                                      Colors.black87,fsize: 10
////                                  ),
////                                ),
////                              )
////                            ],
////                          ),
////
////                        ],
////                      )
////
////                  ),
////                  Container(
////                    padding: EdgeInsets.symmetric(
////                        horizontal: 8, vertical: 1),
////                    decoration: BoxDecoration(
////                        color: colors().green2,
////                        borderRadius: BorderRadius.circular(10)),
////                    child: Text(
////                      issue.cat,
////                      style: Styles()
////                          .consualtionStatisc(mcolor: Colors.white),
////                    ),
////                  )
////                  ,
//                  Expanded(
//                    flex: 2,
//                      child: GestureDetector(
//
//onTap: (){
//
//  launcher().shareText(issue.title+"\n\n"+issue.details);
//
//},
//                        child: Container(
//                          alignment: Alignment.center
//,
//                          child:                                   Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//
//                              Text("مشاركة"),
//
//                              Icon(
//                                  Icons.share,
//                                  size: 20,
//                                  color:
//                                  colors().grey
//                              ),
//                            ],
//                          ),
//
//                        ),
//                      )),
//                  Expanded(
//                    flex: 2,
//                      child:
//
//                      LikeButton(
//
//                        onTap: onLikeButtonTapped,
//
//                        isLiked: issue.fav!=0?true:false ,
//                        size: 20,
//                        circleColor:
//                        CircleColor(start: colors().green, end: colors().green2),
//                        bubblesColor: BubblesColor(
//                          dotPrimaryColor: colors().green,
//                          dotSecondaryColor: colors().green2,
//                        ),
//                        likeBuilder: (bool isLiked) {
//                          return Icon(
//                            !isLiked ?  Icons.favorite_border:Icons.favorite,
//                            color: isLiked ? colors().green2 : Colors.grey,
//                            size: 20,
//                          );
//                        },
//                        likeCount: 0,
//                        countBuilder: (int count, bool isLiked, String text) {
//                          var color = isLiked ? colors().green2 : Colors.grey;
//                          Widget result;
//                          if (count == 0) {
//                            result = Padding(
//                              padding: const EdgeInsets.symmetric(horizontal: 5),
//                              child: Text(
//                                "أعجبني",
//                                style: Styles().consualtionStatiscNormalFont(fsize: 10,mcolor: color),
//                              ),
//                            );
//                          } else
//                            result = Padding(
//                              padding: const EdgeInsets.symmetric(horizontal: 5),
//                              child: Text(
//                                "أعجبني",
//                                style: Styles().consualtionStatiscNormalFont(fsize: 10,mcolor: color),
//                              ),
//                            );
//                          return result;
//                        },
//                      ),
//
//                  ),
//                ],
//              ),
//            ),

            ],

          ),


        ),
      ),
    );
  }
}
