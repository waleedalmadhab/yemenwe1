import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/store/Product.dart';
import 'package:yemenwe/models/store/Space.dart';
import 'package:yemenwe/models/store/category.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/noInternetConnection.dart';
import 'package:yemenwe/ui/widgets/spaceItem.dart';
import 'package:yemenwe/ui/widgets/store/cardCatItem.dart';
import 'package:yemenwe/ui/widgets/store/cardProduct.dart';
import 'package:yemenwe/utils/MQSize.dart';
import 'package:yemenwe/utils/internetConnection.dart';
class storehome extends StatelessWidget {





  @override
  Widget build(BuildContext context) {
    return


FutureBuilder(

    initialData: false,
    future: InternetConnection.instance.isConnected(),
    builder: (bc,connected){

  return   connected.data!=null &&connected.data?    SingleChildScrollView(
    child:
    Container(

      child: Wrap(children: <Widget>[
        FutureBuilder(
          builder: (bc,snapshot){
            //    print(snapshot.data);
            if(snapshot.data!=null) {
              try {
                var data = json.decode(snapshot.data.toString());
                var cats = data['data'] as List;
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 160,
                  width: MQSize.width,
                  color: colors.bg3,

                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MQSize.width,
                        height: 40,
                        child: Text("الأصناف", textAlign: TextAlign.right,
                          style: Styles().consualtionStatisc(
                              fsize: 18, mcolor: colors.black),),

                      ),

                      Expanded(

                        // cardCatItem(title: "ملابس نسائية",img: "womencoat.png",function: (){},),

                        child: ListView.builder(
                            itemCount: cats.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (bc, index) {
                              // print(urls().storeimages+cats[index]['image']);

                              return Container(
                                child: cardCatItem(
                                  id: cats[index]['id'],
                                  title: cats[index]['name'],
                                  img: cats[index]['image'],),
                              );
                            }
                        ),
                      ),
                    ],
                  ),
                );
              } catch (e) {}
            }
            else{
              return Container();
            }

            //  print(cats);

          }
          ,
          future: getResponseData().getData(url: urls.storeAllCats),

        ),



        FutureBuilder(
          future: getResponseData().getDataWithToken(token: TokenProvider.token,url: urls.storeProducts),
          builder: (bc,snapshot){
            // print(snapshot.data);
            var data=json.decode(snapshot.data.toString());
            List<Category> cats=[];

            try {
              var datalist = data['data'] as List;

              datalist.forEach((element) {
                List<Product> products = [];
                var p = element['products'] as List;

                p.forEach((el) {
                  //  print(el);
                  products.add(Product(id:
                  int.parse(el['id'].toString()),
                    fav:  el['is_like']==null?0:1,
                    name: el['name'],
                    details: el['description']
                    ,
                    price: el['price'].toString()
                    ,
                    location: el['zone'] + " "
                    //  " " + el['space']
                    ,
                    thumbnail: urls.storeimages + el['image'],
                    rate_count: int.parse(el['count_rating'].toString()),
                    rate_average: double.parse(el['average_rating'].toString())
                    ,

                  ));
                });

                cats.add(
                    Category(
                        id: int.parse(element['id'].toString()),
                        title: element['name'],

                        products: products
                    )

                );
              });
            }catch(e){}
            return      cats.length!=null&&cats.length>0?     ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cats.length,
                itemBuilder: (bc,index)=>Card(
                    color: colors.white.withOpacity(0.9),
                    child: Container(
                      height: 270,
                      child: Column(
                        children: <Widget>[

                          Container(
                            alignment: Alignment.centerRight,
                            width: MQSize.width,
                            height: 40,
                            //  color: colors().primary.withOpacity(0.1)
                            padding: EdgeInsets.symmetric(horizontal: 20),

                            child: Text(cats[index].title,style: Styles().consualtionStatisc(fsize: 16),),
                          ),

                          Expanded(
                            child: ListView.builder(
                                physics: ClampingScrollPhysics(),
                                //    shrinkWrap: true,
                                scrollDirection: Axis.horizontal,

                                itemCount: cats[index].products.length,
                                itemBuilder: (bc,i)=>Container(

                                    child:
                                    cardProduct(product: cats[index].products[i],)


                                )),
                          ),
                        ],
                      ),
                    )

                )
            ):Container(
              height: MQSize.height,
              width: MQSize.width,
              child: Center(child: Column(
             //   mainAxisAlignment: MainAxisAlignment.center,
             //   crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(height: 100,),
                  SpinKitSquareCircle(color: colors.primary,),
                ],
              )),
            );

          },
        )


      ],),

    ),
  ):Center(
    child: noInternetConnection(),
  );


})
    ;
  }
}
