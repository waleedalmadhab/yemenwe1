import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:yemenwe/models/store/SubOrder.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/utils/MQSize.dart';
import 'package:yemenwe/utils/my_flutter_app_icons.dart';

class OrderDetailsPage extends StatelessWidget {

  SubOrder subOrder;
  OrderDetailsPage({this.subOrder});
  @override
  Widget build(BuildContext context) {
    log(subOrder.productlist.toString());
    return Scaffold(
      appBar: AppBar(title: Text("تفاصيل  الطلب"),),
      body: Card(
        margin: EdgeInsets.zero,
        child: Container(

          child: Directionality(
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

                                        text: "(     ${subOrder.seller}     )",style: Styles().consualtionStatiscNormalFont(fsize: 10,),)
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

                                        text: "(     ${subOrder.username}     )",style: Styles().consualtionStatiscNormalFont(fsize: 10,),)
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

                                        text: "(     ${subOrder.userphone}     )",style: Styles().consualtionStatiscNormalFont(fsize: 10,),)
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

                                        text: "(     ${subOrder.address_from}     )",style: Styles().consualtionStatiscNormalFont(fsize: 10,),)
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

                                        text: "(     ${subOrder.address_to}     )",style: Styles().consualtionStatiscNormalFont(fsize: 10,),)
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
                            //     Icon(CupertinoIcons.refresh_circled,size: 20,),
                            Text("  تكلفة الشحن:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.black),),
                            Text("  (  ${subOrder.shipping_cost}  )",overflow: TextOverflow.ellipsis,style: Styles().consualtionStatiscNormalFont(fsize: 10),),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            //     Icon(CupertinoIcons.refresh_circled,size: 20,),
                            Text("تكلفة  الطلب:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.black),),
                            Text("  (  ${subOrder.totalprice}  )",overflow: TextOverflow.ellipsis,style: Styles().consualtionStatiscNormalFont(fsize: 10),),
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
                         //   Icon(Icons.monetization_on_outlined,color: colors().primary,size: 20,),
                            Text("   المبلغ المتوجب دفعه :",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.black),),
                            Text("  (  ${double.parse(subOrder.totalprice)+double.parse(subOrder.shipping_cost)}  )",style: Styles().consualtionStatiscNormalFont(fsize: 10),),
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
                            Text(" حالة الدفع:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.black),),
                            Text("  (  ${subOrder.payment_status}  )",overflow: TextOverflow.ellipsis,style: Styles().consualtionStatiscNormalFont(fsize: 10),),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            //     Icon(CupertinoIcons.refresh_circled,size: 20,),
                            Text("طريقة الدفع:",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.black),),
                            Text("  (  ${subOrder.payment_method}  )",overflow: TextOverflow.ellipsis,style: Styles().consualtionStatiscNormalFont(fsize: 10),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(),
                 SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: DataTable(

                     headingRowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                       if (states.contains(MaterialState.hovered))
                         return Theme.of(context).colorScheme.primary.withOpacity(0.08);
                       return null;  // Use the default value.
                     }),
                       columns: [
                     DataColumn(label: Text("المنتج",style: Styles().consualtionStatisc(fsize: 10,mcolor: colors.primary),)),
                     DataColumn(label: Text("الكمية",style: Styles().consualtionStatisc(fsize: 10,mcolor: colors.primary),)),

                     DataColumn(label: Text("سعر الوحدة",style: Styles().consualtionStatisc(fsize: 10,mcolor: colors.primary),)),
                     DataColumn(label: Text(" الإجمالي",style: Styles().consualtionStatisc(fsize: 10,mcolor: colors.primary),)),

                   ], rows:subOrder.productlist.map((p) {

                return   DataRow(cells: [
                    DataCell(Text(p['product']['name'].toString(),style: Styles().consualtionStatisc(fsize: 8,mcolor: colors.black),)),
              //    DataCell(Text(p['product']['quantity'].toString(),style: Styles().consualtionStatiscNormalFont(fsize: 12),)),

              //    DataCell(Text((int.parse(p['quantity'].toString())*double.parse(p['price'])).toString(),style: Styles().consualtionStatiscNormalFont(fsize: 12),)),
                    DataCell(Text((p['quantity']).toString(),style: Styles().consualtionStatiscNormalFont(fsize: 12),)),
                    DataCell(Text((p['price']).toString(),style: Styles().consualtionStatiscNormalFont(fsize: 12),)),
                    DataCell(Text((double.parse(p['price'].toString())*int.parse(p['quantity'].toString())).toString(),style: Styles().consualtionStatiscNormalFont(fsize: 12),)),

                ]);

                   }).toList() ),
                 ),
Divider(),
              ],),
            ),
          ),


        ),
      ),
    );
  }
}
