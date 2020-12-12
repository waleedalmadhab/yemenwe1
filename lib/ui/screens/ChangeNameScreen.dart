import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
import 'package:yemenwe/ui/pages/SplashPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/textForm.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';
import 'package:yemenwe/utils/userType.dart';
class ChangeNameScreen extends StatefulWidget {

  @override
  _ChangeNameScreenState createState() => _ChangeNameScreenState();
}

class _ChangeNameScreenState extends State<ChangeNameScreen> {

  ProgressDialog pr;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SharedPref().read( "user").then((value) {


      name=value['name'];
      nameController.text=name;
    });


  }

  TextEditingController nameController=TextEditingController();

  var selected=userType.user;

var name="";
var phone="";

var oldpassword="";
var newpassword="";
var passwordVisible=false;
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
                "جار  تعديل الاسم"
                "",style: Styles().consualtionStatisc(fsize: 14,mcolor: colors.primary),)

          ],
        ),
      ),
    );
    pr.style(
//      message: 'Downloading file...',
      message:

      "جار   تعديل الاسم",
      borderRadius: 20.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progressWidgetAlignment: Alignment.center,

      messageTextStyle: Styles().consualtionStatisc(fsize: 14,mcolor: colors.primary),
    );

    return SingleChildScrollView(
      child: Column(

        mainAxisSize: MainAxisSize.max,
        children: <Widget>[





        //password
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
//                       height: 38,
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
//                         style: Styles().consualtionStatiscNormalFont(fsize: 14,),
//                         controller: nameController,
//
// validator: (val) =>val.length<3?"name too short":(){
//   name=val;
// },
//                         onChanged: (value){
//
//                           name=value;
//                         },
//                         maxLines: 1,
//                         decoration: InputDecoration(
//                             hintText: "",
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

textForm(icon:EvaIcons.personOutline,title: "الاسم",controller: nameController,),

        GestureDetector(
          onTap: (){
            print(name);
            print(oldpassword);
pr.show();
           SharedPref().read( "user").then((value) {
//pr.hide();

             getResponseData().getDataWithToken2(token: value['token'],url: urls.update_user,data:{"name":"${nameController.text}"}).then((value) {


               print(value.data);

//              print(value.data['msg']);
//              print(value.data['token']);

               //    try{

           //    mToast().show(context,msg: value.data['msg']);

               if(value.data['status']){
pr.hide();
                     mToast().show(context,msg: "تم تعديل الاسم بنجاح");


                     var current=SharedPref().read("user").then((mvalue) {
                       var user=User();

                       user.token=mvalue['token'];
                       user.name=value.data['user']['name'];
                       user.email=mvalue['email'];
                       user.phone=mvalue['phone'];
                       user.type=mvalue['type'];

                       SharedPref().save("user",user);

                       nameController.clear();
                       Provider.of<ContentProvider>(context,listen: false).update();

                     });


               }


             });

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

            child: Text("تعديل",style: Styles().TitleTextStyle16WhiteBold,),
          ),
        )




          ,
          Container(height: 60,)
      ],),
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
