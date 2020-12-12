import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/Rate.dart';
import 'package:yemenwe/models/store/Product.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/AccountPage.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/dialogs.dart';
import 'package:yemenwe/ui/widgets/rateItem.dart';
import 'package:yemenwe/ui/widgets/store/cardRateItem.dart';
import 'package:yemenwe/utils/Login.dart';
import 'package:yemenwe/utils/MQSize.dart';
class productdetails_rate extends StatelessWidget {


  Product product;
  productdetails_rate({this.product});



List<Rate> rates=[

  Rate(username: "علي السنيني",date: "19/10/2020",rate: 5.0,comment: "ممتاز "),
  Rate(username: "أسامة عطية",date: "09/10/2020",rate: 5.0,comment: "منتج ممتاز  "),
  Rate(username: "سامي الهمداني",date: "08/10/2020",rate: 4.0,comment: "رائع استمروا  "),
  Rate(username: "علي الصايدي",date: "12/10/2020",rate: 4.0,comment: "جيد  "),


];


  @override
  Widget build(BuildContext context) {

    getResponseData().getDataWithToken(token: TokenProvider.token,url: urls.product_details);

    return                 Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        child: SingleChildScrollView(
          child: Wrap(
            children: <Widget>[

              Container(
                  alignment: Alignment.centerRight,
                  child: Text("التقييم العام",style: Styles().consualtionStatisc(fsize: 16,mcolor: colors.black),)),

              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),


                    child: Column(
                      children: <Widget>[
                        Text("${product.rate_average}/5",style: Styles().consualtionStatisc(fsize: 13,mcolor: colors.black),),
                        Text("  المقيًمين:( ${product.rate_count} ) ",textDirection: TextDirection.rtl,style: Styles().consualtionStatiscNormalFont(fsize: 12,mcolor: colors.black),),
                      ],
                    ),
                  )
                  ,
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child:
                    SmoothStarRating(


                        allowHalfRating: true,
                        onRated: (v) {
                        },
                        starCount: 5,
                        rating: product.rate_average.toDouble(),
                        size: 35.0,
                        isReadOnly:true,

                        halfFilledIconData: Icons.star_half,
                        filledIconData: Icons.star,
                        defaultIconData: Icons.star_border,
                        color: Colors.amber,
                        borderColor: Colors.amberAccent,
                        spacing:0.0
                    ),
                  ),



//                   Column(
//                     children: <Widget>[
//
// rateItem(persent: product.rate_average,raters: product.rate_count,no: 5,),
//                       // Container(height: 1,),
//                       // rateItem(persent: 0.4,raters: 120,no: 4,),
//                       // Container(height: 1,),
//                       //
//                       // rateItem(persent: 0.2,raters: 17,no: 3,),
//                       // Container(height: 1,),
//                       //
//                       // rateItem(persent: 0.1,raters: 4,no: 2,),
//                       // Container(height: 1,),
//                       //
//                       // rateItem(persent: 0.1,raters: 3,no: 1,),
//
//                     ],
//                   ),

                ],
              ),
              GestureDetector(
                onTap: (){
                  if(Login().isLogin()){

                  dialogs().rateProduct(context,id: product.id);}

                  else{
                    Get.to(AccountPage(islogin: true,));

                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: colors.primary,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("إضافة تقييم",style: Styles().consualtionStatisc(fsize: 14,mcolor: colors.white),),

                  height: 30,),
              ),

              Expanded(
                child:product.rates.length!=null&&product.rates.length>0? ListView.builder(
shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: product.rates.length,
                    itemBuilder: (bc,index)=>cardRateItem(rate: product.rates[index],)):Container(),
              )
,

            ],
          ),
        ),
      ),
    )
    ;
  }
}
