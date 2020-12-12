import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/store/Product.dart';
import 'package:yemenwe/models/store/Space.dart';
import 'package:yemenwe/models/store/category.dart';
import 'package:yemenwe/providers/FavProvider.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/noInternetConnection.dart';
import 'file:///G:/flutter-projects/PrivateProjects/Me/yemenwe/lib/ui/widgets/store/cardCatItem.dart';
import 'file:///G:/flutter-projects/PrivateProjects/Me/yemenwe/lib/ui/widgets/store/cardProduct.dart';
import 'package:yemenwe/ui/widgets/spaceItem.dart';
import 'package:yemenwe/utils/MQSize.dart';
import 'package:yemenwe/utils/gridWidth.dart';
import 'package:yemenwe/utils/internetConnection.dart';
class storeFav extends StatelessWidget {




  List<Product> prs=  [];

  int length;

  @override
  Widget build(BuildContext context) {

    Provider.of<FavProvider>(context,listen: true).update();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body:
FutureBuilder(
    initialData: false,
    future: InternetConnection.instance.isConnected(),
    builder: (bc,connected){


  return   connected.data!=null &&connected.data?  Container(

    child: TokenProvider.token.length>0? FutureBuilder(
      future: getResponseData().getDataWithToken(url: urls.mylikes,token: TokenProvider.token,data: {"type":"product"}),
      builder: (bc,snapshot){


        print(snapshot.data);
        var d=json.decode(snapshot.data.toString());

        try {
          var p = d['data'] as List;

          print(p.length);
          length = p.length !=null &&p.length>0 ?p.length:0;
          prs.clear();
          p.forEach((el) {
            prs.add(Product(id:
            int.parse(el['id'].toString()),
              fav:  (el['is_like'])==null?0:1,
              name: el['name'],
              details: el['description']
              ,
              price: el['price'].toString()
              ,
              location: el['zone'] + "  " + el['space']
              ,
              thumbnail: urls.storeimages + el['image'],
              rate_count: int.parse(el['count_rating'].toString()),
              rate_average: double.parse(el['average_rating'].toString())
              ,

            ));
          });
          //  print(prs.length);

        }catch(e){}
        return
          prs.length!=null&&prs.length>0  ?     GridView.builder(
              itemCount: prs.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: gridWidth().aspectRatio(width: MQSize.width,count: 2,height: 230),

              ), itemBuilder: (bc,index)=>cardProduct(product:prs[index] ,)) :length!=null&&length==0? Center(child: Text("لا يوجد بيانات"),):  Center(child: SpinKitRotatingPlain(color: colors.primary,),);


      },):Center(child: Text("ليس هناك أي عناصر مفضلة قم بتسجيل الدخول"),),
  ):Center(
    child: noInternetConnection(),
  );


})      ),
    );

  }
}
