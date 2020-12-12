import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
class PrivacyPolicyPage extends StatelessWidget {
  Future<String> loadLocal() async {
    return await rootBundle.loadString('assets/privacy_policy.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
backgroundColor: colors.brown,
title: Text("Privacy Policy",style: Styles().consualtionStatisc(fsize: 14,mcolor: Colors.white),),
      ),

      body: Container(
        child: FutureBuilder<String>(
          future: loadLocal(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //                                return Text("${snapshot.data}");
              return WebView(
                initialUrl:
                //new Uri.dataFromString(snapshot.data, mimeType: 'text/html').toString(),
                 Uri.dataFromString(snapshot.data, mimeType: 'text/html', encoding: Encoding.getByName("UTF-8")).toString()
              //  javascriptMode: JavascriptMode.unrestricted,
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          },
        ),


      ),

    );
  }
}
