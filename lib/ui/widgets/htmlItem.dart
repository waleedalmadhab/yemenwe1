import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
class htmlItem extends StatelessWidget {

  htmlItem({this.data,this.showImg=false});
  String data;
  var showImg;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child:
      Html(

        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 3),
        useRichText: true,
        data: "   <div>"
            +data +
            "</div>",
        //Optional parameters:
        customTextAlign: (_) => TextAlign.right,


        backgroundColor: Colors.white70,
        // onLinkTap: (url) {
        //   // open url in a webview
        // },

        showImages: showImg
        ,


        onImageTap: (src) {
          // Display the image in large form.
        },
      ),
    );
  }
}
