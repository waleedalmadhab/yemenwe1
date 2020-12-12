
import 'dart:io';

import 'package:dio/dio.dart';
//import 'package:permission_handler/permission_handler.dart';

class Download{






  var dir = Directory('/storage/emulated/0/YWU/').path;
  //print('${dir.path}');
 // String fullPath = dir + "/boo2.pdf";
  //print('full path ${fullPath}');


//   download({String url, String filename})async{
//
//
//     var status = await Permission.storage.status;
//     if (!status.isGranted) {
//       // We didn't ask for permission yet.
//
//       Permission.storage.request().then((value) {
//         print(value.toString());
//
//         if(value==PermissionStatus.granted){
//
// downloadFile(url, filename);
//           //   getPath();
//         }
//
//
//       });
//
//     }
//     else{
//       downloadFile(url, filename);
//
//
//     }
//
//   }

  Future downloadFile( String url, String filename) async {

    Dio dio;
    var savePath=dir+filename;

    try {







      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }




}