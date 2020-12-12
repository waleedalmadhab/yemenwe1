import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/route_manager.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/AccountPage.dart';
import 'package:yemenwe/ui/pages/Favpage.dart';
import 'package:yemenwe/ui/pages/MyConsulationsPage.dart';
import 'package:yemenwe/ui/pages/MyCourses.dart';
import 'package:yemenwe/ui/pages/PrivacyPolicyPage.dart';
import 'package:yemenwe/ui/pages/ProfilePage.dart';
import 'package:yemenwe/ui/pages/RegisterPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/listTileAcountItem.dart';
import 'package:yemenwe/utils/Login.dart';
import 'package:yemenwe/utils/MQSize.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';
import 'package:yemenwe/utils/launcher.dart';

import 'dialogs.dart';
class myDrawer extends StatelessWidget {

  divider(){

    return         Divider(height: 5,endIndent: 50,
      indent: 20,
      thickness: 1,
      color: Colors.grey[300],
    );


  }


  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;

    return Drawer(

      child: Card(
        margin: EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Column(


            children: <Widget>[



              Container(

                child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child:
                    FutureBuilder(
                      future: SharedPref().read("user" ),
                      builder: (context,snapshot){


                        return  snapshot.data!=null? Container(
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: colors.grey))),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                         //       Container(height: 30,),

                                Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [

                                            colors.primary,
                                            colors.primary


                                          ]
                                      )
                                  ),

                                  height: 200,
                                  width: MQSize.width,


                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 50),
                                        width: 100,
                                        height: 100,

                                        padding: EdgeInsets.all(20),

                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: colors.white
                                        ),

                                        child:
                                        //Icon(Ionicons.person_circle_outline,size: 80,color: colors().secondry2.withOpacity(0.9),)

                                        Image.asset("images/user.png",width: 70,height: 70,),


                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                        child: Text("${ snapshot.data['name'].toString()}",textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: Styles().consualtionStatiscNormalFont(fsize: 16,mcolor: colors.white)),
                                      ),
                                    ],
                                  ),

                                ),

                           //     Image.asset("images/user.png",width: 50,height: 50,),


