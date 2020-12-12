
import 'package:flutter/material.dart';
import 'package:yemenwe/constants/Constant.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/widgets/issueItem.dart';
class Styles{


  TextStyle TitleTextStyle20Primary=TextStyle(fontFamily: Constant().arabicFont,fontSize: 20,color: colors.blue,fontWeight: FontWeight.bold);
  TextStyle TitleTextStyle16Primary=TextStyle(fontFamily: Constant().arabicFont,fontSize: 16,color: colors.blue,fontWeight: FontWeight.bold);
  TextStyle TitleTextStyle20White=TextStyle(fontFamily: Constant().arabicFont,fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold);
  TextStyle TitleTextStyle16WhiteBold=TextStyle(fontFamily: Constant().arabicFont,fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold);
  TextStyle TitleTextStyle16White=TextStyle(fontFamily: Constant().arabicFont,fontSize: 16,color: Colors.white,);
  TextStyle TitleTextStyle16BlackBold=TextStyle(fontFamily: Constant().arabicFont,fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold);
  TextStyle TitleTextStyle16Black=TextStyle(fontFamily: Constant().arabicFont,fontSize: 16,color: Colors.black);
  TextStyle TitleTextStyle14Black=TextStyle(fontFamily: Constant().arabicFont,fontSize: 14,color: Colors.black);
  TextStyle TitleTextStyle18BlackBold=TextStyle(fontFamily: Constant().arabicFont,fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold);
  TextStyle TitleTextStyle18Black=TextStyle(fontFamily: Constant().arabicFont,fontSize: 18,color: Colors.black,);
  TextStyle TitleTextStyle14BoldBlack=TextStyle(fontFamily: Constant().arabicFont,fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold);
  TextStyle TitleTextStyle12BoldBlack=TextStyle(fontFamily: Constant().arabicFont,fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold);



  TextStyle bottomNavTextStyle=TextStyle(fontFamily: Constant().arabicFont,fontSize: 12);
  TextStyle subjectSubtitle=TextStyle(fontFamily: Constant().arabicFont,fontSize: 10,color: colors.grey1);
  TextStyle consulationQuestion=TextStyle(fontFamily: Constant().arabicFont,fontSize: 14,color: Colors.black);
  TextStyle subjectTitle=TextStyle(fontFamily: Constant().arabicFont,fontSize: 14,color: Colors.black,);
  TextStyle consulationUser=TextStyle(fontFamily: Constant().arabicFont,fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold);
  TextStyle settingsTitleTextStyle=TextStyle(fontFamily: Constant().arabicFont,fontSize: 16,);

  TextStyle subTitleTextStyle10=TextStyle(fontFamily: Constant().arabicFont,fontSize: 12);
  TextStyle subTitleTextStyle12=TextStyle(fontFamily: Constant().arabicFont,fontSize: 12);


  TextStyle consualtionStatisc({Color mcolor=const Color(0xff374957),double fsize=10.0}){
    return  TextStyle(fontFamily: Constant().arabicFont,fontSize: fsize,color: mcolor,fontWeight: FontWeight.bold);

  }

  TextStyle consualtionStatiscNormalFont({Color mcolor=const Color(0xff374957),double fsize=10.0}){
    return  TextStyle(fontFamily: Constant().arabicFont,fontSize: fsize,color: mcolor,);

  }

  TextStyle consualtionStatiscDefFont({Color mcolor=const Color(0xff374957),double fsize=10.0}){
    return  TextStyle(fontSize: fsize,color: mcolor,fontWeight: FontWeight.normal);

  }

  TextStyle issueItemText({Color mcolor=const Color(0xff374957),double fsize=10.0}){

  return  TextStyle(fontFamily: Constant().arabicFont,fontSize: fsize,color: mcolor,);

  }

  accountItemTextStyle(BuildContext context){
    var screenWidth=MediaQuery.of(context).size.width;
    TextStyle productItemTextStyle=TextStyle(fontFamily: Constant().arabicFont,fontSize:screenWidth* 0.031,fontWeight: FontWeight.bold);

    return productItemTextStyle;
  }


}