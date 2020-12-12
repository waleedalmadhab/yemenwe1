import 'dart:io';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yemenwe/constants/Constant.dart';


class  launcher{
  openTwitter()async{
    await  launch(
Constant().twitter    );
  }


 openYoutube ()async {
  if (Platform.isIOS) {
  if (await canLaunch('${Constant().youtube}')) {
  await launch('${Constant().youtube}', forceSafariVC: false);
  } else {
  if (await canLaunch('${Constant().youtube}')) {
  await launch('${Constant().youtube}');
  } else {
  throw '${Constant().youtube}';
  }
  }
  }
  else {
  var url = '${Constant().youtube}';
  if (await canLaunch(url)) {
  await launch(url);
  } else {
  throw 'Could not launch $url';
  }
  }}


  openFacebook() async{


    String fbProtocolUrl;
    if (Platform.isIOS) {
      fbProtocolUrl = 'fb://profile/yemenwu';
    } else {
      fbProtocolUrl = 'fb://page/yemenwu';
    }

    String fallbackUrl = ''+Constant().facebook;

    try {
      bool launched = await launch(fbProtocolUrl, forceSafariVC: false);

      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false);
    }


//    launch(
////https://telegram.me/InfotechAvl_bot
//      //"https://wa.me/967715883428?text=Hello"
//        "fb://page/267799957329293"
//    );

  }




  openMap() async {
    const url = 'https://www.google.com/maps/search/?api=1&query=15.350250151847831,44.20802416480409';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  map() async {
    final String googleMapsUrl = "comgooglemaps://?center=${Constant().lat},${Constant().lang}";
    final String appleMapsUrl = "https://maps.apple.com/?q=${Constant().lat},${Constant().lang}";

    if(Platform.isAndroid){
      print("android os");
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    }}
    else if(Platform.isIOS) {
      print("ios");

      if (await canLaunch(appleMapsUrl)) {
        await launch(appleMapsUrl, forceSafariVC: false);
      }
    }
    else {
      throw "Couldn't launch URL";
    }
  }


  launchEmail() {
    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path: ''+Constant().email,
        queryParameters: {
          'subject': ' '
        }
    );


    launch(_emailLaunchUri.toString());

  }


  Future<void> hotLineCall() async {
    var url='tel:'+Constant().hotLine;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Future<void> phoneCall() async {
    var url='tel:'+Constant().phone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  Future<void> launchInBrowser() async {
    var url=""+Constant().register;
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
    //    headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

shareApp(){


    Share.share("حمل تطبيق اتحاد نساء اليمن من الرابط التالي"+"\n\n"+Constant().appurl);

}
shareText(String text){


    Share.share(text+"\n\n\n"+"للمزيد حمل تطبيق اتحاد نساء اليمن من الرابط التالي"+"\n\n"+Constant().appurl);

}

}