//                                Padding(
//                                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
//                                  child: Text("${ snapshot.data['phone'].toString()}",textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: Styles().consualtionStatisc(fsize: 12,mcolor: colors().grey)),
//                                ),
                                snapshot.data['email']!=null?     Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                  child: Text("${ snapshot.data['email'].toString()}",textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.grey)),
                                ):Container(),




                                Container(
                                  decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: colors.grey))),


                                  //  decoration: BoxDecoration(border: Border.all(width: 1,color: colors().bg3)),
                                  //    margin: EdgeInsets.all(5),
                                  child: Stack(
                                    overflow: Overflow.visible,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Container(

                                            child: Container(
                                              width: w,
                                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),

                                              child: Text("الحساب",textAlign: TextAlign.right ,style: Styles().consualtionStatisc(fsize: 13),),

                                            ),
                                          ),



                                          Container(
                                            alignment: Alignment.center,
                                            //  decoration: BoxDecoration(border: Border( top: BorderSide( width: 2,color: colors().bg3))),

                                            child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[


                                                  listTileAccountItem(title:"حسابي",img: "user.png" ,iconData:Ionicons.person_circle_outline ,color:colors.grey ,function: (){


                                                    Get.to(ProfilePage(info: true,));



                                                  },),
                                                  divider(),
                                                  listTileAccountItem(title:"استشاراتي" ,iconData:CupertinoIcons.conversation_bubble ,color:colors.grey ,function: (){

                                                    SharedPref().read( "user").then((value) {



                                                      Get.to(MyConsulationsPage(token: value['token'],));

                                                    });

                                                  },),
                                                  divider(),

                                                  listTileAccountItem(title:"الكورسات المفضلة",img: "" ,iconData:CupertinoIcons.heart ,color:colors.grey ,function: (){

                                                    SharedPref().read( "user").then((value) {

                                                      Get.to(FavPage(token: value['token'],));

                                                    });


                                                  },),
                                                  divider(),

                                                  //  listTileAccountItem(title:"تغيير كلمة المرور" ,iconData:Icons.lock_open ,color:colors().grey ,),
                                                  // divider(),
//                                   listTileAccountItem(title:"المفضلة" ,iconData:Icons.favorite_border ,color:colors().grey ,function: (){
//
//
//                                     Get.to(FavPage());
//
//                                   },),
//                                   divider(),


                                                  listTileAccountItem(title:" كورساتي" ,iconData:CupertinoIcons.book ,color:colors.grey ,function: (){

                                                    SharedPref().read( "user").then((value) {

                                                      Get.to(MyCourses(token: value['token'],));

                                                    });

                                                  },),

                                                  // divider(),
                                                  // listTileAccountItem(title:"الكورسات المكتملة" ,iconData:EvaIcons.bookOutline ,color:colors().grey ,function: (){
                                                  //
                                                  //   print(TokenProvider.token);
                                                  //
                                                  //   // SharedPref().read( "user").then((value) {
                                                  //   //
                                                  //   //   Get.to(MyCourses(token: value['token'],));
                                                  //   //
                                                  //   // });
                                                  //
                                                  // },),

                                                  divider(),
                                                  listTileAccountItem(title:"تسجيل الخروج",img: "logout.png" ,iconData:Icons.exit_to_app ,color:colors.grey ,function: (){


                                                    dialogs().logoutDialog(context, (){


                                                      SharedPref().setInt(key: "login",value: 0);
                                                      SharedPref().remove("user");
                                                      TokenProvider.token="";
                                                      // SharedPref().setString(key: "token",value: "");
                                                      //  SharedPref().setString(key: "type",value: "visitor");
                                                      // SharedPref().setString(key: "name",value: "");
                                                      //   SharedPref().setString(key: "email",value: "");
                                                      //       Get.off(SplashPage());

                                                      Phoenix.rebirth(context);

                                                      //  Provider.of<ContentProvider>(context,listen: false).update();

                                                      mToast().show(context,msg: "تم تسجيل الخروج بنجاح");

                                                    });



                                                  },),


//                              Container(
//
//                                  decoration: BoxDecoration(border: Border(right: BorderSide(width: 2,color: colors().bg3))),
//                                  child: categoryCardWithIcon("المفضلة", colors().grey, Icons.favorite_border, (){})),
//
//                              Container(
//
//                                  decoration: BoxDecoration(border: Border(right: BorderSide(width: 2,color: colors().bg3))),
//                                  child: categoryCardWithIcon("تغيير كلمة المرور", colors().grey, Icons.lock_open, (){})),
//                              Container(
//
//                                  child: categoryCardWithIcon("معلوماتي", colors().grey, Icons.account_circle, (){})),


                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),





                                    ],
                                  ),
                                )







                              ],
                            )):Container(
                          child:                          Container(
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: colors.grey))),


                            //  decoration: BoxDecoration(border: Border.all(width: 1,color: colors().bg3)),
                            //    margin: EdgeInsets.all(5),
                            child: Stack(
                              overflow: Overflow.visible,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [

                                                colors.primary,
                                                colors.primary


                                              ]
                                          )
                                      ),

                                      height: 200,
                                      width: MQSize.width,


                                      alignment: Alignment.center,
                                      child: Container(width: 100,
                                        height: 100,

                                        padding: EdgeInsets.all(10),

                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: colors.white
                                        ),

                                        child: Image.asset("images/newlogo.png",width: 90,height: 90,),


                                      ),

                                    ),

                                //    Container(height: 50,),


                                    Container(

                                      child: Container(
                                        width: w,
                                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),

                                        child: Text("الحساب",textAlign: TextAlign.right ,style: Styles().consualtionStatisc(fsize: 13),),

                                      ),
                                    ),



                                    Container(
                                      alignment: Alignment.center,
                                      //  decoration: BoxDecoration(border: Border( top: BorderSide( width: 2,color: colors().bg3))),

                                      child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child:
                                          Column(
                                            children: <Widget>[

                                              listTileAccountItem(title:" تسجيل الدخول" ,iconData:CupertinoIcons.padlock ,color:colors.grey ,function: (){


                                                Get.to(AccountPage(islogin: true,));

                                              },),

                                              divider(),


                                              listTileAccountItem(title:"  حساب جديد" ,img: "adduser.png",iconData:Icons.person_add ,color:colors.grey ,function: (){
//launcher().launchInBrowser();

                                                Get.to(RegisterPage());

                                              },),

                                            ],
                                          )                                            ),
                                    ),

                                  ],
                                ),





                              ],
                            ),
                          )
                          ,

                        )



                        ;},


                    )                  ),

              ),

