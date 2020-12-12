import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:yemenwe/models/training/Content.dart';
import 'package:yemenwe/models/training/Titles.dart';
import 'package:yemenwe/providers/ContentProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/utils/IssueType.dart';
class DetailsPage extends StatefulWidget {


  DetailsPage({this.content,this.subjects,this.inner,this.outer});
  Content content;
List<Titles> subjects=[];
int inner=0;
int outer=0;
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

var inIndex;

var outIndex;
@override
  void initState() {
    // TODO: implement initState


  inIndex=widget.inner;
  outIndex=widget.outer;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    print("inner index $inIndex   --------   outer index $outIndex");

    return Scaffold(
      appBar: AppBar(

        leading: GestureDetector(

            onTap: (){
              Get.back();

            },
            child: Icon(Icons.arrow_back,size: 30,color: colors.blueDark,)),
        backgroundColor: Colors.white,
        title: Container(


          child: Text(widget.subjects[outIndex].title,style: Styles().TitleTextStyle16Primary,),
        ),),
      body: Container(

        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child:


Column(
  children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.subjects[outIndex].title,style: Styles().TitleTextStyle18BlackBold,textAlign: TextAlign.center,),

        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.subjects[outIndex].contents[inIndex].title,style: Styles().TitleTextStyle18BlackBold,textAlign: TextAlign.center,),

        ),

   // checkContent()

  ],
)

//checkContent()

                ,

              ),
            ),

            Container(height: 50,

              width: w,
            child: Card(
              margin: EdgeInsets.all(0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(

                  children: <Widget>[


                    Expanded(child: GestureDetector(child: Container(
                      padding: EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: (){

                          print("inner index $inIndex   --------   outer index $outIndex");
decIndex();
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.arrow_back,color: colors.primary,),
                            Text("السابق",style: Styles().TitleTextStyle16Primary,),
                          ],
                        ),
                      ),
                    ))),
                    Expanded(child: GestureDetector(
                      onTap: (){
                        incIndex();
                        print("inner index $inIndex   --------   outer index $outIndex");


                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.arrow_back,color: colors.primary,),

                          Text("التالي",style: Styles().TitleTextStyle16Primary,),

                        ],
                      ),
                        ),
                      ),
                    )),


                  ],

                ),
              ),
            ),
            )
          ],
        ),
      ),
    );
  }

  decIndex(){


setState(() {


  if(outIndex>=0&&inIndex>0){

    inIndex--;

  }
  else if(outIndex>0&&inIndex==0){
    outIndex--;
    inIndex = widget.subjects[outIndex].contents.length - 1;

  }


//  if(outIndex>=0) {
//    if (inIndex > 0) {
//      inIndex--;
//
//
//      if (outIndex > 0 && inIndex == 0) {
//        outIndex--;
//        inIndex = widget.subjects[outIndex].lectures.length - 1;
//
//      }
//
//
//    }
//
//    else{
//      if(outIndex>0&& inIndex > 0){
//        // outIndex--;
//        inIndex--;
//        //   inIndex = widget.subjects[outIndex].lectures.length - 1;
//
//      }
//    }
//
//  }
});


  }

  incIndex(){



setState(() {


  if(outIndex<widget.subjects.length&&inIndex<widget.subjects[outIndex].contents.length-1){

    inIndex++;

  }
  else if(inIndex==widget.subjects[outIndex].contents.length-1){
    print("+++++++++++++++++++++++++");

   if(outIndex<widget.subjects.length-1) {
     outIndex++;
     inIndex = 0;


   }
  }



  //if(outIndex>=0  ){

//    if(inIndex<widget.subjects[outIndex].lectures.length-1){
//
//      inIndex++;
//
//    }
//
// // }
//  else if(outIndex>=0 &&outIndex<widget.subjects.length-1 &&inIndex==widget.subjects[outIndex].lectures.length-1)
//  {
//    outIndex++;
//    inIndex=0;
//
//  }

//  else if(outIndex>=0&&outIndex <widget.subjects.length &&inIndex==widget.subjects[outIndex].lectures.length-1){
//    outIndex++;
//    inIndex=0;
//
//  }

//if(outIndex<widget.subjects.length) {
//  if (inIndex < widget.subjects[outIndex].lectures.length ) {
//    inIndex++;
//
//
//    if (outIndex < widget.subjects.length  &&
//        inIndex == widget.subjects[outIndex].lectures.length ) {
//      outIndex++;
//      inIndex = 0;
//
////        if(inIndex>0){
////
////
////          inIndex--;
////
////        }
//
//    }
//  }
//}
});

  }

//  checkContent(){
//
//    switch ( widget.subjects[outIndex].contents[inIndex].issueType){
//
//      case IssueType.video :
//      return  video();
//        break;
//
//      case IssueType.book :
//      return  book();
//        break;
//
//      case IssueType.sound :
//      return  audio();
//        break;
//      case IssueType.img :
//      return  img();
//        break;
//
//
//    }
//
//
//
//  }


 Widget book(){


    return Center(
      child: Container(


        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.content.title.toString(),style: Styles().TitleTextStyle18BlackBold,textAlign: TextAlign.center,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.content.text.toString(),style: Styles().TitleTextStyle16Black,textAlign: TextAlign.center,),
            ),
          ],
        ),

      ),
    );



  }

 Widget audio(){


    return Center(
      child: Container(


        child: Text("this is audio"),

      ),
    );



  }

 Widget img(){


    return Center(
      child: Container(


        child: Text("this is img"),

      ),
    );



  }
}
