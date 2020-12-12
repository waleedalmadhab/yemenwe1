import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/training/Content.dart';
import 'package:yemenwe/models/training/Course.dart';
import 'package:yemenwe/models/training/Titles.dart';
import 'package:yemenwe/providers/ContentProvider.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';

import 'ContentPage.dart';
import 'ExamPage.dart';
class TitlesPage extends StatefulWidget {

  Course course;
  int id;
  var token="";
  TitlesPage({this.id,this.token,this.course});

  @override
  _TitlesPageState createState() => _TitlesPageState();
}

class _TitlesPageState extends State<TitlesPage> {
List<Titles> titles=[];

 var selected="Lec";
 var isregistered=0;

  @override
  Widget build(BuildContext context) {


    Provider.of<ContentProvider>(context,listen: true).update();
var desc="";
var cert="";
    dynamic percent=0;

    var w=MediaQuery.of(context).size.width;
print(" id=${widget.course.id}");
    return Scaffold(
      appBar: AppBar(),
      body: Container(



        child: FutureBuilder(

            future: getResponseData().getDataWithToken(url: urls.titles,token: widget.token,data: {"id":widget.course.id,"token":widget.token}),

            builder: (bc,snapshot) {
            //  print(widget.token);
              var res=false;
              var length;
              var  mpercent=0;

//print("titles data **********************************");
            //  print(snapshot.data);
              try{
                var d = jsonDecode(snapshot.data.toString());
                if(d['status']!=null &&d['status']==true){
                  res=true;
//   print(d);
                cert = d["Trainings"]['certificate'] ;
                desc = d["Trainings"]['description'] ;
                isregistered = d["Trainings"]['is_register']!=null?1:0 ;
                var dd = d["Trainings"]['titles'] as List;
length=dd.length;
                titles.clear();
                mpercent=0;
                dd.forEach((element) {

                  List<Content> contents = [];

                  var con = element['contents'] as List;
                  con.forEach((el) {
                   // print(el);
                    var content = Content(
                      id: el['id'],
                      title: el['title'],
                      text: el['body'],

                  //    img: el['image'],
                      //video: el['video_url'],
                    //  sound: el['sound'],


                    );
                    contents.add(content);
                  });

print(element['is_complete']);
                  var title = Titles(
                      id: element['id'],
                      title: element['name'],
                      isComplete: element['is_complete']!=null&&element['is_complete']==true? 1:0,
                      contents: contents
                  );
             mpercent+=     element['is_complete']!=null&&element['is_complete']==true? 1:0;
                  titles.add(title);
                });}

percent=mpercent/length;
            //    print("percent:+++++++++++++++++++  $percent");

              }catch(e){
                print(e.toString());
              }
              print("length:");
              print(titles.length);
                return titles.length!=null&&titles.length>0? Container(
                  color: Colors.white,

                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: SingleChildScrollView(
                          child:
                          Column(
                            children: <Widget>[


                              Container(

                                child: CachedNetworkImage(imageUrl: urls.images+widget.course.img,fit: BoxFit.fill,height: 250,width: w,),

                              ),

Container(height: 30,
width: w,
  padding: EdgeInsets.symmetric(horizontal: 10),
  child:
  LinearPercentIndicator(
    width: w-25,
    lineHeight: 14.0,
    percent: double.parse(percent.toString()),
    backgroundColor: Colors.grey,
    progressColor: colors.primary,
  ),
),
                              Container(
                                width: w,
                                //  padding: EdgeInsets.all(10),
                                color: colors.bg3,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(child: Container(),)
                                    ,                                            Expanded(

                                      child: GestureDetector(

                                        onTap: (){
                                          print(selected);

                                          setState(() {
                                            selected="More";
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),


                                          decoration: BoxDecoration(
                                              border: Border(bottom: BorderSide(width: 3,  color: selected=="More"? colors.blueDark:colors.bg3))

                                          ),

                                          child: Text(" المزيد",textAlign: TextAlign.center,style: Styles().consualtionStatisc(fsize: 12,mcolor: selected=="More"? colors.blueDark:Colors.black),


                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(width: 10,),

                                    Expanded(

                                      child: GestureDetector(

                                        onTap: (){


                                          setState(() {
                                            selected="Lec";
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),


                                          decoration: BoxDecoration(
                                              border: Border(bottom: BorderSide(width: 3,  color: selected=="Lec"? colors.blueDark:colors.bg3))

                                          ),

                                          child: Text(" المحاضرات",textAlign: TextAlign.center,style: Styles().consualtionStatisc(fsize: 12,mcolor: selected=="Lec"? colors.blueDark:Colors.black),


                                          ),
                                        ),
                                      ),
                                    ),


                                  ],
                                ),
                              ),



                         selected=="Lec"?     ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: titles.length!=null ?titles.length:0,
                                  itemBuilder: (bc,lvelIndex){

                                    //   print( " iscomplete : ${ titles[lvelIndex].isComplete}");
                                    return  Container
                                      (
                                      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 2,color: colors.bg3))),
                                      //    margin: EdgeInsets.symmetric(vertical: 0),
                                      child: Column(
                                        children: <Widget>[
                                          (Container(
//decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: colors().grey))),

                                            child: GestureDetector(
                                              onTap: (){
                                                //  print( "id=${titles[lvelIndex].id}  iscomplete : ${ titles[lvelIndex].isComplete}");

                                                if(isregistered==1&&TokenProvider.token!=null&&TokenProvider.token.length>0){

                                              var d=  Get.to(ContentPage(titles: titles[lvelIndex],)).then((value) {
                                      //
                                      //           var token=FavProvider.token;
                                      //           getResponseData().getDataWithToken(url: urls().completeTitle,token: token,data: {"token":token,"title_id":titles[lvelIndex].id}).then((value) {
                                      //
                                      //
                                      //             print("doneeeeeeeeeeeeeeeeeeeeeeeee");
                                      //   //          print(value);
                                      // //               Provider.of<ContentProvider>(context,listen: false).update();
                                      //
                                      //           });

                                                print(titles[lvelIndex].id);
                                              });
                                                }

                                                else{
                                                  mToast().show(context,msg: "انضم للدورة أولا ثم تصفح المحتوى");
                                                }
                                              },
                                              child: Directionality(
                                                  textDirection: TextDirection.rtl,
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                                    margin: EdgeInsets.only(left: 0,),

                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(

                                                            margin: EdgeInsets.only(right: 5),
                                                            child: Icon(  Icons.subdirectory_arrow_left,color: titles[lvelIndex].isComplete==1? colors.green2:colors.grey,)),

                                                        Expanded(
                                                          child: Container(
                                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                                            child: Text(titles[lvelIndex].title,style: Styles().TitleTextStyle16Black,overflow: TextOverflow.visible,),
                                                          ),
                                                        ),
                                                        Container(

                                                            margin: EdgeInsets.only(right: 5),
                                                            child: Icon(  Icons.check_circle,color: titles[lvelIndex].isComplete!=0? colors.green2:colors.grey,)),


                                                      ],
                                                    ),
                                                  )

//                                ExpansionTile(
//                                    title: Container(
//                                  margin: EdgeInsets.only(left: 0,),
//
//                                  child: Row(
//                                    children: <Widget>[
//                                      Container(
//
//                                          margin: EdgeInsets.only(right: 5),
//                                          child: Icon(  Icons.check_circle,color: course.titles[lvelIndex].isComplete==1? colors().green2:colors().grey,)),
//
//                                      Expanded(
//                                        child: Container(
//                                          padding: const EdgeInsets.symmetric(horizontal: 10),
//                                          child: Text(course.titles[lvelIndex].title,style: Styles().TitleTextStyle16Black,overflow: TextOverflow.visible,),
//                                        ),
//                                      ),
//
//
//                                    ],
//                                  ),
//                                )
//
////                                  ,children:  course. titles[lvelIndex].contents!=null? course. titles[lvelIndex].contents.map((content) => Container(
////
////                                    child: GestureDetector(
////                                      onTap: (){
////
////                                        //     Get.to(DetailsPage(content: content,subjects: titles,outer: lvelIndex,inner:titles[lvelIndex].contents.indexOf(content) ,));
////                                        //  Get.to(ExpandableListView());
////
////                                      },
////                                      child: Container(
////                                        padding: EdgeInsets.only(left: 15,top: 15,bottom: 15),
////                                        margin: EdgeInsets.only(right: 50,
////                                        ),
////                                        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: colors().bg3))),
////                                        child: Directionality(
////                                          textDirection: TextDirection.rtl,
////                                          child: Row(
////                                            children: <Widget>[
////                                                Icon(Icons.chevron_right,color: colors().blueDark,),
////
////                                              Flexible(
////                                                child: Padding(
////                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
////                                                  child: Text(content.title,style: Styles().TitleTextStyle16Black,
////
////                                                  ),
////                                                ),
////                                              ),
////                                            ],
////                                          ),
////                                        ),
////
////                                      ),
////                                    ),
////
////                                  )).toList():[],
//                                ),
                                              ),
                                            ),

                                          )),
//                            Container(
//                              margin: EdgeInsets.symmetric(horizontal: 20),
//                              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: colors().grey))),
//
//                            )
                                        ],
                                      ),
                                    );}
                              ):ListView(


                           shrinkWrap: true,
                           physics: NeverScrollableScrollPhysics(),
                           children: <Widget>[



                             desc!=null? Container(
                               // height: 200,
                               decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: colors.grey))),
                               padding: EdgeInsets.all(10),

                               width: w,

                               child: Column(
                                 children: <Widget>[
                                   Container(
                                     width: w,
                                     padding: EdgeInsets.all(2),
                                   //  color: colors().bg3,
                                     child: Text("نبذة عن الدورة:",textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.blueDark),


                                     ),
                                   ),
                                   Container(
                                     width: w,
                                     padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                     child: Text(""
                                         "$desc"
                                       ,textAlign: TextAlign.right,style: Styles().consualtionStatiscNormalFont(fsize: 12,mcolor: Colors.black),


                                     ),
                                   ),


                                 ],

                               ),
                             ):Container(),

                             cert!=null? Container(
                               // height: 200,
                               decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: colors.grey))),
                               padding: EdgeInsets.all(10),

                               width: w,

                               child: Column(
                                 children: <Widget>[
                                   Container(
                                     width: w,
                                     padding: EdgeInsets.all(2),
                                   //  color: colors().bg3,
                                     child: Text("الشهادة",textAlign: TextAlign.right,style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.blueDark),


                                     ),
                                   ),
                                   Container(
                                     width: w,
                                     padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                     child: Text(""
                                         "$cert"
                                       ,textAlign: TextAlign.right,style: Styles().consualtionStatiscNormalFont(fsize: 12,mcolor: Colors.black),


                                     ),
                                   ),


                                 ],

                               ),
                             ):Container(),



                           ],

                         )


                            ],
                          ),

                        ),
                      ),



                      startExam()? GestureDetector(
                        onTap: (){

                          if(startExam()){

                            Get.to(ExamPage(id: widget.id,));

                          }
                          else{
                            mToast().show(context,msg: "يجب إكمال جميع الدروس قبل بدء الاختبار",color: colors.blueDark);

                          }

                        },

                        child:  Container(height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.help_outline,color: Colors.white,),
                              Text("ابدأ الاختبار ",style: Styles().TitleTextStyle16White,)

                            ],

                          ),
                          color: colors.blue,
                        ),
                      )

                          :Container(),

                isregistered==0?      GestureDetector(
                        onTap: (){

                          SharedPref().read("user").then((value) {
                            if (value != null) {
                              print(value);

                              if(value['type']!="employees"&&widget.course.type!="عام"){

                                mToast().show(context,
                                    msg: "عفوا هذه الدورة خاصة بالموظفين");

                              }
                              else{


                                getResponseData().getDataWithToken(url: urls.register_to_training,token: value['token'],data: {"token":value['token'],"training_id":19,"type":"trainings"}).then((res) {


                                  print(res.data);

                                  setState(() {

                                  });

//
// var d=res.data['Trainings'] as List;
//
// d.forEach((element) {
//
//   var n=element['trainings'] as List;
//
//
//
//   n.forEach((el) {
//   //  debugPrint(el.toString());
//
//     print(el);
//     print("\n\n****************************");
//
//   });
//
// });

                                  //    print(value);
                                  //    Provider.of<ContentProvider>(context,listen: true).update();

                                });



                              }


                            }
                            else {
                              mToast().show(context,
                                  msg: "يجب تسجيل الدخول أولا");
                            }

                          });
                        },

                        child:  Container(height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.arrow_back,color: Colors.white,),
                              Text("انضمام للدورة  ",style: Styles().TitleTextStyle16White,)

                            ],

                          ),
                          color: colors.blue,
                        ),
                      )
:Container()

                   ,

                      startCourse()?      GestureDetector(
                        onTap: (){

                          if(startCourse()){

                            if(titles.length!=null&&titles.length>0) {
                              Get.to(ContentPage(titles: titles[0],));
                            }
                          }


                        },

                        child:  Container(height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.arrow_back,color: Colors.white,),
                              Text("ابدأ الدورة ",style: Styles().TitleTextStyle16White,)

                            ],

                          ),
                          color: colors.blue,
                        ),
                      )
:Container()

                    ],
                  ),

                ):

                  Center(child: length!=null&&length==0?Text("سيتم إضافة محتوى لهذه المادة قريبا "):  SpinKitRipple(color: colors.blueDark,),);


            })

      ),
    );
  }

 bool startExam(){


    var start=true;

    for(int i=0;i<titles.length;i++){

      if(titles[i].isComplete!=1){
        start=false;
        break;
      }

    }



    return start;
  }
 bool startCourse(){


    var start=true;

    for(int i=0;i<titles.length;i++){

      if(titles[i].isComplete!=0){
        start=false;
        break;
      }
    }


    return start;
  }

}
