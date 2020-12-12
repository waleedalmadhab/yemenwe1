import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:getwidget/getwidget.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/store/Product.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/store/cardProduct.dart';
import 'package:yemenwe/utils/MQSize.dart';
import 'package:yemenwe/utils/gridWidth.dart';
class ViewMoreProducts1 extends StatefulWidget {

  List <Product> products=[];
  int id=1;
  String type="";
  ViewMoreProducts1({this.products,this.id,this.type="cat"});

  @override
  _ViewMoreProducts1State createState() => _ViewMoreProducts1State();
}

class _ViewMoreProducts1State extends State<ViewMoreProducts1> {


  List<Product> products=  [];
  List<Product> productsMore=  [];

  dynamic loadmore;

int length;

getData(){
  getResponseData().getData(url: urls.get_category_products,data: {"category_id":widget.id}).then((value) {


  //  var d=json.decode(value.data.toString());
//print(d);
    try {
      var p = value.data['data']['data'] as List;
loadmore=value.data['data']['next_page_url'];
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
  getResponseData().getData(url: loadmore,data: {"category_id":widget.id}).then((value) {


  //  var d=json.decode(value.data.toString());

    try {
      var p = value.data['data']['data'] as List;
loadmore=value.data['data']['next_page_url'];
   //   print(p.length);
      length = p.length !=null &&p.length>0 ?p.length:0;
      p.forEach((el) {
        productsMore.add(Product(id:
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
products.addAll(productsMore);
      });
      print(products.length);

    }catch(e){}

  });


}
@override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }
  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body:
SingleChildScrollView(
  child:   Column(
    children: [


      length!=null &&length>0 ?     GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: gridWidth().aspectRatio(width: MQSize.width,count: 2,height: 230),

          ), itemBuilder: (bc,index)=>cardProduct(product:products[index] ,)) :length!=null&&length==0? Center(child: Text("لا يوجد بيانات"),):  Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(height: 100,),
              SpinKitRotatingPlain(color: colors.primary,),
            ],
          ),),

    loadmore!=null?  GFButton(onPressed: (){
      getmoreData();

      }
      ,

        color: colors.primary,
        type: GFButtonType.outline2x,
        text: "عرض أكثر",
        textStyle: Styles().consualtionStatisc(fsize: 12,mcolor: colors.primary),


      ):Container()


    ],
  ),
)
      ),
    );

  }
}
