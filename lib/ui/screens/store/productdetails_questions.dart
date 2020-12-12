import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/Rate.dart';
import 'package:yemenwe/models/store/Product.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/AccountPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/store/productQuestionItem.dart';
import 'package:yemenwe/utils/Login.dart';

class productdetails_questions extends StatelessWidget {

  Product product;
  productdetails_questions({this.product});
  List<Rate> rates=[

    Rate(username: "علي السنيني",date: "19/10/2020",rate: 5.0,comment: "هل يتوفر هذا المنتج في حضرموت والمهرة وكم سعر التوصيل؟ "),
    Rate(username: "أسامة عطية",date: "09/10/2020",rate: 5.0,comment: " هل يتوفر هذا المنتج في حضرموت والمهرة وكم سعر التوصيل؟  "),
    Rate(username: "سامي الهمداني",date: "08/10/2020",rate: 4.0,comment: " هل يتوفر هذا المنتج في حضرموت والمهرة وكم سعر التوصيل؟  "),
    Rate(username: "علي الصايدي",date: "12/10/2020",rate: 4.0,comment: "هل يتوفر هذا المنتج في حضرموت والمهرة وكم سعر التوصيل؟  "),


  ];
TextEditingController textEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(product.questions);
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        child: SingleChildScrollView(
          child: Wrap(
            children: <Widget>[


              GestureDetector(
                onTap: (){
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1,color: colors.primary)
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: TextFormField(
controller: textEditingController,

                        decoration: InputDecoration(
                            border: InputBorder.none
                            ,
                            hintText: "اطرح سؤالاً"

                        ),
maxLines: null,
                      )),

GestureDetector(

  onTap: (){
if(Login().isLogin()) {
  getResponseData().getDataWithToken(url: urls.addQuestion,
      token: TokenProvider.token,
      data: {
        "product_id": product.id,
        "text": textEditingController.text.toString()
      }).then((value) {
    print(value.data);
  });
}

else{
  Get.to(AccountPage(islogin: true,));

}


  },

  child:   Container(

    decoration: BoxDecoration(shape: BoxShape.circle



    ,color: colors.white

    ),





  child: Directionality

    (

    textDirection: TextDirection.rtl,

    child:   Container(



        padding: EdgeInsets.all(5),



        child: Icon(Icons.send,color: colors.primary,)),

  ),

  ),
),

                    ],
                  ),

               //   height: 30,

                ),
              ),

              Expanded(
                child:product.questions.length!=null  &&product.questions.length>0?  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:product.questions.length!=null  &&product.questions.length>0? product.questions.length:0,
                    itemBuilder: (bc,index)=>productQuestionItem(rate: product.questions[index],)):Container(),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
