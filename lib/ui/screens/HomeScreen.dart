import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/carousal.dart';
import 'package:yemenwe/ui/widgets/activeItem.dart';
import 'package:yemenwe/models/Active.dart';
import 'package:yemenwe/models/Slide.dart';
import 'package:yemenwe/utils/internetConnection.dart';

class News{

  var title="";
  List<Active> actives=[];

  News({this.title,this.actives});

}

class HomeScreen extends StatelessWidget {



  List<SlideImg> slides=[];
  List<News> news=[];
  List<Active> actives=Active().getActives();

  @override
  Widget build(BuildContext context) {



    return FutureBuilder(

        future: InternetConnection.instance.isConnected(),
        builder: (bc,connected){


      return connected.data!=null &&connected.data? Container(

        child: SingleChildScrollView(child: Wrap(
          children: <Widget>[


            FutureBuilder(

                future: getResponseData().getData(url: urls.slides),
                builder: (bc,snapshot){

                  try {
                    var d = jsonDecode(snapshot.data.toString());
                //    print(d);
                    var dd = d['data'] as List;
                    slides.clear();

                    dd.forEach((element) {
                      var slide = SlideImg(
                        img: element['image'],
                        description: element['description'],

                      );
                      slides.add(slide);
                    });
                  }catch(e){}

                  return      slides.length!=null&&slides.length>0?     Container(
                      width: double.infinity,
                      height: 220,
                      child: Carousal().horizantal(slides: slides,)):Container(




                  );


                }),


            FutureBuilder(

                future: getResponseData().getData(url: urls.actives),
                builder: (bc,snapshot){

                  if(snapshot.hasData){


                    try{
                    //  print(snapshot.data);
                      var d = jsonDecode(snapshot.data.toString());
                      //   print(d);
                      List<Active> tempActives=[];
                      List<Active> tempActives2=[];
                      var n = d['data']['news'] as List ;
                      var projects = d['data']['projects'] as List ;
                      news.clear();
                      n.forEach((element) {
                        var t=Active(
                          id: element['id'],
                          title: element['title'],
                          details: element['description'],
                          thumbnail: element['image'],
                          url: element['url'],

                        );
                        tempActives.add(t);


                      });

                      news.add(News(title: "آخر الأخبار",actives: tempActives));

//    tempActives.clear();

                      projects.forEach((element) {
                        var imgs=[element['image']];
                        var t=Active(
                          id: element['id'],
                          title: element['title'],
                          details: element['description'],
                          thumbnail: element['image'],
                          url: element['url'],

                        );
                        tempActives2.add(t);


                      });

                      news.add(News(title: " الأنشطة",actives: tempActives2));


                    }catch(e){}

                    //  print("news length=${news.length}");                                     child: SpinKitFadingFour(color: colors().primary,),

                    return   news.length!=null?        ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: news.length,
                        itemBuilder: (bc,outIndex)=>          Wrap(

                          children: <Widget>[

                            Container(
                              width: double.infinity,
                              height: 50,
                              color: colors.bg3,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.all(10

                              ),
                              child: Text(news[outIndex].title,style: Styles().TitleTextStyle16Black,textAlign: TextAlign.center,),

                            )
                            ,
                            ListView.builder(
                                itemCount:news[outIndex]. actives.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (bc,i)=>Container(
                                  //height: 100,
                                    child:    activeItem(active: news[outIndex].actives[i],)
                                ))


                          ],
                        )
                    ):Center(




                    );


                  }
                  else{



                    return Center(

                      child: Container(
                          margin: EdgeInsets.only(top: 100),
                          child: SpinKitFadingFour(color: colors.primary,)),);
                  }




                })



          ],

        )),


      ):Center(
child: Container(
  color: Colors.white,
  width: double.infinity,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[

      Image.asset("images/notconnected.png"),

      Container(

          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text("لا يوجد اتصال بالإنترنت",style: Styles().consualtionStatisc(fsize: 16,mcolor: Colors.black),)),

//              Container(
//                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//
//                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
//
//                ,color: colors().blue
//                ),
//
//                child: Text(" أعد المحاولة",style: Styles().consualtionStatisc(fsize: 14,mcolor: Colors.white),),
//              )
//              ,


    ],
  ),
),
      );

    });
  }
}
