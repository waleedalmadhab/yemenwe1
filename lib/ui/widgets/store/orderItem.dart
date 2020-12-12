
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_social_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/store/SubOrder.dart';
import 'package:yemenwe/providers/CartProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/store/OrderDetailsPage.dart';
import 'package:yemenwe/ui/pages/store/PaymentPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/dialogs.dart';
import 'package:yemenwe/utils/MQSize.dart';
import 'package:yemenwe/utils/my_flutter_app_icons.dart';
class orderItem extends StatelessWidget {

  SubOrder order;
orderItem({this.order});

  @override
  Widget build(BuildContext context) {

    print("______________________________  "+order.st.toString());

    return Directionality(
      textDirection: TextDirection.rtl,
      child
          : Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(border: Border(top: BorderSide(
            width: 1,
            color: colors.grey))),
            child: Column(children: <Widget>[

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: Row(
                  children: <Widget>[
                    Icon(MyIcons.shop,color: colors.primary,size: 20,),
                    Expanded(

                        child: Padding(
                          padding: const EdgeInsets.only(right: 1),
                          child: Text.rich(
                              TextSpan(
                                //  text: "  عنوان الاستلام:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors().black),
                                  children: [
                                    TextSpan(text: "البائع:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.black)),
                                    TextSpan(

                                      text: "(     ${order.seller}     )",style: Styles().consualtionStatiscNormalFont(fsize: 10,),)
                                  ]

                              )

                          ),
                        ))
,
                    // Text("  البائع:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors().black),),
                    // Text("${order.seller} ",style: Styles().consualtionStatiscNormalFont(fsize: 10),),
                  ],
              ),
            ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                child: Row(
                  children: <Widget>[
                    Icon(Ionicons.person_outline,color: colors.primary,size: 20,),
                    Expanded(

                        child: Padding(
                          padding: const EdgeInsets.only(right: 1),
                          child: Text.rich(
                              TextSpan(
                                //  text: "  عنوان الاستلام:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors().black),
                                  children: [
                                    TextSpan(text: "اسم المستلم:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.black)),
                                    TextSpan(

                                      text: "(     ${order.username}     )",style: Styles().consualtionStatiscNormalFont(fsize: 10,),)
                                  ]

                              )

                          ),
                        ))
                    ,
                    // Text("  البائع:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors().black),),
                    // Text("${order.seller} ",style: Styles().consualtionStatiscNormalFont(fsize: 10),),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                child: Row(
                  children: <Widget>[
                    Icon(Ionicons.call_outline,color: colors.primary,size: 20,),
                    Expanded(

                        child: Padding(
                          padding: const EdgeInsets.only(right: 1),
                          child: Text.rich(
                              TextSpan(
                                //  text: "  عنوان الاستلام:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors().black),
                                  children: [
                                    TextSpan(text: "رقم هاتف المستلم:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.black)),
                                    TextSpan(

                                      text: "(     ${order.userphone}     )",style: Styles().consualtionStatiscNormalFont(fsize: 10,),)
                                  ]

                              )

                          ),
                        ))
                    ,
                    // Text("  البائع:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors().black),),
                    // Text("${order.seller} ",style: Styles().consualtionStatiscNormalFont(fsize: 10),),
                  ],
                ),
              ),
              Divider(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                  children: <Widget>[
                    Icon(Ionicons.location_outline,color: colors.primary,size: 20,),
                    Expanded(

                        child: Padding(
                          padding: const EdgeInsets.only(right: 1),
                          child: Text.rich(
                              TextSpan(
                                //  text: "  عنوان الاستلام:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors().black),
                                  children: [
                                    TextSpan(text: "عنوان الإرسال:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.black)),
                                    TextSpan(

                                      text: "(     ${order.address_from}     )",style: Styles().consualtionStatiscNormalFont(fsize: 10,),)
                                  ]

                              )

                          ),
                        ))
,
                    // Text("  عنوان الإرسال:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors().black),),
                    // Text("  (  ${order.address_from}  )",style: Styles().consualtionStatiscNormalFont(fsize: 10),),
                  ],
              ),
            ),
              Divider(),

            Container(
              width: MQSize.width,
              padding: const EdgeInsets.all(5.0),
              child: Row(
                  children: <Widget>[
                    Icon(Ionicons.flag_outline,color: colors.primary,size: 20,),

                 Expanded(

                     child: Padding(
                       padding: const EdgeInsets.only(right: 1),
                       child: Text.rich(
                           TextSpan(
                             //  text: "  عنوان الاستلام:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors().black),
                               children: [
                         TextSpan(text: "عنوان الاستلام:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.black)),
                         TextSpan(

                           text: "(     ${order.address_to}     )",style: Styles().consualtionStatiscNormalFont(fsize: 10,),)
                           ]

                       )

                       ),
                     ))
                  ],
              ),
            ),
              Divider(),


              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: <Widget>[
                               Icon(Icons.monetization_on_outlined,color: colors.primary,size: 20,),
                          Text("  السعر الإجمالي :",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.black),),
                          Text("  (  ${order.totalprice}  )",style: Styles().consualtionStatiscNormalFont(fsize: 10),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          //     Icon(CupertinoIcons.refresh_circled,size: 20,),
                          Text(" حالة الطلب:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.black),),
                          Text("  (  ${order.order_status}  )",overflow: TextOverflow.ellipsis,style: Styles().consualtionStatiscNormalFont(fsize: 10),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          //     Icon(CupertinoIcons.refresh_circled,size: 20,),
                          Text("حالة الدفع:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.black),),
                          Text("  (  ${order.payment_status}  )",overflow: TextOverflow.ellipsis,style: Styles().consualtionStatiscNormalFont(fsize: 10),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),

              GestureDetector(

                onTap: (){

                  Get.to(OrderDetailsPage(subOrder: order,));

                },

                child: Container(
                  alignment: Alignment.center,
                  width: MQSize.width,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: colors.bg3.withOpacity(.5),
                    //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5))
                  ),
                  child: Text("عرض التفاصيل",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.black),),),
              )
,

    (order.st)==0?          Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                  children: <Widget>[
                    Expanded(child:
                    GFButton(
                      color: colors.primary,
                      textColor: colors.white,
                      onPressed: (){
                                 Get.to(PaymentPage(id: order.id,));
                                 Provider.of<CartProvider>(context,listen: false).update();

                      },
                      text: " تأكيد الشراء",
                      textStyle: Styles().consualtionStatisc(fsize: 10,mcolor: colors.white),

                      icon: Icon(Ionicons.checkmark_circle_outline,color: colors.white,),
                    //  type: GFButtonType.outline2x,
                      shape: GFButtonShape.standard,

                    ),),

Container(width: 20,),
                    Expanded(child:
                    GFButton(
                      color: colors.bg10,
                      textColor: colors.black,
                      onPressed: (){
                        dialogs().cancelOrder(context: context,id: order.id);
                     //   print(order.ispayment);
                      //  getResponseData().getDataWithToken(url: urls().cancel_order,)

                      },
                      text: "الغاء الطلب",
                      textStyle: Styles().consualtionStatisc(fsize: 10,mcolor: colors.primary),
                      // type: GFButtonType.outline2x,
                      shape: GFButtonShape.standard,

                    ),
                    ),

                  ],
              ),
            ):Container(),

       //  DataTable(
       //
       //
       //      columns: [
       //    DataColumn(label: Text("المنتج",style: Styles().consualtionStatisc(fsize: 10,mcolor: colors().primary),)),
       //    DataColumn(label: Text("الكمية",style: Styles().consualtionStatisc(fsize: 10,mcolor: colors().primary),)),
       //
       //    DataColumn(label: Text("السعر",style: Styles().consualtionStatisc(fsize: 10,mcolor: colors().primary),)),
       //
       //  ], rows:order.products.map((p) {
       //
       // return   DataRow(cells: [
       //   DataCell(Text(p.name.toString(),style: Styles().consualtionStatisc(fsize: 10,mcolor: colors().black),)),
       //   DataCell(Text(p.quantity.toString(),style: Styles().consualtionStatiscNormalFont(fsize: 12),)),
       //
       //   DataCell(Text((p.quantity*double.parse(p.price)).toString(),style: Styles().consualtionStatiscNormalFont(fsize: 12),)),
       //
       // ]);
       //
       //  }).toList() ),

      ],),
          ),
    );
  }
}
