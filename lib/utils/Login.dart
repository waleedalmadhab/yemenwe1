
import 'package:yemenwe/providers/TokenProvider.dart';

class Login{

 bool isLogin(){
    return TokenProvider.token.length>0;
  }
 bool isOnTime(){

   var now=DateTime.now();

  return now.year==2020&&now.month==10;



  }




}