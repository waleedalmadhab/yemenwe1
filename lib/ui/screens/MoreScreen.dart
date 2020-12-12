import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/providers/ContentProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/AccountPage.dart';
import 'package:yemenwe/ui/pages/Favpage.dart';
import 'package:yemenwe/ui/pages/Home.dart';
import 'package:yemenwe/ui/pages/MyConsulationsPage.dart';
import 'package:yemenwe/ui/pages/PrivacyPolicyPage.dart';
import 'package:yemenwe/ui/pages/ProfilePage.dart';
import 'package:yemenwe/ui/pages/SplashPage.dart';
import 'package:yemenwe/ui/pages/mProgressDialog.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/dialogs.dart';
import 'package:yemenwe/ui/widgets/listTileAcountItem.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';
import 'package:yemenwe/utils/launcher.dart';

// class MoreScreen extends StatelessWidget {
//
//
//  Widget userType({String title,Function function}){
//
//    return                                               Expanded(child: GestureDetector(
//
//      onTap: (){
//        function;
//      },
//      child: Container(
//        height: 40,
//        decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(10),
//            border: Border.all(color: colors().brown,width: 2)
//        ),
//        alignment: Alignment.center,
//        margin: EdgeInsets.symmetric(horizontal: 5),
//
//        child: Text("$title",style: Styles().consualtionStatiscNormalFont(fsize: 13,mcolor: colors().brown),),
//      ),
//    ));
//
//
//  }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     var w=MediaQuery.of(context).size.width;
//
//     var count4=w/8, count3=w/6,p2=count4*2,p3,p4;
//     Provider.of<ContentProvider>(context,listen: true).update();
//
//     return FutureBuilder(
//         future: SharedPref().getInt(key: "login"),
//
//         builder: (bc,snapShot){
//
//       print(snapShot.data);
//
//
//
//       return Container(
//         child:               SingleChildScrollView(
//           child: AnimationLimiter(
//
//             child: Column(
//               children: AnimationConfiguration.toStaggeredList(
//                 duration: const Duration(milliseconds: 1000),
//                 childAnimationBuilder: (widget) => ScaleAnimation(
//                   scale: 2,
//                   //  verticalOffset: 600.0,
//                   child: FadeInAnimation(
//
//                     child: widget,
//                   ),
//                 ),
//                 children:
//                 <Widget>[
//
//                snapShot.data==0?   Card(
//                     margin: EdgeInsets.only(top: 10,bottom: 10,right: 5,left: 5),
//                     child: Container(
//                       decoration: BoxDecoration(border: Border.all(width: 1,color: colors().bg3)),
//                       //    margin: EdgeInsets.all(5),
//                       child: Stack(
//                         overflow: Overflow.visible,
//                         children: <Widget>[
//                           Column(
//                             children: <Widget>[
//                               Container(
//
//                                 child: Container(
//                                   width: w,
//                                   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//                                   decoration: BoxDecoration(
//                                       color: colors().bg3,
//                                       borderRadius: BorderRadius.circular(2)
//                                   ),
//
//                                   child: Text("حسابي",textAlign: TextAlign.right ,style: Styles().TitleTextStyle16BlackBold,),
//
//                                 ),
//                               ),
//
//
//
//                               Container(
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(border: Border( top: BorderSide( width: 2,color: colors().bg3))),
//
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(5.0),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: <Widget>[
//
//
//                                       listTileAccountItem(title:" تسجيل الدخول" ,iconData:Icons.lock_outline ,color:colors().grey ,function: (){
//
//
//                                         Get.to(AccountPage(islogin: true,));
//
//                                       },),
//
//                                       divider(),
//
//
//                                       listTileAccountItem(title:"  حساب جديد" ,iconData:Icons.person_add ,color:colors().grey ,function: (){
//
//
//                                         Get.to(AccountPage(islogin: false,));
//
//                                       },),
//
//
//
//
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
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ],
//                           ),
//
//
//
//
//
//                         ],
//                       ),
//                     ),
//                   ):
//                Card(
//                  margin: EdgeInsets.only(top: 10,bottom: 10,right: 5,left: 5),
//                  child:
//                  Container(
//                    decoration: BoxDecoration(border: Border.all(width: 1,color: colors().bg3)),
//                    //    margin: EdgeInsets.all(5),
//                    child: Stack(
//                      overflow: Overflow.visible,
//                      children: <Widget>[
//                        Column(
//                          children: <Widget>[
//                            Container(
//
//                              child: Container(
//                                width: w,
//                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//                                decoration: BoxDecoration(
//                                    color: colors().bg3,
//                                    borderRadius: BorderRadius.circular(2)
//                                ),
//
//                                child: Text("حسابي",textAlign: TextAlign.right ,style: Styles().TitleTextStyle16BlackBold,),
//
//                              ),
//                            ),
//
//
//
//                            Container(
//                              alignment: Alignment.center,
//                              decoration: BoxDecoration(border: Border( top: BorderSide( width: 2,color: colors().bg3))),
//
//                              child: Padding(
//                                padding: const EdgeInsets.all(5.0),
//                                child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.center,
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
//
//
//                                    listTileAccountItem(title:"معلوماتي" ,iconData:Icons.account_circle ,color:colors().grey ,function: (){
//
//
//                                      Get.to(ProfilePage(info: true,));
//
//
//
//                                    },),
//                                    divider(),
//                                  //  listTileAccountItem(title:"تغيير كلمة المرور" ,iconData:Icons.lock_open ,color:colors().grey ,),
//                                   // divider(),
// //                                   listTileAccountItem(title:"المفضلة" ,iconData:Icons.favorite_border ,color:colors().grey ,function: (){
// //
// //
// //                                     Get.to(FavPage());
// //
// //                                   },),
// //                                   divider(),
//                                    listTileAccountItem(title:"استشاراتي" ,iconData:Icons.live_help ,color:colors().grey ,function: (){
//
//                                    SharedPref().getString(key: "token").then((value) {
//
//
//
//                                      Get.to(MyConsulationsPage(token: value,));
//
//                                    });
//
//
//
//
//                                    },),
//
// divider(),
//                                    listTileAccountItem(title:"تسجيل الخروج" ,iconData:Icons.exit_to_app ,color:colors().grey ,function: (){
//
//
//                                      dialogs().logoutDialog(context, (){
//
//
//                                        SharedPref().setInt(key: "login",value: 0);
//                                        SharedPref().setString(key: "token",value: "");
//                                        SharedPref().setString(key: "type",value: "visitor");
//                                        SharedPref().setString(key: "name",value: "");
//                                        SharedPref().setString(key: "email",value: "");
//                                        Get.to(SplashPage());
//                                      //  Provider.of<ContentProvider>(context,listen: false).update();
//
//                                        mToast().show(context,msg: "تم تسجيل الخروج بنجاح");
//
//                                      });
//
//
//
//                                    },),
//
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
//                                  ],
//                                ),
//                              ),
//                            ),
//
//                          ],
//                        ),
//
//
//
//
//
//                      ],
//                    ),
//                  ),
//                ),
//
//
//
//
//                   Card(
//                     margin: EdgeInsets.only(top: 10,bottom: 10,right: 5,left: 5),
//                     child: Container(
//                       decoration: BoxDecoration(border: Border.all(width: 1,color: colors().bg3)),
//                       //    margin: EdgeInsets.all(5),
//                       child: Stack(
//                         overflow: Overflow.visible,
//                         children: <Widget>[
//                           Column(
//                             children: <Widget>[
//                               Container(
//
//                                 child: Container(
//                                   width: w,
//                                   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//                                   decoration: BoxDecoration(
//                                       color: colors().bg3,
//                                       borderRadius: BorderRadius.circular(2)
//                                   ),
//
//                                   child: Text("الموقع",textAlign: TextAlign.right ,style: Styles().TitleTextStyle16BlackBold,),
//
//                                 ),
//                               ),
//
//
//
//                               Container(
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(border: Border( top: BorderSide( width: 2,color: colors().bg3))),
//
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(5.0),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: <Widget>[
//
//
//                                       listTileAccountItem(title:"المكتب التنفيذي صنعاء - التحرير خلف البنك المركزي" ,iconData:Icons.location_on ,color:colors().grey ,function: (){
//
//                                         launcher().openMap();
//
//                                       },),
//                                       divider(),
//                                       listTileAccountItem(title:"الموقع الإلكتروني" ,iconData:Icons.language ,color:colors().grey ,function: (){
//
//                                         launcher().launchInBrowser();
//
//                                       },),
//                                           divider(),
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
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ],
//                           ),
//
//
//
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//
//
//                   Card(
//                     margin: EdgeInsets.only(top: 10,bottom: 10,right: 5,left: 5),
//                     child: Container(
//                       decoration: BoxDecoration(border: Border.all(width: 1,color: colors().bg3)),
//                       //    margin: EdgeInsets.all(5),
//                       child: Stack(
//                         overflow: Overflow.visible,
//                         children: <Widget>[
//                           Column(
//                             children: <Widget>[
//                               Container(
//
//                                 child: Container(
//                                   width: w,
//                                   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//                                   decoration: BoxDecoration(
//                                       color: colors().bg3,
//                                       borderRadius: BorderRadius.circular(2)
//                                   ),
//
//                                   child: Text("التواصل معنا",textAlign: TextAlign.right ,style: Styles().TitleTextStyle16BlackBold,),
//
//                                 ),
//                               ),
//
//
//
//                               Container(
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(border: Border( top: BorderSide( width: 2,color: colors().bg3))),
//
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(5.0),
//                                   child:
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: <Widget>[
//
//
//                                       listTileAccountItem(title:"اتصال" ,iconData:Icons.call ,color:colors().grey ,function: (){
//
//                                         launcher().phoneCall();
//
//                                       },),
//                                       divider(),
//                                       listTileAccountItem(title:"إيميل" ,iconData:Icons.email ,color:colors().grey ,function: (){
//                                         launcher().launchEmail();
//
//                                       },),
//                                       divider(),
//
//                                       listTileAccountItem(title:"فيسبوك" ,iconData:LineIcons.facebook ,color:colors().grey ,function: (){
//                                         launcher().openFacebook();
//
//                                       },),
//                                       divider(),
//                                       listTileAccountItem(title:"يوتيوب" ,iconData:LineIcons.youtube_square ,color:colors().grey ,function: (){
//                                         launcher().openYoutube();
//
//                                       },),
//                                       divider(),
//                                       listTileAccountItem(title:"إنستغرام" ,iconData:LineIcons.instagram ,color:colors.grey ,function: (){
//                                         launcher().openYoutube();
//
//                                       },),
//                                       divider(),
//
//                                       listTileAccountItem(title:"تويتر" ,iconData:LineIcons.twitter ,color:colors.grey ,function: (){
//                                         launcher().openTwitter();
//
//                                       },),
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
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ],
//                           ),
//
//
//
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//
//                   Card(
//                     margin: EdgeInsets.only(top: 10,bottom: 10,right: 5,left: 5),
//                     child:
//                     Container(
//                       decoration: BoxDecoration(border: Border.all(width: 1,color: colors.bg3)),
//                       //    margin: EdgeInsets.all(5),
//                       child: Stack(
//                         overflow: Overflow.visible,
//                         children: <Widget>[
//                           Column(
//                             children: <Widget>[
//                               Container(
//
//                                 child: Container(
//                                   width: w,
//                                   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//                                   decoration: BoxDecoration(
//                                       color: colors.bg3,
//                                       borderRadius: BorderRadius.circular(2)
//                                   ),
//
//                                   child: Text(" اتحاد نساء اليمن",textAlign: TextAlign.right ,style: Styles().TitleTextStyle16BlackBold,),
//
//                                 ),
//                               ),
//
//
//
//                               Container(
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(border: Border( top: BorderSide( width: 2,color: colors.bg3))),
//
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(5.0),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: <Widget>[
//
//
//                                       listTileAccountItem(title:"من نحن" ,iconData:Icons.info_outline ,color:colors.grey ,function: (){
//                                         dialogs().aboutus(context);
//
//                                       },),
//                                       divider(),
//
//                                       listTileAccountItem(title:"شارك التطبيق" ,iconData:Icons.share ,color:colors.grey ,function: (){
//
//                                         launcher().shareApp();
//
//                                         },),
//                                       divider(),
// //                                      listTileAccountItem(title:"المساعدة والدعم" ,iconData:Icons.help_outline ,color:colors().grey ,function: (){
// //                                        dialogs().helpDialog(context);
// //                                      },),
// //                                      divider(),
//                                       listTileAccountItem(title:"سياسة الخصوصية" ,iconData:Icons.description ,color:colors.grey ,function: (){
//
//                                         Get.to(PrivacyPolicyPage());
//                                        // Get.to(mProgressDialog());
//
//                                       //  dialogs().policy(context);
//                                       },),
//                                       //    divider(),
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
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                             ],
//                           ),
//
//
//
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//
//
//
//
//
//
//
//
//                 ],
//
//
//
//
//
//
//
//               ),
//             ),
//           ),
//         ),
//
//       );
//
//     });
//   }
//
//
//
//
//   Widget categoryCardWithIcon(String title,Color color,IconData iconData,Function function){
//     return GestureDetector(onTap: function,
//       child: Container(
//         height: 90,
//         child: Column(
//
//           children: <Widget>[
//
//             Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//
//               child: Container(
//
//                 decoration: BoxDecoration(
//
//                     color: color.withOpacity(.2) ,
//                     borderRadius: BorderRadius.circular(30)
//
//                 ),
//                 height: 40,
//                 width: 40,
//                 child: Icon(iconData,color: color,size: 27,),
//               ),
//             ),
//
//             Text("$title",textAlign: TextAlign.center,style: Styles().TitleTextStyle14Black,)
//
//
//           ],
//
//
//         ),
//       ),
//
//     );
//   }
//
//
//   divider(){
//
//     return         Divider(height: 5,endIndent: 50,
//       indent: 20,
//       thickness: 1,
//       color: Colors.grey[300],
//     );
//
//
//   }
//
//
// }
