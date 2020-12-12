import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
//import 'package:simple_url_preview/simple_url_preview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/Active.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/customUrlPreview.dart';
import 'package:yemenwe/ui/widgets/htmlItem.dart';
import 'package:yemenwe/utils/launcher.dart';

class ActiveDetails extends StatelessWidget {

Active active;
  ActiveDetails({this.active});

WebViewController _controller;

Future<bool> _willPopCallback(WebViewController controller) async {
  controller.loadUrl('https://www.google.com/'); /* or you can use controller.reload() to just reload the page */

  return true;
}
@override
  Widget build(BuildContext context) {


    print(active.url);
    return WillPopScope(
      onWillPop: () => _willPopCallback(_controller),
      child: Scaffold(

          appBar: AppBar(),
          body: Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child:
            WebView(
              onWebViewCreated: (WebViewController webViewController) { /* i am not sure what this line actually do */
                _controller = webViewController;
              },
              gestureNavigationEnabled: true,
              initialUrl:
              //new Uri.dataFromString(snapshot.data, mimeType: 'text/html').toString(),
              Uri.dataFromString(active.details, mimeType: 'text/html', encoding: Encoding.getByName("UTF-8")).toString()
              , javascriptMode: JavascriptMode.unrestricted,
            ),
            ),
          )),
    );
  }
}
