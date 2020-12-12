import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/AccountPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
class noAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Container(
        child: RichText(
          text: new TextSpan(
              text: "لست مسجل الدخول",
              style: Styles().consualtionStatiscNormalFont(fsize: 10),

              children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()..onTap=(){

                      Get.to(AccountPage(islogin: true,));

                    },
                    text: "  تسجيل الدخول الآن ",
                    style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.primary)
                ),
              ]),
        ),
      ),

    );
  }
}
