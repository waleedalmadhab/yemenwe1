import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/store/Product.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/widgets/store/cardProduct.dart';
import 'package:yemenwe/utils/MQSize.dart';
import 'package:yemenwe/utils/gridWidth.dart';
class ViewMoreProducts extends StatelessWidget {

  List <Product> products=[];
  int id=1;
  String type="";
  ViewMoreProducts({this.products,this.id,this.type="cat"});

  List<Product> prs=  [];

int length;
  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
  future: getResponseData().getData(url: urls.get_category_products,data: {"category_id":id}),
  builder: (bc,snapshot){


    log(snapshot.data.toString());
var d=json.decode(snapshot.data.toString());

 try {
   var p = d['data']['data'] as List;

   print(p.length);
   length = p.length !=null &&p.length>0 ?p.length:0;
   p.forEach((el) {
     prs.add(Product(id:
     int.parse(el['id'].toString()),
       name: el['name'],
       details: el['description']
       ,
       price: el['price'].toString()
       ,
       location: el['zone'] + "  " //+ el['space']
       ,
       thumbnail: urls.storeimages + el['image'],
       rate_count: int.parse(el['count_rating'].toString()),
       rate_average: double.parse(el['average_rating'].toString())
       ,

     ));
   });
   print(prs.length);

 }catch(e){}
  return
    length!=null &&length>0 ?     GridView.builder(
      itemCount: prs.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: gridWidth().aspectRatio(width: MQSize.width,count: 2,height: 230),

      ), itemBuilder: (bc,index)=>cardProduct(product:prs[index] ,)) :length!=null&&length==0? Center(child: Text("لا يوجد بيانات"),):  Center(child: SpinKitRotatingPlain(color: colors.primary,),);


},),
      ),
    );

  }
}