//               Container(
//                 //    margin: EdgeInsets.all(5),
//                 decoration: BoxDecoration(border: Border(  bottom: BorderSide( width: 1,color: colors().grey))),
//
//                 child: Stack(
//                   overflow: Overflow.visible,
//                   children: <Widget>[
//                     Column(
//                       children: <Widget>[
//                         Container(
//                           width: w,
//                           padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//
//
//                           child: Text("التواصل معنا",textAlign: TextAlign.right ,style: Styles().consualtionStatisc(fsize: 13),),
//
//                         ),
//
//
//
//                         Container(
//                           alignment: Alignment.center,
//                           //   decoration: BoxDecoration(border: Border( top: BorderSide( width: 2,color: colors().bg3))),
//
//                           child: Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child:
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//
//
//                                 listTileAccountItem(title:"اتصال",img: "call.png" ,iconData:Icons.call ,color:colors().grey ,function: (){
//
//                                //   launcher().phoneCall();
//                                   Login().isOnTime();
//
//                                 },),
//                                 divider(),
//                                 listTileAccountItem(title:"إيميل",img: "email.png" ,iconData:Icons.mail_outline ,color:colors().grey ,function: (){
//                                   launcher().launchEmail();
//
//                                 },),
//                                 divider(),
//
//                                 listTileAccountItem(title:"المكتب التنفيذي صنعاء - التحرير خلف البنك المركزي" ,img: "location.png",iconData:Icons.location_on ,color:colors().grey ,function: (){
//
//                                   launcher().openMap();
//
//                                 },),
//                                 divider(),
//                                 listTileAccountItem(title:"الموقع الإلكتروني",img: "internet.png" ,iconData:Icons.language ,color:colors().grey ,function: (){
//
//                                   launcher().launchInBrowser();
//
//                                 },),
//                                 divider(),
//
//
//                                 listTileAccountItem(title:"فيسبوك",img: "facebook.png" ,iconData:LineIcons.facebook ,color:colors().grey ,function: (){
//                                   launcher().openFacebook();
// //Get.to(AccountPage(islogin: false,));
//                                 },),
//                                 divider(),
//                                 listTileAccountItem(title:"يوتيوب",img: "youtube.png" ,iconData:LineIcons.youtube_square ,color:colors().grey ,function: (){
//                                   launcher().openYoutube();
//
//                                 },),
//                                 divider(),
//                                 listTileAccountItem(title:"إنستغرام",img: "instagram.png" ,iconData:LineIcons.instagram ,color:colors().grey ,function: (){
//                                   launcher().openYoutube();
//
//                                 },),
//                                 divider(),
//
//                                 listTileAccountItem(title:"تويتر",img: "twitter.png" ,iconData:LineIcons.twitter ,color:colors().grey ,function: (){
//                                   launcher().openTwitter();
//
//                                 },),
//
// //                              Container(
// //
// //                                  decoration: BoxDecoration(border: Border(right: BorderSide(width: 2,color: colors().bg3))),
// //                                  child: categoryCardWithIcon("المفضلة", colors().grey, Icons.favorite_border, (){})),
// //
// //                              Container(
// //
// //                                  decoration: BoxDecoration(border: Border(right: BorderSide(width: 2,color: colors().bg3))),
// //                                  child: categoryCardWithIcon("تغيير كلمة المرور", colors().grey, Icons.lock_open, (){})),
// //                              Container(
// //
// //                                  child: categoryCardWithIcon("معلوماتي", colors().grey, Icons.account_circle, (){})),
//
//
//                               ],
//                             ),
//
//                           ),
//                         ),
//
//                       ],
//                     ),
//
//
//
//
//
//                   ],
//                 ),
//               ),
              Container(
                //    margin: EdgeInsets.all(5),
                decoration: BoxDecoration(border: Border(  bottom: BorderSide( width: 1,color: colors.grey))),

                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: w,
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),


                          child: Text("المزيد",textAlign: TextAlign.right ,style: Styles().consualtionStatisc(fsize: 13),),

                        ),



                        Container(
                          alignment: Alignment.center,
                          //   decoration: BoxDecoration(border: Border( top: BorderSide( width: 2,color: colors().bg3))),

                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[


                                // listTileAccountItem(title:"من نحن",img: "information.png" ,iconData:Icons.info_outline ,color:colors().grey ,function: (){
                                //   dialogs().aboutus(context);
                                // //  Login().isOnTime();
                                //
                                // },),
                                // divider(),

                                listTileAccountItem(title:"شارك التطبيق",img: "share.png" ,iconData:Icons.share ,color:colors.grey ,function: (){

                                  launcher().shareApp();

                                },),
                                divider(),
//                                      listTileAccountItem(title:"المساعدة والدعم" ,iconData:Icons.help_outline ,color:colors().grey ,function: (){
//                                        dialogs().helpDialog(context);
//                                      },),
//                                      divider(),
                                listTileAccountItem(title:"سياسة الخصوصية",img: "policy.png" ,iconData:Icons.description ,color:colors.grey ,function: (){

                                  Get.to(PrivacyPolicyPage());
                                  // Get.to(mProgressDialog());

                                  //  dialogs().policy(context);
                                },),
                                //    divider(),

//                              Container(
//
//                                  decoration: BoxDecoration(border: Border(right: BorderSide(width: 2,color: colors().bg3))),
//                                  child: categoryCardWithIcon("المفضلة", colors().grey, Icons.favorite_border, (){})),
//
//                              Container(
//
//                                  decoration: BoxDecoration(border: Border(right: BorderSide(width: 2,color: colors().bg3))),
//                                  child: categoryCardWithIcon("تغيير كلمة المرور", colors().grey, Icons.lock_open, (){})),
//                              Container(
//
//                                  child: categoryCardWithIcon("معلوماتي", colors().grey, Icons.account_circle, (){})),


                              ],
                            ),
                          ),
                        ),

                      ],
                    ),





                  ],
                ),
              ),



            ],

          ),
        ),
      ),

    );
  }
}
