import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/store/Order.dart';
import 'package:yemenwe/models/store/SubOrder.dart';
import 'package:yemenwe/models/store/Product.dart';
import 'package:yemenwe/providers/CartProvider.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/AccountPage.dart';
import 'package:yemenwe/ui/pages/store/PaymentPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/noInternetConnection.dart';
import 'package:yemenwe/ui/widgets/store/orderItem.dart';
import 'package:yemenwe/utils/MQSize.dart';
import 'package:yemenwe/utils/internetConnection.dart';
class OrderScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {



    Provider.of<CartProvider>(context,listen: true).update();




    List<Order> myorders=[];


    return FutureBuilder(
        initialData: false,
        future: InternetConnection.instance.isConnected(),
        builder: (bc,connected){


          return   connected.data!=null &&connected.data? Container(child: TokenProvider.token.length>0?

      DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[

//           TabBar(
// indicatorSize: TabBarIndicatorSize.tab,
// labelPadding: EdgeInsets.zero,
//               labelColor: colors().secondry,
//               indicatorColor: colors().secondry,
//               labelStyle: Styles().consualtionStatisc(fsize: 10),
//               unselectedLabelStyle: Styles().consualtionStatisc(fsize: 8),
//               unselectedLabelColor:colors().grey ,
//               tabs: [
//             Tab(
//
// text: "قيد المراجعة",            ),
//             Tab(
// text: "قيد التحضير",            ),
//             Tab(
// text: "المكتملة",            ),
//           ]),



            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  children: <Widget>[



                    FutureBuilder(

                        future: getResponseData().getDataWithToken(url: urls.my_orders,token: TokenProvider.token,),
                        builder: (bc,snapshot){
                          //     print(TokenProvider.token);
                          //     print(snapshot.data);
                          var j=json.decode(snapshot.data.toString());
                          try {

                            var data = j['data']['data'] as List;
                         //   log(data.toString());

                            myorders.clear();
                            data.forEach((element) {
                              print( "*******************   "+   element['payment_status'].toString());
                           //   print(    element['payment_status']);

                           //   log(element);
                              List <SubOrder> suborders = [];

                              var d = element['sellers'] as List;
                              d.forEach((el) {
                             //   print(el);
                                log(el.toString());
                                print("********************\n\n\n\n");
                              //  log(el['products'].toString());
                                suborders.add(
                                    SubOrder(
                                      id: el['id'],
                                      seller: el['seller_name'],
                                      userphone: element['phone'],
                                      username: element['customer_name'],
                                      st: int.parse(el['payment_status'].toString())==0?0:1,
                                      shipping_cost: element['shipping_cost'].toString(),
                                      payment_method: element['payment_method'].toString(),

                                      totalprice: el['price'].toString(),
                                      order_status: el['order_status_name'],
                                      payment_status: el['payment_status_name'],
                                      productlist: el['products'],
                                      address_from: el['seller']['seller']['gov'] +
                                          " - " + el['seller']['seller']['district'],
                                      address_to: element['gov'] + " - " +
                                          element['district'] + "- " +
                                          element['more_address_info'],


                                    ));
                              });
                              myorders.add(Order(id: element['id'],
                                  date: element['published'],
                               //   payment_status: element['payment_status'],

                                  suborders: suborders
                              ));
                            });

                            //  print(j['data']['sellers']);

                          }catch(e){}
                          return  myorders.length!=null&&myorders.length>0? ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: myorders.length,
                              itemBuilder: (bc,outIndex)=>Container(
                                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),

                                child:                   Card(
                                  elevation: 5,

                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Wrap(
                                      children: <Widget>[


                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(CupertinoIcons.tag,size: 20,),

                                                    Text("الطلب  (${myorders[outIndex].id})",style: Styles().consualtionStatisc(fsize: 15,mcolor: colors.black),),

                                                  ],
                                                ),
                                              )),
                                              Expanded(child: Padding(
                                                padding: const EdgeInsets.symmetric( horizontal: 5),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 5,left: 5,top: 5),
                                                      child: Text("${myorders[outIndex].date}",style: Styles().consualtionStatiscNormalFont(fsize: 12),),
                                                    ),
                                                    Icon(Ionicons.calendar_outline,size: 15,),

                                                  ],
                                                ),
                                              )),
                                            ],
                                          ),
                                        ),

                                        // Divider(),
                                        ListView.builder(
                                            physics: NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: myorders[outIndex].suborders .length,
                                            itemBuilder: (bc,index)=>orderItem(order:myorders[outIndex]. suborders[index],)),

                                        // myorders[outIndex].payment_status==0? Container(
                                        //   width: MQSize.width,
                                        //   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                        //   child: RaisedButton(
                                        //
                                        //
                                        //       textColor: colors().white,
                                        //       color: colors().primary,
                                        //       child: Text("استكمال عملية الدفع"),
                                        //       onPressed: (){
                                        //         print(myorders[outIndex].payment_status);
                                        //         Get.to(PaymentPage(id: myorders[outIndex].id,));
                                        //
                                        //
                                        //       }),
                                        // ):Container()
                                      ],
                                    ),
                                  ),
                                ),

                              )):Container(

                          );

                        })

                  ],
                ),
              ),
            ),
          ],
        ),
      ):
      Center(child: GestureDetector(
          onTap: (){
            Get.to(AccountPage(islogin: true,));

            // mToast().show(context,msg: "يرجى تسجيل الدخول أولا");

          },

          child: Text("ليس هناك أي طلبات قم بتسجيل الدخول")),),):Center(
            child: noInternetConnection(),

          );

    })
    ;
  }
}
