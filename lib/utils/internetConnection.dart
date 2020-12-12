
import 'dart:async';

import 'package:connectivity/connectivity.dart';

class InternetConnection{

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _subscription;

  InternetConnection._privateConstructor();

  static final InternetConnection instance = InternetConnection._privateConstructor();
  _privateConstructor(){

    _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!

      print(result.toString());

    });



  }

Future<bool> isConnected()async{

  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {

    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  else {
    return false;
  }

}

}