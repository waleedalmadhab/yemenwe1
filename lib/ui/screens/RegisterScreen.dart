
import 'package:custom_dialog/custom_dialog.dart';
import 'package:flutter/services.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:yemenwe/utils/Toast.dart';
import 'package:yemenwe/utils/userType.dart';
class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {


  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';


  ProgressDialog pr;

  TextEditingController name_con=TextEditingController();
  TextEditingController phone_con=TextEditingController();
  TextEditingController email_con=TextEditingController();
  TextEditingController pass_con=TextEditingController();
  TextEditingController repass_con=TextEditingController();
  TextEditingController dest_con=TextEditingController();

  var selected=userType.user;
var type="visitor";
var share_user_type="copartner";
  var name="";

var email="";
var phone="";
var destnation="";


var password="";

var repassword="";

var passwordVisible=false;
var repasswordVisible=false;

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
              valueColor: AlwaysStoppedAnimation<Color>(colors.brown),
              backgroundColor: Colors.white,
            ),
            Text(""
                "جار إنشاء الحساب"
                "",style: Styles().consualtionStatisc(fsize: 14,mcolor: colors.brown),)

          ],
        ),
      ),
    );
    pr.style(
//      message: 'Downloading file...',
      message:

"جار إنشاء الحساب",
      borderRadius: 20.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progressWidgetAlignment: Alignment.center,

      messageTextStyle: Styles().consualtionStatisc(fsize: 14,mcolor: colors.brown),
    );

    var screenSize=MediaQuery.of(context).size;
    print("rebuild");
    return Card(
      margin: EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Column(



          children: <Widget>[

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(

                decoration: BoxDecoration(

                    border: Border.all(width: 2,color: colors.brown),
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Container(

                      decoration: BoxDecoration(

                          border: Border(left: BorderSide(color:  colors.brown,width: 1)),

                          color: selected!=userType.user ?Colors.white:colors.brown
                      ),


                      child:           GestureDetector(
                        onTap: (){
                          setState(() {
                            selected=userType.user ;
                          type="visitor";
                          share_user_type="";
                          });
                        },

                        child: Container(
                          alignment: Alignment.center,


                          child: Text(" مستخدم",style:selected!=userType.user ?Styles().TitleTextStyle14Black : Styles().TitleTextStyle16WhiteBold,),
                        ),
                      )
                      ,
                    )),
                    Expanded(child: Container(

                      decoration: BoxDecoration(

                          border: Border(left: BorderSide(color:  colors.brown,width: 1)),

                          color: selected!=userType.seller ?Colors.white:colors.brown
                      ),


                      child:           GestureDetector(
                        onTap: (){
                          setState(() {
                            selected=userType.seller ;
                          type="seller";
                          share_user_type="";
                          });
                        },

                        child: Container(
                          alignment: Alignment.center,


                          child: Text(" تاجر",style:selected!=userType.seller ?Styles().TitleTextStyle14Black : Styles().TitleTextStyle16WhiteBold,),
                        ),
                      )
                      ,
                    )),
                    Expanded(child: Container(

                      decoration: BoxDecoration(
                          border: Border(left: BorderSide(color:  colors.brown,width: 1)),

                          color: selected!=userType.copratener ?Colors.white:colors.brown
                      ),


                      child:           GestureDetector(
                        onTap: (){
                          setState(() {
                            selected=userType.copratener ;

                          type="share_user";
                          share_user_type="copartner";
                          });
                        },

                        child: Container(
                          alignment: Alignment.center,


                          child: Text(" شريك",style:selected!=userType.copratener ?Styles().TitleTextStyle14Black : Styles().TitleTextStyle16WhiteBold,),
                        ),
                      )
                      ,
                    )),
                    Expanded(child: Container(

                      decoration: BoxDecoration(
                          border: Border(left: BorderSide(color:  colors.brown,width: 1)),
                          color: selected!=userType.cluster ?Colors.white:colors.brown
                      ),


                      child:           GestureDetector(
                        onTap: (){
                          setState(() {
                            selected=userType.cluster ;

                          type="share_user";
                          share_user_type="sub_cluster";
                          });
                        },

                        child: Container(
                          alignment: Alignment.center,


                          child: Text(" عضو كتلة",style:selected!=userType.cluster ?Styles().TitleTextStyle14Black : Styles().TitleTextStyle16WhiteBold,),
                        ),
                      )
                      ,
                    )),


                  ],
                ),
              ),
            ),



          //name

          Container(
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
                      child: Icon(Icons.person,color: Colors.black54,)),


                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      height: 40,

                      child: TextFormField(
                        controller: name_con,
                        onChanged: (value){

                          name=value;
                        },
                        maxLines: 1,
                        decoration: InputDecoration(
                            hintText: "الاسم",
                            hintStyle: Styles().subTitleTextStyle10,
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // phone
          Container(
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
                      child: Icon(Icons.phone_android,color: Colors.black54,)),


                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      height: 40,

                      child: TextFormField(
                        controller: phone_con,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly

                        ],
                        onChanged: (value){

                          phone=value;
                        },
                        maxLines: 1,
                        decoration: InputDecoration(
                            hintText: "رقم الهاتف",
                            hintStyle: Styles().subTitleTextStyle12,
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),



            selected!=userType.user?   Container(
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
                        child: Icon(Icons.email,color: Colors.black54,)),


                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 10,right: 10),
                        height: 40,

                        child: TextFormField(
                          controller: email_con,

                          onChanged: (value){

                            email=value;
                          },
                          maxLines: 1,

                          decoration: InputDecoration(
                              hintText: "الإيميل",
                              hintStyle: Styles().subTitleTextStyle10,
                              border: InputBorder.none
                          ),
                          inputFormatters: [BlacklistingTextInputFormatter(

                              new RegExp(r"\s\b|\b\s")
                          )],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ):
            Container(),

            selected==userType.copratener||selected==userType.cluster?   Container(
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
                        child: Icon(Icons.local_florist,color: Colors.black54,)),


                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 10,right: 10),
                        height: 40,

                        child: TextFormField(
controller: dest_con,
                          onChanged: (value){

                            destnation=value;
                          },
                          maxLines: 1,
                          decoration: InputDecoration(
                              hintText: "الجهة",
                              hintStyle: Styles().subTitleTextStyle10,
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ):
            Container(),

      //password
          Container(
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
                      child: Icon(Icons.lock,color: Colors.black54,)),


                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      height: 40,

                      child: TextFormField(
controller: pass_con,
                        onChanged: (value){

                          password=value;
                        },
                        maxLines: 1,
                        obscureText: !passwordVisible,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  passwordVisible=!passwordVisible;
                                });
                              },

                              child: Icon( !passwordVisible?Icons.visibility_off: Icons.visibility,color: Colors.black54,)),
                            hintText: "كلمة المرور",
                            hintStyle: Styles().subTitleTextStyle10,
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // repassword
            Container(
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
                        child: Icon(Icons.lock,color: Colors.black54,)),


                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 10,right: 10),
                        height: 40,

                        child: TextFormField(
controller: repass_con,
                          onChanged: (value){

                            repassword=value;
                          },
                          maxLines: 1,
                          obscureText: !repasswordVisible,
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      repasswordVisible=!repasswordVisible;
                                    });
                                  },

                                  child: Icon( !repasswordVisible?Icons.visibility_off: Icons.visibility,color: Colors.black54,)),
                              hintText: "تأكيد كلمة المرور",
                              hintStyle: Styles().subTitleTextStyle10,
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),


          GestureDetector(
            onTap: (){


              pr.show();



print(type);
              print("+++++++++++++++++++++++++");


            //  whitespace.trimLeadingFrom(input);   // trim from beginning
              //whitespace.trimTrailingFrom(input)

print(trim(email, " ").length);
print("+++++++++++++++++++++++++");
//var c=email.toString().substring(0,email.length-2).trim();
//var n=c.toString().length;
//print("c=$c");
//print("n=$n");
print(phone);

              getResponseData().getData(url: urls.register,data: {"name":"${name.trim()}","phone":"$phone",  "email"  :  selected!=userType.user? "${email.trim()}":null,"password":"$password","userType":"$type","share_user_type":"$share_user_type","destination":"${destnation.trim()}"}).then((value) {

                print(value.data['msg']);

                if(value.data['status']==true){
                //  mToast().show(context,msg: value.data['msg'].toString());

                  pr.hide();

                  showDialog(
                    context: context,
                    builder: (context) => CustomDialog(
                      content: Text(
                        ''+value.data['msg'],

                        textAlign: TextAlign.center,
                        style: Styles().TitleTextStyle16Black,

                      ),
                      title: Text('إنشاء الحساب ',style: Styles().TitleTextStyle14Black,),
                      firstColor: Color(0xFF3CCF57),
                      secondColor: Colors.white,
                      headerIcon: Icon(
                        Icons.check_circle_outline,
                        size: 120.0,
                        color: Colors.white,
                      ),
                    ),
                  );

                  name_con.clear();
                  email_con.clear();
                  phone_con.clear();
                  pass_con.clear();
                  repass_con.clear();
                  dest_con.clear();



                }
                else{
                  showDialog(
                    context: context,
                    builder: (context) => CustomDialog(
                      content: Text(
                        ''+value.data['msg'],
                        textAlign: TextAlign.center,
                        style: Styles().TitleTextStyle16Black,
                      ),
                      title: Text('إنشاء الحساب ',style: Styles().TitleTextStyle14Black,),
                      firstColor: Colors.red,
                      secondColor: Colors.white,
                      headerIcon: Icon(
                        Icons.error_outline,
                        size: 120.0,
                        color: Colors.white,
                      ),
                    ),
                  );
                }

              });

              print(name);
              print(email);
              print(password);
            },

            child: Container(
alignment: Alignment.center,
decoration: BoxDecoration(
  color: colors.primary,
borderRadius: BorderRadius.circular(5)
),
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),

              child: Text(" إنشاء الحساب",style: Styles().TitleTextStyle16WhiteBold,),
            ),
          )



          ,Container(height: 50,)


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


  String trimLeft(String from, String pattern){
    if( (from??'').isEmpty || (pattern??'').isEmpty || pattern.length>from.length ) return from;

    while( from.startsWith(pattern) ){
      from = from.substring(pattern.length);
    }
    return from;
  }

  String trimRight(String from, String pattern){
    if( (from??'').isEmpty || (pattern??'').isEmpty || pattern.length>from.length ) return from;

    while( from.endsWith(pattern) ){
      from = from.substring(0, from.length-pattern.length);
    }
    return from;
  }

  String trim(String from, String pattern){
    return trimLeft(trimRight(from, pattern), pattern);
  }

}
