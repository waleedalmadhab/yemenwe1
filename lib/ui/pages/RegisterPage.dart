import 'package:custom_dialog/custom_dialog.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/AccountPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/tabButton.dart';
import 'package:yemenwe/ui/widgets/textForm.dart';
import 'package:yemenwe/utils/MQSize.dart';
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>  {

  TextEditingController nametextEditingController=TextEditingController();
  TextEditingController phonetextEditingController=TextEditingController();
  TextEditingController emailtextEditingController=TextEditingController();
  TextEditingController passwordtextEditingController=TextEditingController();
  TextEditingController repasswordtextEditingController=TextEditingController();
  TextEditingController locationinfotextEditingController=TextEditingController();
  TextEditingController destnationtextEditingController=TextEditingController();
bool  gender=true;
  dynamic selectedGov;
  dynamic selectedDistic;

  List<dynamic> govs=[];
  List<dynamic> distinicts=[];

  getGovs()async{

    getResponseData().getData(url: urls.get_gov).then((value) {

      // var data = json.decode(value.data.toString());

      var d = value.data['data'] as List;
      //  print(d);
      govs.clear();
      d.forEach((element) {

        govs.add({"id":element['id'],"name":element['name_ar']});

      });
      setState(() {
        selectedGov=govs[0]['id'];
        getDis();
      });
      print("govs length=${govs.length}");
    });

  }
  getDis()async{

    getResponseData().getData(url: urls.get_district,data: {"gov_id":selectedGov}).then((value) {

      // var data = json.decode(value.data.toString());

      var d = value.data['data'] as List;
      //  print(d);
      distinicts.clear();
      d.forEach((element) {

        distinicts.add({"id":element['id'],"name":element['name_ar']});

      });
      setState(() {
        selectedDistic=distinicts[0]['id'];
      });
      print("govs length=${distinicts.length}");
    });

  }



  int index=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGovs();

  }
  ProgressDialog pr;

  var type="visitor";
  var share_user_type="copartner";

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


    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 4,

        child: Scaffold(
          appBar: AppBar(title: Text("إنشاء حساب"),centerTitle: true,),
          body: SingleChildScrollView(child: Column(children: <Widget>[


            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              height: 150,
              width: MQSize.width,
              child: Image.asset("images/newlogo.png",width: 100,height: 100,),),


            Container(
              margin: EdgeInsets.only(bottom: 10),
              color: colors.white,
              child: TabBar(

                onTap: (i){
                  setState(() {
                    index=i;
                    switch(i){

                      case 0:{
                        type="customer";
                        share_user_type="";
                      }
                      break;
                      case 1:{
                        type="visitor";
                        share_user_type="";
                      }
                      break;
                      case 2:{
                        type="share_user";
                        share_user_type="copartner";
                      }
                      break;
                      case 3:{
                        type="share_user";
                        share_user_type="sub_cluster";
                      }
                      break;

                    }

                  });
                },
                labelPadding: EdgeInsets.symmetric(horizontal: 10),
                  unselectedLabelColor: colors.grey,
                  labelColor: colors.primary,
                  labelStyle: Styles().consualtionStatisc(fsize: 12,mcolor: colors.primary),
                  unselectedLabelStyle: Styles().consualtionStatiscNormalFont(fsize: 12,mcolor: colors.grey),
                  indicatorColor: colors.primary,
indicatorWeight: 0.1,
                  tabs: [
                Container(
                  width: MQSize.width,
                  child: tabButton(title: "متسوق",selected: index==0?true:false,),),
                    Container(child: tabButton(title: "متدرب",selected: index==1?true:false,),),
                    Container(child: tabButton(title: "شريك",selected: index==2?true:false,),),
                    Container(child: tabButton(title: "عضو كتلة",selected: index==3?true:false,),),


              ]),
            )
,
textForm(title: "الاسم",icon:EvaIcons.personOutline,controller: nametextEditingController,),

Card(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),

  child: Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Row(

      children: <Widget>[
        Container(child: Text("الجنس:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.primary),),),

        Expanded(child: RadioListTile(
          title: Text("ذكر"),


            value: true, groupValue: gender, onChanged: (g){
          setState(() {
            gender=g;
          });

        })),
        Expanded(child: RadioListTile(
          title: Text("أنثى"),

            value: false, groupValue: gender, onChanged: (g){
          setState(() {
            gender=g;
          });

        })),


      ],

    ),
  ),
),

textForm(title: "كلمة المرور",icon:EvaIcons.lockOutline,controller: passwordtextEditingController,ispassword: true,),
// textForm(title: "تأكيد كلمة المرور",icon:EvaIcons.lockOutline,controller: repasswordtextEditingController,ispassword: true,),
textForm(title: "الإيميل",icon:EvaIcons.emailOutline,controller: emailtextEditingController,),
 index==2||index==3?  textForm(title: "الجهة",icon:EvaIcons.flagOutline,controller: destnationtextEditingController,):Container(),
textForm(title: "رقم الهاتف",icon:EvaIcons.phoneOutline,controller: phonetextEditingController,isnumber: true,),


            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),

              child: Container(
                padding: EdgeInsets.symmetric( horizontal: 20,),

                child: Row(children: <Widget>[
                  Expanded(child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("المحافظة:",textAlign: TextAlign.right,style: Styles().consualtionStatisc(fsize: 10,mcolor: colors.primary),))),

                  Expanded(

                    flex: 2,
                    child:      govs.length!=null&&govs.length>0?     DropdownButton(


                        isExpanded: true,
                        //  isExpanded: true,

                        value:selectedGov ,



                        items: govs.map((e) {

                          //      print(e);

                          return DropdownMenuItem(

                              value: e['id'],

                              child: Text( e['name'].toString(),overflow: TextOverflow.ellipsis,));



                        }).toList(), onChanged: (val){



                      setState(() {

                        selectedGov=val;
                        getDis();
                      });



                    }):Container(),
                  ),


                ],),
              ),
            ),

            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),

              child: Container(
                padding: EdgeInsets.symmetric( horizontal: 20,),

                child: Row(children: <Widget>[

                  Expanded(
                    child:
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),

                        child: Text("المديرية:",textAlign: TextAlign.right,style: Styles().consualtionStatisc(fsize: 10,mcolor: colors.primary),)),
                  ),

                  Expanded(
                    flex: 2,
                    child:        distinicts.length!=null&&distinicts.length>0?     DropdownButton(
                        isExpanded: true,

                        value:selectedDistic ,



                        items: distinicts.map((e) {

                          //      print(e);

                          return DropdownMenuItem(

                            value: e['id'],

                            child: Text( e['name'].toString(),overflow: TextOverflow.ellipsis,),);



                        }).toList(), onChanged: (val){



                      setState(() {

                        selectedDistic=val;
                      });



                    }):Container(),
                  ),

                ],),
              ),
            )

            ,

            textForm(title: "تفاصيل العنوان - الشارع - المنطقة",icon:Ionicons.location_outline,controller: locationinfotextEditingController,),


            GestureDetector(

              onTap: (){

                pr.show();

                getResponseData().getData(url: urls.register,data: {"name":"${nametextEditingController.text.toString().trim()}","gender":gender?"male":"female","gov_id":selectedGov,"district_id":selectedDistic,"more_address_info":locationinfotextEditingController.text,"phone":"${phonetextEditingController.text}",  "email"  :  emailtextEditingController.text,"password":"${passwordtextEditingController.text}","userType":"$type","share_user_type":"$share_user_type","destination":"${destnationtextEditingController.text.toString().trim()}"}).then((value) {

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

                    nametextEditingController.clear();
                    emailtextEditingController.clear();
                    phonetextEditingController.clear();
                    passwordtextEditingController.clear();
                    repasswordtextEditingController.clear();
                    destnationtextEditingController.clear();
                    locationinfotextEditingController.clear();

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

              },

              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                decoration: BoxDecoration(
                  color: colors.primary,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Text("تسجيل",style: Styles().consualtionStatisc(fsize: 14,mcolor: colors.white),),
              ),
            ),


            Container(
              child: RichText(
                text: new TextSpan(
                    text: "لديك حساب مسبقا؟",
                  style: Styles().consualtionStatiscNormalFont(fsize: 10),

                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()..onTap=(){

                          Get.to(AccountPage(islogin: true,));

                        },
                        text: "  تسجيل الدخول  ",
                        style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.primary)
                    ),
                ]),
              ),
            ),


            Container(height: 50,)

          ],),),
        ),
      ),
    );
  }
}
