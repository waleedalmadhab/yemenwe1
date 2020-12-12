import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/User.dart';
import 'package:yemenwe/providers/ContentProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/RegisterPage.dart';
import 'package:yemenwe/ui/pages/SplashPage.dart';
import 'package:yemenwe/ui/screens/RegisterScreen.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/textForm.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';
import 'package:yemenwe/utils/userType.dart';
class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  ProgressDialog pr;


  var selected=userType.user;

var email="";
var phone="";

var password="";
var passwordVisible=false;
TextEditingController emailtextEditingController=TextEditingController();
TextEditingController passwordtextEditingController=TextEditingController();

var isEmp=false;
  @override
  Widget build(BuildContext context) {



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
                "جار  تسجيل الدخول"
                "",style: Styles().consualtionStatisc(fsize: 14,mcolor: colors.primary,))

          ],
        ),
      ),
    );
    pr.style(
//      message: 'Downloading file...',
      message:

      "جار  تسجيل الدخول",
      borderRadius: 20.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progressWidgetAlignment: Alignment.center,

      messageTextStyle: Styles().consualtionStatisc(fsize: 14,mcolor: colors.primary),
    );

    var screenSize=MediaQuery.of(context).size;
    print("rebuild");
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(

          mainAxisSize: MainAxisSize.max,
          children: <Widget>[


textForm(controller:emailtextEditingController ,icon: EvaIcons.emailOutline,title: "الإيميل أو رقم الهاتف",),
textForm(controller:passwordtextEditingController ,icon: EvaIcons.lockOutline,title: "كلمة المرور",ispassword: true,),

//
// // email
//        Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//
//               border: Border.symmetric(
//                 vertical: BorderSide(color: Colors.grey[350],width: 2),
//                 horizontal: BorderSide(color: Colors.grey[350],width: 2),
//               )
//           ),
//           padding: EdgeInsets.all(0),
//           margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
//           child: Directionality(
//             textDirection: TextDirection.rtl,
//             child: Row(
//               children: <Widget>[
//                 Container(
//                     margin: EdgeInsets.only(top: 3,bottom: 3),
//                     decoration: BoxDecoration(
//
//
//                         border: Border(left: BorderSide(color: Colors.grey[350],width: 2))
//                     ),
//                     width: 50,
//                     height: 38,
//                     child: Icon(Icons.email,color: Colors.black54,)),
//
//
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.only(left: 10,right: 10),
//                     height: 40,
//
//                     child: TextFormField(
//
//                       onChanged: (value){
//
//                         email=value;
//                       },
//                       maxLines: 1,
//                       decoration: InputDecoration(
//                           hintText:  "الإيميل أو رقم الهاتف",
//                           hintStyle: Styles().subTitleTextStyle10,
//                           border: InputBorder.none
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//
//         //password
//           Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//
//                 border: Border.symmetric(
//                   vertical: BorderSide(color: Colors.grey[350],width: 2),
//                   horizontal: BorderSide(color: Colors.grey[350],width: 2),
//                 )
//             ),
//             padding: EdgeInsets.all(0),
//             margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
//             child: Directionality(
//               textDirection: TextDirection.rtl,
//               child: Row(
//                 children: <Widget>[
//                   Container(
//                       margin: EdgeInsets.only(top: 3,bottom: 3),
//                       decoration: BoxDecoration(
//
//
//                           border: Border(left: BorderSide(color: Colors.grey[350],width: 2))
//                       ),
//                       width: 50,
//                       height: 50,
//                       child: Icon(Icons.lock,color: Colors.black54,)),
//
//
//                   Expanded(
//                     child: Container(
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.only(left: 10,right: 10),
//                       height: 40,
//
//                       child: TextFormField(
//
// validator: (val) =>val.length<6?"password too short":(){
//   password=val;
// },
//                         onChanged: (value){
//
//                           password=value;
//                         },
//                         maxLines: 1,
//                         obscureText: !passwordVisible,
//                         decoration: InputDecoration(
//                             suffixIcon: GestureDetector(
//                                 onTap: (){
//                                   setState(() {
//                                     passwordVisible=!passwordVisible;
//                                   });
//                                 },
//
//                                 child: Icon( !passwordVisible?Icons.visibility_off: Icons.visibility,color: Colors.black54,)),
//                             hintText: "كلمة المرور",
//                             hintStyle: Styles().subTitleTextStyle10,
//                             border: InputBorder.none
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),


          GestureDetector(
            onTap: (){
              print(email);
              print(phone);
              print(password);
pr.show();
              getResponseData().Login(url: urls.login,phone: emailtextEditingController.text ,pass: passwordtextEditingController.text).then((value) {


pr.hide();
print(value.data);

//              print(value.data['msg']);
//              print(value.data['token']);

            //    try{


                  if(value.data['status']==true){

//                  pr.hide();


                  var deptid="";
                  var deptname="";
                  var jobid="";
                  var jobname="";
                    mToast().show(context,msg: "تم تسجيل الدخول بنجاح");
                    var token=(value.data['data']['token']);
                    var name=(value.data['data']['userData']['name']);
                    var phone=(value.data['data']['userData']['phone']);
                    var email=(value.data['data']['userData']['email']);
                    var type=(value.data['data']['userData']['type']);
                   if(type=="employees") {
                     deptid =
                     (value.data['data']['userData']['department']['id'].toString()) ;
                     deptname =
                         (value.data['data']['userData']['department']['name']) ;
                     jobid =
                         (value.data['data']['userData']['job']['id'].toString()) ;
                     jobname =
                         (value.data['data']['userData']['job']['name']) ;
                   }
                    print(type);
var user=User();

user.token=token;
user.name=name;
user.phone=phone.toString();
user.email=email;
user.type=type;
user.deptID=deptid;
user.deptName=deptname;
user.jobId=jobid;
user.jobName=jobname;
                    SharedPref().setInt(key: "login",value: 1);
                    SharedPref().save( "user",user);

                    SharedPref().read("user").then((value) {


if(value!=null){


  mToast().show(context,msg: "تم تسجيل الدخول بنجاح");
        Get.off(SplashPage());


}



                    });

//                  SharedPref().setString(key: "name",value: name);
//                  SharedPref().setString(key: "type",value: type);
//                  SharedPref().setString(key: "phone",value: phone.toString());
//                  SharedPref().setString(key: "email",value: email);
                  //  Provider.of<ContentProvider>(context,listen: false).update();
                //    Get.off(SplashPage());


                  }
                  else{
                    mToast().show(context,msg: value.data['msg']);

                  }



//                if(value.data['data']['token']!=null){
//
//                  SharedPref().setInt(key: "login",value: 1);
//                  SharedPref().setString(key: "token",value: token);
//                  SharedPref().setString(key: "name",value: name);
//                  SharedPref().setString(key: "phone",value: phone);
//                  SharedPref().setString(key: "email",value: email);
//                  Provider.of<ContentProvider>(context,listen: false).update();
//                  mToast().show(context,msg: "تم تسجيل الدخول بنجاح");
//                  Get.back();
//
//
//                }

             //   }catch(e){print(e);}


              });

            },

            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: colors.primary,
                  borderRadius: BorderRadius.circular(5)
              ),
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),

              child: Text("تسجيل الدخول",style: Styles().TitleTextStyle16WhiteBold,),
            ),
          )


,            Container(
        child: RichText(
          text: new TextSpan(
              text: "ليس لديك حساب ؟",
              style: Styles().consualtionStatiscNormalFont(fsize: 10),

              children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()..onTap=(){

                      Get.to(RegisterPage());

                    },
                    text: "   إنشاء حساب  ",
                    style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.primary)
                ),
              ]),
        ),
      ),



            Container(height: 60,)
        ],),
      ),
    );
  }

  Widget inputField({String lable,String hint,IconData iconData,String  data=""}) {

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),

          border: Border.symmetric(
            vertical: BorderSide(color: Colors.grey[350],width: 2),
            horizontal: BorderSide(color: Colors.grey[350],width: 2),
          )
      ),
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 3,bottom: 3),
                decoration: BoxDecoration(


                    border: Border(left: BorderSide(color: Colors.grey[350],width: 2))
                ),
                width: 50,
                height: 38,
                child: Icon(iconData,color: Colors.black54,)),


            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 10,right: 10),
                height: 40,

                child: TextFormField(
                  onChanged: (value){

                    data=value;
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: Styles().subTitleTextStyle10,
                      border: InputBorder.none
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
