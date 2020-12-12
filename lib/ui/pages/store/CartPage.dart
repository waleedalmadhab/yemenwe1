import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/store/Product.dart';
import 'package:yemenwe/providers/CartProvider.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/providers/TrainingProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/store/ConfirmOrderPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/store/cardCartItem.dart';
import 'package:yemenwe/ui/widgets/textForm.dart';
import 'package:yemenwe/utils/Login.dart';
import 'package:yemenwe/utils/MQSize.dart';
import 'package:yemenwe/utils/Toast.dart';
import 'package:yemenwe/utils/internetConnection.dart';

import '../AccountPage.dart';
class CartPage extends StatefulWidget {

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {


  TextEditingController cupontextEditingController=TextEditingController();

  List<Product> prs=  [];

  getDate(){
    getResponseData().getDataWithToken(url: urls.my_cart2,token: TokenProvider.token).then((value) {


      try {
        var d = json.decode(value.data.toString());
        var p = d['data']['cart'] as List;

        length=p.length;
        prs.clear();
        print(d);
        //   length = p.length !=null &&p.length>0 ?p.length:0;
        p.forEach((ele) {
          //    print(ele);
          var el = ele['product'];
          //     print(el);
          prs.add(Product(id:
          int.parse(el['id'].toString()),
            cartId:   int.parse(ele['id'].toString()),
            quantity:   int.parse(ele['quantity'].toString()),
            name: el['name'],
            seller: el['sell_name'],
            sellerLogo: el['sell_icon'],
            details: el['description']
            ,

            price: el['price'].toString()
            ,
            location: el['zone'] + "  " + el['space']
            ,
            thumbnail: urls.storeimages + el['image_actual'],
            rate_count: int.parse(el['count_rating'].toString()),
            rate_average: double.parse(
                el['average_rating'].toString())
            ,

          ));
        });
        setState(() {

        });

        //   print(p.length);
      }catch(e){}


    });


  }

int length;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  getDate();
  }
  @override
  Widget build(BuildContext context) {

    Provider.of<CartProvider>(context,listen: true).update();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body:

          FutureBuilder(

              initialData: false,
              future: InternetConnection.instance.isConnected(),

              builder: (bc,connected){

            return    connected.data!=null &&connected.data?    Container(


              child:  TokenProvider.token.length>0? FutureBuilder(
                  future: getResponseData().getDataWithToken(url: urls.my_cart2,token: TokenProvider.token),
                  builder: (bc,snapshot){
                    //   print(snapshot.data);
                    try {
                      var d = json.decode(snapshot.data.toString());
                      var p = d['data']['cart'] as List;

                      length=p.length;
                      prs.clear();
                          print(d);
                      //   length = p.length !=null &&p.length>0 ?p.length:0;
                      p.forEach((ele) {
                    //    print(ele);
                        var el = ele['product'];
                   //     print(el);
                        prs.add(Product(id:
                        int.parse(el['id'].toString()),
                          cartId:   int.parse(ele['id'].toString()),
                          quantity:   int.parse(ele['quantity'].toString()),
                          name: el['name'],
                          seller: el['sell_name'],
                          sellerLogo: el['sell_icon'],
                          details: el['description']
                          ,

                          price: el['price'].toString()
                          ,
                          location: el['zone'] + "  " + el['space']
                          ,
                          thumbnail: urls.storeimages + el['image_actual'],
                          rate_count: int.parse(el['count_rating'].toString()),
                          rate_average: double.parse(
                              el['average_rating'].toString())
                          ,

                        ));
                      });

                   //   print(p.length);
                    }catch(e){}

                 //   print("++++++++++++++++++++++++++++++++++++++++++++++++   ${prs.length}    ");
                    return prs.length!=null &&prs.length>0? Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                              itemCount: prs.length,
                              itemBuilder: (bc,index)=>cardCartItem(product: prs[index],)),
                        ),

                        Login().isLogin()  &&length!=null&&length>0  ?   Column(
                          children: [
                            Row(

                              children: [
                                Expanded(child: Card(
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(width: 1,color: colors.primary)
                                    ),
                                    child: TextFormField(
controller: cupontextEditingController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                          border: InputBorder.none,
                                          hintText: "كود الكوبون"
                                      ),
                                    ),
                                  ),
                                )),
                                GestureDetector(

                                  onTap: (){
                                    getResponseData().getDataWithToken(url: urls.apply_coupon,token: TokenProvider.token,data: {"coupon":"${cupontextEditingController.text}"}).then((value) {
                                      print(value.data['msg'].toString());
mToast().show(context,msg: value.data['msg'].toString(),color: colors.primary);
                                    });},

                                  child: Container(
                                     height: 40,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 1),
                                    margin: EdgeInsets.all( 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: colors.primary
                                    ),
                                    child: Text("تطبيق الكوبون ",style: Styles().consualtionStatisc(mcolor: colors.white,fsize: 12),),
                                  ),
                                ),



                              ],
                            ),

//                             Container(
//                               padding: EdgeInsets.symmetric(vertical: 10),
//                               child: Row(
//
//                                 children: [
//
//                                   Text(" مجموع السلة:",style: Styles().consualtionStatiscNormalFont(mcolor: colors.black,fsize: 14),),
// //Container(width: 5,),
//                                //   Text(" 37500",style: TextStyle(fontSize: 12,color: colors.red1,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough,decorationColor: colors.primary),),
//                                   Container(width: 5,),
//
//                                   Text(" ",style: Styles().consualtionStatisc(mcolor: colors.black,fsize: 12),),
//                                   Container(width: 20,),
//
//                           //        Icon(CupertinoIcons.delete),
//
//                                 ],
//                               ),
//                             ),
                          ],
                        ):Container(),

