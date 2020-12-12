
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:ionicons/ionicons.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:quick_feedback/quick_feedback.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/constants/Constant.dart';
import 'package:yemenwe/providers/CartProvider.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/HomePage.dart';
import 'package:yemenwe/ui/pages/SplashPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/heroItem.dart';
import 'package:yemenwe/ui/widgets/textForm.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';

import '../../main.dart';

class dialogs{


  cancelOrder({BuildContext context,int id}){
TextEditingController textEditingController=TextEditingController();

    showDialog(context: context,builder: (context)=>Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)

        ),
        title: Text("سبب الالغاء"),

        content: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                child: Container(
                  //  height: 70,
                    decoration: BoxDecoration(color: colors.white,borderRadius: BorderRadius.circular(5)),
                    //  margin: EdgeInsets.all(10),
                    child
                        : Container(
                      padding: EdgeInsets.symmetric( horizontal: 10,),


                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 25,
                            padding: EdgeInsets.only(top: 5,),
                            child: Row(children: <Widget>[

                              Icon(EvaIcons.questionMarkOutline,size: 20,color: colors.primary,),
                              Container(width: 10,),
                              Text("سبب الالغاء",style: Styles().consualtionStatisc(fsize: 10,mcolor: colors.primary),)

                            ],),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 30),
                            child: TextFormField(
                              decoration: InputDecoration(

                                  border: InputBorder.none,
                                  hintStyle: Styles().consualtionStatiscNormalFont(fsize: 12,mcolor: colors.grey),
                                  hintText: "اكتب سبب الالغاء"
                              ),
                              controller: textEditingController,
                             // obscureText: ispassword,




                            ),
                          )
                        ],
                      ),

                    )),
              ),
              GFButton(
                color: colors.bg10,
                textColor: colors.black,
                onPressed: (){
                  //   print(order.ispayment);
                  if(textEditingController.text.length>3) {
                    getResponseData().getDataWithToken(url: urls.cancel_order,
                        token: TokenProvider.token,
                        data: {
                          "order_id": id,
                          "description": "${textEditingController.text}"
                        }).then((value) {
                          print(value);
mToast().show(context,msg: value.data['msg']);
                      Provider.of<CartProvider>(context,listen: false).update();
                      Navigator.pop(context);


                    });
                  }
                  else{

                    mToast().show(context,msg: "يجب كتابة السبب");

                  }

                },
                text: "الغاء ",
                textStyle: Styles().consualtionStatisc(fsize: 10,mcolor: colors.primary),
                // type: GFButtonType.outline2x,
                shape: GFButtonShape.standard,

              ),



            ],
          ),
        ),

      ),
    ));


  }

  aboutus(BuildContext context) {
    AwesomeDialog(

      context: context,
      headerAnimationLoop: false,
      dialogType: DialogType.INFO,
      animType: AnimType.BOTTOMSLIDE,
      title: 'من نحن',

      body:Container(

        color: colors.bg3,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
Hero(
    tag: "logo",

    child: GestureDetector(

        onTap: (){
       //   Get.to(HeroItem(tag: "logo",));

          Navigator.of(context).push(new PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) {
                return new Material(
                    color: Colors.black38,
                    child: new Container(
                      padding: const EdgeInsets.all(30.0),
                      child: new InkWell(
                        child: new Hero(
                          child: new Image.asset(
                            'images/yemenwelogo.png',
                            width: 300.0,
                            height: 300.0,
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                          ),
                          tag: "logo",
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ));
              }));
        //  showDialog(context: context,builder: (_)=>HeroItem(tag: "logo",));

        },
        child: Image.asset("images/yemenwelogo.png",width: 120,height: 120,))),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text( 'منظمة غير حكومية طوعية مستقلة تأسست منذ الستينات تضم في عضويتها من ترغب من النساء من مختلف الفئات العمرية والانتماءات السياسية',style: Styles().TitleTextStyle14Black,textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    //  btnCancelOnPress: () {},
      btnOkColor: colors.primary,
      btnOkOnPress: () {},
    )..show();
  }
  viewImg(BuildContext context,String img) {
    var w=MediaQuery.of(context).size.width;
    AwesomeDialog(
      context: context,

      headerAnimationLoop: false,
      dialogType: DialogType.INFO,
      customHeader: Container(

        width: 100,height: 100,
      child: ClipRRect(

          borderRadius: BorderRadius.circular(50),
          child: Image.asset(img,fit: BoxFit.fill,)),

      ),
      padding: EdgeInsets.all(0),
      animType: AnimType.BOTTOMSLIDE,
     // title: 'من نحن',

      body:Container(
        padding: const EdgeInsets.all(1.0),
        child: Image.asset(img,width: w,height: 400,fit: BoxFit.fill,),

      ),
    //  btnCancelOnPress: () {},
    //  btnOkOnPress: () {},
    )..show();
  }
  helpDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      dialogType: DialogType.INFO,
      animType: AnimType.BOTTOMSLIDE,
      title: 'المساعدة والدعم',
      desc: 'المساعدة والدعم',
    //  btnCancelOnPress: () {},
      btnOkOnPress: () {},
      btnOkColor: colors.primary,

    )..show();
  }
  logoutDialog(BuildContext context,Function function) {
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      dialogType: DialogType.WARNING,
      animType: AnimType.BOTTOMSLIDE,
      title: 'تسجيل الخروج',
      desc: 'هل تريد بالتأكيد تسجيل الخروج؟',
      btnCancelOnPress: () {},
     // btnOkColor: colors().primary,
      btnOkOnPress:function,
    )..show();
  }
  show(BuildContext context,String title,String description,String grade,int id,{Function function}) {
    AwesomeDialog(
      dismissOnBackKeyPress: false,
      aligment: Alignment.center,
      context: context,
      headerAnimationLoop: false,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      title: '$title',
      desc: '$description',
      btnOkOnPress: () {

        SharedPref().read("user").then((value){



          getResponseData().getDataWithToken(url: urls.result,token: value['token'],data: {"grade":grade,"training_id":"$id"});


        });


        Get.off(HomePage(title: Constant().app_name,));

      },
    )..show();
  }

