import 'dart:convert';

import 'package:custom_dialog/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/providers/CartProvider.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/utils/MQSize.dart';
import 'package:yemenwe/utils/Toast.dart';
class PaymentPage extends StatelessWidget {

  int id;
  PaymentPage({this.id});
  TextEditingController invoicenumbertextEditingController=TextEditingController();
  TextEditingController amounttextEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("+++++++++++++++++++");
    print(id);
    print("++++++++++++++++++");
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(appBar: AppBar(title: Text("استكمال الدفع "),


      ),

      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: SingleChildScrollView(child: Column(

        children: <Widget>[

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                Container(
                    width: MQSize.width,
                    child: Text("رقم الحوالة:",textAlign: TextAlign.right,)),


                TextFormField(
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  controller: invoicenumbertextEditingController,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1,color: colors.primary)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1,color: colors.primary)),
                      border: InputBorder.none,

                      hintText: "رقم الحوالة",contentPadding: EdgeInsets.symmetric(horizontal: 10)
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                Container(
                    width: MQSize.width,
                    child: Text("مبلغ الحوالة:",textAlign: TextAlign.right,)),


                TextFormField(
                  keyboardType: TextInputType.number,

                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  controller: amounttextEditingController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1,color: colors.primary)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1,color: colors.primary)),
                      border: InputBorder.none,


                      hintText: "مبلغ الحوالة",contentPadding: EdgeInsets.symmetric(horizontal: 10)
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: MQSize.width,
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: RaisedButton(
              textColor: colors.white,
              color: colors.primary,
              onPressed: (){
                if(amounttextEditingController.text.toString().trim().length>3&&invoicenumbertextEditingController.text.toString().trim().length>3) {
                  getResponseData().getDataWithToken(url: urls.add_payment,token: TokenProvider.token,data: {"invoice_number":invoicenumbertextEditingController.text,"amount":amounttextEditingController.text,"order_id":id}).then((value) {

                    print(value.data);
                  //  var j=json.decode(value.data.toString());
                    var j=(value.data);
                    if(j['data']!=null) {
                      var d = j['data']['invoice_number'];

                      if(d!=null){

                        showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                            content: Text(
                              "تم إرسال البيانات وسيتم التحقق منها وتجهيز الطلب",

                              textAlign: TextAlign.center,
                              style: Styles().TitleTextStyle16Black,

                            ),
                            title: Text(' عملية الدفع ',style: Styles().consualtionStatisc(fsize: 20,mcolor: colors.primary),),
                            firstColor: Color(0xFF3CCF57),
                            secondColor: Colors.white,
                            headerIcon: Icon(
                              Icons.check_circle_outline,
                              size: 120.0,
                              color: Colors.white,
                            ),
                          ),
                        );
                        Provider.of<CartProvider>(context,listen: false).update();
                        invoicenumbertextEditingController.clear();
                        amounttextEditingController.clear();

                      }
                    }



                  });
                }else{

                  mToast().show(context,msg: "يجب إدخال بيانات صحيحة");
                }
              },

              child: Text("تأكيد"),
            ),
          )



        ],

      )),),
      ),
    );
  }
}