                        Login().isLogin()  &&length!=null&&length>0  ?     Row(
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                onTap: (){

                                  Get.to(ConfirmOrderPage());

                                },

                                child: Container(
                                  alignment: Alignment.center,
                                  width: MQSize.width,
                                  height: 40,
                                  child: Text("تأكيد الطلب",style: Styles().consualtionStatisc(fsize: 16,mcolor: colors.white),),
                                  decoration: BoxDecoration(color: colors.primary,borderRadius: BorderRadius.circular(5)),
                                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  var d=[];
                                  prs.forEach((element) {
                                    print(element.quantity);
                                    d.add({"product_id":element.id,"quantity":element.quantity,"product_attributes":[]});
                                  });
                                  print(d.length);

                                  getResponseData().getDataWithToken(url: urls.update_cart,token: TokenProvider.token,data: {"cart_items":d}).then((value){


                                    print(value);
                                    Provider.of<CartProvider>(context,listen: false).update();


                                  });


                                },

                                child: Container(
                                  alignment: Alignment.center,
                                  width: MQSize.width,
                                  height: 40,
                                  child: Text(" تحديث السلة",style: Styles().consualtionStatisc(fsize: 16,mcolor: colors.white),),
                                  decoration: BoxDecoration(color: colors.primary,borderRadius: BorderRadius.circular(5)),
                                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                ),
                              ),
                            ),
                          ],
                        ):Container()

                      ],
                    ):Container(

                      child: length!=null&& length ==0 ?Center(child: Text("لا يوجد عناصر في السلة حاليا"),):SpinKitSquareCircle(color: colors.primary,),

                    );

                  }):
              Center(child: GestureDetector(
                  onTap: (){
                    Get.to(AccountPage(islogin: true,));

                    // mToast().show(context,msg: "يرجى تسجيل الدخول أولا");

                  },

                  child: Text(" قم بتسجيل الدخول")),),):Center(
              child: Text("لا يوجد اتصال بالإنترنت"),

            );


          })

      ),
    );
  }
}
