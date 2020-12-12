

import 'package:yemenwe/models/store/Product.dart';

class  SubOrder{

  int id;
  String delivery_date,address_from,address_to,seller,order_status,payment_status,username,userphone,totalprice,shipping_cost,payment_method;
  double total;
int ispayment,st;
  List<Product>  products;
List<dynamic>    productlist;

  SubOrder({this.id,this.seller="",this.ispayment,this.st,this.payment_method,this.shipping_cost,this.productlist,this.order_status="",this.payment_status="",this.username="",this.userphone="",this.totalprice="",this.delivery_date,this.address_from,this.address_to,this.total,this.products});




}