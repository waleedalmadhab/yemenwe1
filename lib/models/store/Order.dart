
import 'package:yemenwe/models/store/SubOrder.dart';

class Order{

  int id,payment_status=0;
  String date;

  List<SubOrder> suborders;

  Order({this.id,this.date,this.suborders,this.payment_status=0});



}