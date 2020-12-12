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
class FilterProducts extends StatefulWidget {

  int id=1;
  dynamic type="";
  FilterProducts({this.id,this.type});

  @override
  _FilterProductsState createState() => _FilterProductsState();
}

class _FilterProductsState extends State<FilterProducts> {
  List<Product> prs=  [];
  List<Product> products=  [];
  List<Product> productsMore=  [];

  dynamic loadmore;

  int length;

  getData(){
    getResponseData().getData(url: urls.get_category_products,data: widget.type).then((value) {

print(value.data);
      //  var d=json.decode(value.data.toString());
//print(d);
      try {
        var p = value.data['data'] as List;
        loadmore=value.data['next_page_url'];
        //   print(p.length);
        length = p.length !=null &&p.length>0 ?p.length:0;
        p.forEach((el) {
          products.add(Product(id:
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
        setState(() {

        });
        print(products.length);

      }catch(e){}

    });


  }
  getmoreData(){
    getResponseData().getData(url: loadmore,data: widget.type).then((value) {


      //  var d=json.decode(value.data.toString());

      try {
        var p = value.data['data'] as List;
        loadmore=value.data['next_page_url'];
        //   print(p.length);
        length = p.length !=null &&p.length>0 ?p.length:0;
        p.forEach((el) {
          productsMore.add(Product(id:
          int.parse(el['id'].toString()),
            name: el['name'],
            details: el['description'],
            price: el['price'].toString(),
            location: el['zone'] + "  " //+ el['space']
            ,
            thumbnail: urls.storeimages + el['image'],
            rate_count: int.parse(el['count_rating'].toString()),
            rate_average: double.parse(el['average_rating'].toString())
            ,

          ));
        });
        setState(() {
          products.addAll(productsMore);
        });
        print(products.length);

      }catch(e){}

    });


  }

  @override
  Widget build(BuildContext context) {
print(widget.type);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
  future: getResponseData().getData(url: urls.get_product_by_categories,data: widget.type),
  builder: (bc,snapshot){


   log(snapshot.data.toString());
   // print(snapshot.data['data']);
var d=json.decode(snapshot.data.toString());
print(d);
 try {
   var p1 = d['data'] as List;
   print(p1);

   var p = p1[0]['products'] as List;
   print(p.length);
   length = p.length ;
   prs.clear();
   p.forEach((el) {
     prs.add(Product(id:
     int.parse(el['id'].toString()),
     fav:(el['is_like']==null?0:1),
       name: el['name'],
       details: el['description']
       ,
       price: el['price'].toString()
       ,
       location: el['zone'].toString() + "  " //+ el['space'].toString()
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

      ), itemBuilder: (bc,index)=>cardProduct(product:prs[index] ,)) : Container(child: Center(child: length!=null&&null==0?  Text("لا يوجد بيانات"):Center(child: SpinKitRotatingPlain(color: colors.primary,),),))  ;


},),
      ),
    );

  }
}
