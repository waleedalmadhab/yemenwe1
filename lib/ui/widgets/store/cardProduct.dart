import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/route_manager.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/store/Product.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/AccountPage.dart';
import 'package:yemenwe/ui/pages/store/ProductDetails.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/store/fav.dart';
import 'package:yemenwe/utils/Login.dart';
import 'package:yemenwe/utils/MQSize.dart';
import 'package:yemenwe/utils/Toast.dart';

class cardProduct extends StatelessWidget {

  Product product;
  cardProduct({this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(ProductDetails(product: this.product,));
      },
      child: Container(
        height: 230,
        width: (MQSize.width/2)-10,
        child: Card(
elevation: 8,
          child: Column(
            children: <Widget>[

              Stack(
                children: <Widget>[

                  Container(
                    //  margin: EdgeInsets.only(left: 0),
                      child: CachedNetworkImage( imageUrl: product.thumbnail,width: (MQSize.width/2)-10,height: 120, fit: BoxFit.fill,

                        placeholder: (context, url) => Container(
                            height: 102,
                            alignment: Alignment.center,
                            child: SpinKitRing(color: colors.primary)),
                        errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),


                      )

                  ),
                  Positioned(
                      top: 0,
                      left: 3,
                      child: fav(product: product,isFav: product.fav==1?true:false,)
                      // GestureDetector(
                      //   onTap: (){
                      //
                      //     if(Login().isLogin()) {
                      //       getResponseData().getDataWithToken(
                      //           token: TokenProvider.token,
                      //           url: urls().like,
                      //           data: {
                      //             "token": TokenProvider.token,
                      //             "type": "product",
                      //             "liked_id": product.id
                      //           }).then((value) {
                      //         print(value.data);
                      //       });
                      //     }
                      //     else{
                      //       Get.to(AccountPage(islogin: true,));
                      //
                      //     }
                      //   },
                      //
                      //   child: Card(
                      //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      //     elevation: 6,
                      //     child: Container(
                      //       padding: EdgeInsets.all(5),
                      //   //    color: colors().primary.withOpacity(0.1),
                      //
                      //       child: Icon( product.fav==1? Icons.favorite :Icons.favorite_border,size: 25,color: colors().primary,),
                      //     ),
                      //   ),
                      // )

                  ),

                ],
              ),
              Expanded(
                child: Container(
             //   height: 40,
                  child: Row(children: <Widget>[
                    Expanded(
                      child: Container(
                      //  width: MQSize().width,
decoration: BoxDecoration(
  color: colors.primary.withOpacity(.1),


),
                        child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                           //   color: colors().green,
                              padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                              child: Text(product.name,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,style: Styles().consualtionStatisc(fsize: 9,mcolor: colors.black),),
                            ),
                          ),
                       //   Spacer(),
                          Text(  product.price+" ر.ي ",textDirection: TextDirection.rtl,maxLines: 1,style: Styles().consualtionStatisc(fsize: 8,mcolor: colors.black),),

                        ],
                      ),),
                    ),
                    product.discount!=null?      Container(
                    //  padding: EdgeInsets.all( product.discount!=null&&product.discount.trim().length>0? 2:0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: colors.secondry,
                      //    borderRadius: BorderRadius.only(topLeft: Radius.circular(10))
                      ),

                      child: Text(  product.discount,style: Styles().consualtionStatiscNormalFont(fsize: 10,mcolor: colors.white),),):Container(),

                  ],),
                ),
              ),
              Container(
                height: 15,
                child: Row(
                children: <Widget>[
              //    Spacer(),

Container(width: 2,),
                 Directionality(
                   textDirection: TextDirection.rtl,
                   child:
                   SmoothStarRating(


                        allowHalfRating: true,
                        onRated: (v) {
                        },
                        starCount: 5,
                        rating: product.rate_average.toDouble(),
                        size: 15.0,
                        isReadOnly:true,

                        halfFilledIconData: Icons.star_half,
                        filledIconData: Icons.star,
                        defaultIconData: Icons.star_border,
                        color: Colors.amber,
                        borderColor: Colors.amberAccent,
                        spacing:0.0
                    ),
                 ),
                  Row(children: <Widget>[

                    Text("("+product.rate_count.toString()+" )",textDirection: TextDirection.rtl,style: Styles().consualtionStatiscNormalFont(fsize: 8),),


                  ],),

                  Container(width: 2,),


                ],
              ),)
,
              Container(height: 20,

              child: Row(children: <Widget>[


                Icon(CupertinoIcons.location,size: 15,),
                Expanded(child: Text("${product.location}",overflow: TextOverflow.ellipsis,style: Styles().consualtionStatiscNormalFont(fsize: 8),))


              ],),
              ),

//               Container(
//                 height: 30,
//                 margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
//
//                 child: Row(
//                   children: <Widget>[
//
//
//
//                     Expanded(
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(3),
//
//                             border: Border.all(color: colors().primary,width: 2)
//                         ),
//                         height: 30,
//
//                       child: Row(children: <Widget>[
//
//                         Container(
//                           alignment: Alignment.center,
//                           padding: EdgeInsets.symmetric(horizontal: 5),
//                           decoration: BoxDecoration(
//
//                             color: colors().primary,
//                               border: Border.all(color: colors().primary,width: 2)
//                           ),
// child: Icon(Icons.add_shopping_cart,size: 20,
// color: colors().white,
// ),
//
//
//                         ),
//
//                          Expanded(
//                            child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
//                             child: Text("إضافة إلى السلة",textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,style: Styles().consualtionStatisc(fsize: 10,mcolor: colors().black),),
//                         ),
//                          ),
//
//                       ],),
//                       ),
//                     ),
//
//                   ],
//                 ),
//               )


            ],

          ),
        ),
      ),
    );
  }
}