policy (BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    animType: AnimType.SCALE,
    title: 'سياسة الخصوصية',
    desc: 'سياسة الخصوصية',
  //  autoHide: Duration(seconds: 2),
  )..show();
}
feedback (BuildContext context,{int id,}) {
  ProgressDialog pr;
  pr = ProgressDialog(
    context,
    type: ProgressDialogType.Normal,
    textDirection: TextDirection.rtl,
    isDismissible: true,
    customBody: Container(
      padding: EdgeInsets.all(20),
      height: 120,
      //width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(colors.primary),
            backgroundColor: colors.white,
          ),
          Text(""
              "جار التقييم..."
              "",style: Styles().consualtionStatisc(fsize: 14,mcolor: colors.primary),)

        ],
      ),
    ),
  );
  pr.style(
//      message: 'Downloading file...',
    message:

    "جار التقييم...",
    borderRadius: 20.0,
    backgroundColor: Colors.white,
    elevation: 10.0,
    insetAnimCurve: Curves.easeInOut,
    progressWidgetAlignment: Alignment.center,

    messageTextStyle: Styles().consualtionStatisc(fsize: 14,mcolor: colors.primary),
  );
  showDialog(
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: QuickFeedback(
          title: ' اكتب رأيك', // Title of dialog
          showTextBox: true, // default false

          textBoxHint:
          'اكتب تعليقك هنا  ', // Feedback text field hint text default: Tell us more
          submitText: 'إرسال', // submit button text default: SUBMIT
          onSubmitCallback: (feedback) {
           // print('$feedback'); // map { rating: 2, feedback: 'some feedback' }
          //  print(feedback['feedback']);
            if(feedback['feedback'].toString().trim().length>2){
              print(feedback['feedback']);
              var r=feedback['rating'];

              var msg=feedback['feedback'];
              if(r>0){
                pr.show();
                getResponseData().getDataWithToken(url: urls.ratecourse,token: TokenProvider.token,data: {"course_id":"$id","rating":"$r","message":msg}).then((value) {
pr.hide();
                  print(value);
                  mToast().show(context,msg: value.data['msg']);
                   Navigator.of(context).pop();

                });


              }
              else{
                mToast().show(context,msg: "يجب  التقييم أولا");

              }

 // print(FavProvider.token);

            }
            else{
mToast().show(context,msg: "يجب كتابة تعليق");

            }

            //  if(feedback['feedback'])
            // Navigator.of(context).pop();
          },
          askLaterText: 'الغاء ',

          onAskLaterCallback: () {
           //  Navigator.of(context).pop();

            //  print('Do something on ask later click');
          },
        ),
      );
    },
  );

  }
rateProduct (BuildContext context,{int id,}) {
  ProgressDialog pr;
  pr = ProgressDialog(
    context,
    type: ProgressDialogType.Normal,
    textDirection: TextDirection.rtl,
    isDismissible: true,
    customBody: Container(
      padding: EdgeInsets.all(20),
      height: 120,
      //width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(colors.primary),
            backgroundColor: Colors.white,
          ),
          Text(""
              "جار التقييم..."
              "",style: Styles().consualtionStatisc(fsize: 14,mcolor: colors.primary),)

        ],
      ),
    ),
  );
  pr.style(
//      message: 'Downloading file...',
    message:

    "جار التقييم...",
    borderRadius: 20.0,
    backgroundColor: Colors.white,
    elevation: 10.0,
    insetAnimCurve: Curves.easeInOut,
    progressWidgetAlignment: Alignment.center,

    messageTextStyle: Styles().consualtionStatisc(fsize: 14,mcolor: colors.primary),
  );
  showDialog(
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: QuickFeedback(

          title: ' اكتب رأيك', // Title of dialog
          showTextBox: true, // default false

          textBoxHint:
          'اكتب تعليقك هنا  ', // Feedback text field hint text default: Tell us more
          submitText: 'إرسال', // submit button text default: SUBMIT
          onSubmitCallback: (feedback) {
           // print('$feedback'); // map { rating: 2, feedback: 'some feedback' }
          //  print(feedback['feedback']);
            if(feedback['feedback'].toString().trim().length>2){
              print(feedback['feedback']);
              var r=feedback['rating'];

              var msg=feedback['feedback'];
              if(r>0){
                pr.show();
                getResponseData().getDataWithToken(url: urls.product_rate,token: TokenProvider.token,data: {"product_id":id,"rating":"$r","message":msg}).then((value) {
pr.hide();
                  print(value);
                  mToast().show(context,msg: value.data['msg']);
                   Navigator.of(context).pop();

                });


              }
              else{
                mToast().show(context,msg: "يجب  التقييم أولا");

              }

 // print(FavProvider.token);

            }
            else{
mToast().show(context,msg: "يجب كتابة تعليق");

            }

            //  if(feedback['feedback'])
            // Navigator.of(context).pop();
          },
          askLaterText: 'الغاء ',

          onAskLaterCallback: () {
           //  Navigator.of(context).pop();

            //  print('Do something on ask later click');
          },
        ),
      );
    },
  );

  }







}