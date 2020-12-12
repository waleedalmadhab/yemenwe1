import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/route_manager.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/constants/Constant.dart';
import 'package:yemenwe/models/training/Question.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/SplashPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/dialogs.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';

import '../../main.dart';
class ExamPage extends StatefulWidget {

  int id;
  ExamPage({this.id});

  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {


  secure()async{

    await FlutterWindowManager.addFlags(
        FlutterWindowManager.FLAG_SECURE);
  }


  var _progress=6.0;

  int index=0;


 int checkAnswer(String option){

    switch(option){


      case "option1":
        return 1;
        break;


      case "option2":
        return 2;
        break;


      case "option3":
        return 3;
        break;

      case "option4":
        return 4;
        break;

    }

  }

  List<Question> questions=[];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
secure();


SharedPref().getString(key: "token").then((value) {


  getResponseData().getDataWithToken(url: urls.courseQuestions,token: value,data: {"id":widget.id,"token":value}).then((value) {

    print(value);
    // try{
    //   var d = jsonDecode(value.data.toString());
//   print(d);
    var ques = value.data["Trainings"] as List;
//print(dd);
    questions.clear();
    ques.forEach((element) {
      var q = Question(
        id: element['id'],
        questionText: element['text'],
        questionImg: element['image'],
        opt1: element['option1'],
        opt2: element['option2'],
        opt3: element['option3'],
        opt4: element['option4'],
        answerNo: checkAnswer(element['answer']),


      );

      questions.add(q);
    });

    questions.shuffle();

    setState(() {

    });

    //  }catch(e){}

  });

});



  }
  var exit=false;

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => Future.value(exit),

      child: Scaffold(

        appBar: AppBar(

          automaticallyImplyLeading: false,

        ),
        body:            questions.length!=null && questions.length>0?  Container(


      child: Column(
      children: <Widget>[
      Expanded(
      child: ListView(
          children: <Widget>[


          Container(
          margin: EdgeInsets.all(10),
      //  height: 10,
      width: w,
      //   color: colors().grey,
      // width: 50,
      child: CircularPercentIndicator(

      radius: 45.0,
      lineWidth: 4.0,
      percent: (1+index)/questions.length,
      center: new Text("${questions.length}"+"/"+"${ (index+1)}"),
      progressColor: colors.blueDark,
      )
      ),

            questions[index].questionImg!=null&&  questions[index].questionImg.trim().length>0?          Container(
      padding: EdgeInsets.all(10),
      child: Image.network(urls.images+questions[index].questionImg,fit: BoxFit.fill,width: w,

      height: 200,
      ),

      ):Container(),

      Container(
      padding: EdgeInsets.all(10),
      child: Text(questions[index].questionText,style:Styles().TitleTextStyle18Black ,textAlign: TextAlign.center,),

      ),


      answer(text:questions[index].opt1,position: 1),
      answer(text:questions[index].opt2,position: 2),
      answer(text:questions[index].opt3,position: 3),
      answer(text:questions[index].opt4,position: 4),





      ],


      ),



      ),


      Container(height: 60,
      width: w,
      child: Row(

      children: <Widget>[

   index==questions.length-1? Expanded(child: GestureDetector(

      onTap: (){
      setState(() {



      if(questions[index].selected!=0){


        var fullmark=0;
        var grade=0;
        var avg=0;


      //  mToast().show(context,msg: "تم انتهاء الامتحان",color: colors().blueDark);

        questions.forEach((element) {
fullmark+=10;

          if(element.answerNo==element.selected){

            grade+=10;
            avg++;



          }

        });

        dialogs().show(context, "النتيجة", " درجتك: $fullmark/$grade  "
            "\n\n"
            " معدلك:   ${grade/questions.length} "
            "",grade.toString(),widget.id);

      }
      else{

      mToast().show(context,msg: "يجب اختيار إجابة قبل عرض النتيجة  ",color: colors.blueDark);

      }

      });


      },
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
      Icon(Icons.arrow_back,color: colors.blueDark,),

      Text("النتيجة",textAlign: TextAlign.center,
      style: Styles().consualtionStatisc(mcolor: colors.blueDark,fsize: 14),

      ),
      ],
      ))):
      Expanded(child: GestureDetector(

      onTap: (){
      setState(() {



      if(questions[index].selected!=0){
      if(index<questions.length-1) {
      index++;
      }}
      else{

      mToast().show(context,msg: "يجب اختيار إجابة قبل الانتقال للسؤال التالي",color: colors.blueDark);
      }
      });


      },
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
      Icon(Icons.arrow_back,color: colors.blueDark,),

      Text("التالي",textAlign: TextAlign.center,
      style: Styles().consualtionStatisc(mcolor: colors.blueDark,fsize: 14),

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
      style: Styles().consualtionStatisc(mcolor: colors.blueDark,fsize: 14),
      ),

      Icon(Icons.arrow_forward,color: colors.blueDark,),

      ],
      ))),

      ],

      ),
      )
      ],
      ),

      ):Center(
         // child: SpinKitRipple(color: colors().blueDark,),
        )
      ,


      ),
    );
  }


 Widget answer({String text,int position}){


    return GestureDetector(

        onTap: (){

       //   function;
          setState(() {
           // selected=position;
            questions[index].selected=position;
            print(questions[index].selected);
            print(position);

          });
        },
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: questions[index].selected==position?colors.blueDark:colors.bg3
      ),

      child: Text(text,textAlign: TextAlign.center,style: questions[index].selected==position?Styles().consualtionStatiscNormalFont(fsize: 14,mcolor: Colors.white):Styles().consualtionStatiscNormalFont(fsize: 14,mcolor: Colors.black87),),


    ));

 }


}
