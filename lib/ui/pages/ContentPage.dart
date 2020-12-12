//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/training/Titles.dart';
import 'package:yemenwe/providers/ContentProvider.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/PdfPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/PlayerWidget.dart';
import 'package:yemenwe/ui/widgets/htmlItem.dart';
import 'package:yemenwe/ui/widgets/videoItem.dart';
import 'package:yemenwe/utils/SharedPref.dart';

import 'VideoPage.dart';
class ContentPage extends StatefulWidget {

  Titles titles;

ContentPage({this.titles});
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {

  int index=0;
  // AudioPlayer audioPlayer = AudioPlayer();


  // play(String url) async {
  //   int result = await audioPlayer.play(url);
  //   if (result == 1) {
  //     // success
  //   }
  // }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.titles.contents.length==1){
    var token=TokenProvider.token;
    getResponseData().getDataWithToken(url: urls.completeTitle,token: token,data: {"token":token,"id":widget.titles.contents[0].id}).then((value) {


      print(value);
         Provider.of<ContentProvider>(context,listen: false).update();

    });
  }
  }

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var token=TokenProvider.token;

    if(index==0&&widget.titles.contents.length>0){

      getResponseData().getDataWithToken(url: urls.completeTitle,token: token,data: {"token":token,"id":widget.titles.contents[index].id}).then((value) {


        print(value);
        Provider.of<ContentProvider>(context,listen: false).update();

      });

    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.titles.title ,style: Styles().TitleTextStyle16White,),)
      ,

      body:widget.titles.contents.length!=null&& widget.titles.contents.length>0? Container(

        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(

                children: <Widget>[

                  widget.titles.contents[index].title!=null?  Container(


                    padding: EdgeInsets.all(20),


                    child: Text(widget.titles.contents[index].title,textAlign: TextAlign.center,style: Styles().TitleTextStyle16Primary,),



                  ):Container(),



                  widget.titles.contents[index].img!=null?  Container(


                    padding: EdgeInsets.all(20),


                    child: Image.network(urls.images+widget.titles.contents[index].img),



                  ):Container(),


                  widget.titles.contents[index].text!=null? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: htmlItem(data: widget.titles.contents[index].text,showImg: true,),
                  )
            :Container(),

//                  widget.titles.contents[index].book!=null?  Container(
//
//
//                    padding: EdgeInsets.all(20),
//
//
//                    child: Container(
//                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(10),
//                        color: colors().blueDark
//
//                      ),
//
//                      child: Row(
//                        children: <Widget>[
//
//                          Icon(Icons.chrome_reader_mode,color: Colors.white,),
//                          Text("تصفح الكتاب",style: Styles().TitleTextStyle16White,),
//                        ],
//                      ),
//
//                    ),
//
//
//
//                  ):Container(),






                ],

              ),
            ),

            Container(height: 60,
              width: w,
              child: Row(

                children: <Widget>[

                  Expanded(child: GestureDetector(

                      onTap: (){
                        setState(() {


                            if(index<widget.titles.contents .length-1) {
                              index++;


                              getResponseData().getDataWithToken(url: urls.completeTitle,token: token,data: {"token":token,"id":widget.titles.contents[index].id}).then((value) {


                                print(value);
                                Provider.of<ContentProvider>(context,listen: false).update();

                              });

                            }
                            if(widget.titles.contents.length-1==index){
                              print("::::::::::::::::::::::::::::::::::::::::::::");
                            //  print(widget.titles.contents[index].id);


                            }



                        });


                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: <Widget>[
                          Icon(Icons.arrow_back,color: index!=widget.titles.contents .length-1? colors.blueDark:colors.grey,),

                          Text("التالي",textAlign: TextAlign.center,
                            style: Styles().consualtionStatisc(mcolor: index!=widget.titles.contents .length-1? colors.blueDark:colors.grey,fsize: 14),

                          ),
                        ],
                      ))),
                  Expanded(child: GestureDetector(

                      onTap: (){


                        setState(() {

                          if(index>0) {
                            index--;
                          }




                        });

                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Text("السابق",textAlign: TextAlign.center,
                            style: Styles().consualtionStatisc(mcolor: index!=0? colors.blueDark:colors.grey ,fsize: 14),
                          ),

                          Icon(Icons.arrow_forward,color: index!=0? colors.blueDark:colors.grey,),

                        ],
                      ))),

                ],

              ),
            )

          ],
        ),

      ) :Center(child: Text("لا يوجد محتوى ",style: Styles().TitleTextStyle16Black,),),
    );
  }
}
