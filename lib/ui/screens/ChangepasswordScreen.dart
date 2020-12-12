import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/providers/ContentProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/SplashPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/textForm.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';
import 'package:yemenwe/utils/userType.dart';
class ChangepasswordScreen extends StatefulWidget {

  @override
  _ChangepasswordScreenState createState() => _ChangepasswordScreenState();
}

class _ChangepasswordScreenState extends State<ChangepasswordScreen> {

  var selected=userType.user;

  TextEditingController oldpassController=TextEditingController();
  TextEditingController newpassController=TextEditingController();

var email="";
var phone="";

var oldpassword="";
var newpassword="";
var passwordVisible=false;
var isEmp=false;
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    print("rebuild");
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
//                         controller: oldpassController,
//
// validator: (val) =>val.length<6?"password too short":(){
//   oldpassword=val;
// },
//                         onChanged: (value){
//
//                           oldpassword=value;
//                         },
//                         maxLines: 1,
//                         decoration: InputDecoration(
//                             hintText: "كلمة المرور الحالية",
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
// controller: newpassController,
// validator: (val) =>val.length<6?"password too short":(){
//   newpassword=val;
// },
//                         onChanged: (value){
//
//                           newpassword=value;
//                         },
//                         maxLines: 1,
//                         decoration: InputDecoration(
//                             hintText: "كلمة المرور الجديدة",
//                             hintStyle: Styles().subTitleTextStyle10,
//                             border: InputBorder.none
//                         ),
//
//
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

textForm(title: "كلمة المرور القديمة",icon: EvaIcons.lockOutline,controller: oldpassController,),
textForm(title: "كلمة المرور الجديدة",icon: EvaIcons.lockOutline,controller: newpassController,),
        GestureDetector(
          onTap: (){
            print(newpassword);
            print(oldpassword);


            SharedPref().read( "user").then((value) {




              getResponseData().getDataWithToken2(token: value['token'],url: urls.changePassword,data:{"token":"${value['token']}","current_password":"$oldpassword","new_password":"$newpassword"}).then((value) {


                print(value.data);

//              print(value.data['msg']);
//              print(value.data['token']);

                //    try{

                if(value.data['status']) {
                  oldpassController.clear();
                  newpassController.clear();
                  mToast().show(context, msg: value.data['msg']);
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

            child: Text(" تغيير ",style: Styles().TitleTextStyle16WhiteBold,),
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
