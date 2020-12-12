import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/store/Product.dart';
import 'package:yemenwe/providers/CartProvider.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/screens/store/productdetails_description.dart';
import 'package:yemenwe/ui/screens/store/productdetails_questions.dart';
import 'package:yemenwe/ui/screens/store/productdetails_rate.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/carousal.dart';
import 'package:yemenwe/ui/widgets/carousals.dart';
import 'package:yemenwe/utils/Login.dart';
import 'package:yemenwe/utils/MQSize.dart';
import 'package:yemenwe/utils/Toast.dart';

import '../AccountPage.dart';
class ProductDetails extends StatefulWidget  {
  Product product;
  ProductDetails({this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> with  SingleTickerProviderStateMixin{
TabController tabController;
dynamic d;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 3, vsync: this,initialIndex: 0);
  }
 List<Widget> gettabs({Product product}){
  return [
    productdetails_description(product: product,),

    productdetails_rate(product: product,),


    productdetails_questions(product: product,),



  ];

}
List<String> images1 = [
  "images/a1.jpg",
  "images/a2.jpg",
  "images/a3.jpg",
];
int count=1;
int index=0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(appBar: AppBar(title: Text("تفاصيل المنتج",),),

      body: FutureBuilder(
future: getResponseData().getData(url: urls.product_details,data: {"product_id":widget.product.id.toString()}),

          builder: (bc,snapshot){

  var data=json.decode(snapshot.data.toString());
 // print(data);
 Product p;

  //  p=Product();

    try {
       d = data['data'];
//print(d);
      var imgs = d['images'] as List;
      List<String> images = [];
      imgs.forEach((element) {
       // print(element);
        // print(element['image_actual']);
        if (element['image_actual'] != null) {
          images.add(urls.storeimages + element['image_actual'].toString());
        }
      });
      print("***************************************");
      print(d['images']);
      print("***************************************");

      p = Product(
          id: (d['id']),
          name: d['name'],
          details: d['description'].toString(),
          questions: d['product_questions'],
          rates: d['ratings'],
          rating_details: d['rating_details'],
          price: (d['price'].toString()),
          rate_count: (d['count_rating']),
          rate_average: double.parse(d['average_rating'].toString()),
          thumbnail: urls.storeimages + d['image_actual'],
          location: d['zone'] + "  " + d['space'],
          images: images

      );

    //  print(p.name);



    }catch(e){}
//print(p.name.toString());
    return  d!=null&& p!=null? Container(
      width: MQSize.width,
      height: MQSize.height,

      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                children: <Widget>[
                  Container(height: 250,

                    child:
                    //  Image.asset("images/"+widget.product.thumbnail,width: MQSize().width,height: 200,fit: BoxFit.fill,),
                  p.images.length!=null&&p.images.length>0?  Carousal().phone(p.images,context: context):GestureDetector(

                      onTap: (){


                        Navigator.of(context).push(new PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return new Material(
                                  color: Colors.black38,
                                  child: new Container(
                                    padding: const EdgeInsets.all(30.0),
                                    child: new InkWell(
                                      child: new Hero(
                                        child: new CachedNetworkImage(
                                          imageUrl: p.thumbnail,fit: BoxFit.fill,width: MQSize.width,height: 300,
                                          placeholder: (context, url) => Center(child: SpinKitRing(color: colors.primary)),
                                          errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),


                                        ),
                                        tag: p.thumbnail,
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ));
                            }));

                      },
                      child: CachedNetworkImage( imageUrl: p.thumbnail,fit: BoxFit.fill,width: MQSize.width,height: 300,))

                    , width: MQSize.width,
                  ),
                  TabBar(

                      onTap: (i){

                        setState(() {
                          index=i;
                        });

                      },
                      unselectedLabelColor: colors.grey,
                      labelColor: colors.primary,
                      controller: tabController,

                      indicatorColor: colors.primary,
                      indicatorWeight: 3,
                      tabs: [
                        Tab(

                          text: "التفاصيل",),
                        Tab(

                          text: "التقييم",),


                        Tab(

                          text: "الأسئلة",),
                      ]

                  ),
                  Container(height: 10,),
                  gettabs(product: p)[index],
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),

                border: Border.all(color: colors.primary,width: 2)
            ),
            height: 50,

            child: Row(children: <Widget>[

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(

                    color: colors.primary,
                    border: Border.all(color: colors.primary,width: 2)
                ),
                child: Icon(Icons.add_shopping_cart,size: 20,
                  color: colors.white,
                ),


              ),
              Row(

                children: <Widget>[
                  GestureDetector(

                      onTap: (){
                        if(count<50){
                          setState(() {
                            count++;

                          });
                        }

                      },

                      child: Icon(Icons.add_circle,color: colors.primary,size: 25,)),

                  Text("$count"),
                  GestureDetector(

                      onTap: (){
                        if(count>1){
                          setState(() {
                            count--;

                          });
                        }



                      },
                      child: Icon(Icons.remove_circle,color: colors.primary,size: 25,))

                ],


              ),

              Expanded(
                child: GestureDetector(
                  onTap: (){


                    if(!Login().isOnTime()) {
                      if (Login().isLogin()) {
                        getResponseData()
                            .getDataWithToken(
                            url: urls.add_to_cart,
                            token: TokenProvider.token,
                            data: {"product_id": p.id, "quantity": count})
                            .then((value) {
                          print(value);
                      //    var d=json.decode(value.data.toString());
                           mToast().show(context,msg: value.data['msg'].toString());
                          Provider.of<CartProvider>(context,listen: false).update();

                        });
                      }
                      else {
                        Get.to(AccountPage(islogin: true,));

                        // mToast().show(context,msg: "يرجى تسجيل الدخول أولا");
                      }
                    }
                    else{
                      mToast().show(context,msg: "يبدأ التسوق يوم الثلاثاء الموافق 1 ديسمبر 2020");

                    }

                  },

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                    child: Text("إضافة إلى السلة",textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,style: Styles().consualtionStatisc(fsize: 10,mcolor: colors.black),),
                  ),
                ),
              ),
              // Expanded(
              //   child: GestureDetector(
              //     onTap: (){
              //
              //       if(Login().isLogin()){
              //       getResponseData().getDataWithToken(url: urls().delete_from_cart,token: TokenProvider.token,data: {"id":p.id,"quantity":count}).then((value) {
              //
              //
              //         print(value.data);
              //       });
              //     }
              //       else{
              //         Get.to(AccountPage(islogin: true,));
              //
              //         // mToast().show(context,msg: "يرجى تسجيل الدخول أولا");
              //       }
              //
              //       },
              //
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
              //       child: Text("حذف من السلة",textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,style: Styles().consualtionStatisc(fsize: 10,mcolor: colors().black),),
              //     ),
              //   ),
              // ),

            ],),
          ),

        ],
      ),
    ):Center(child: SpinKitFadingFour(color: colors.primary,),);




// setState(() {
//   widget.product=p;
// });



      }),


      ),
    );
  }
}
