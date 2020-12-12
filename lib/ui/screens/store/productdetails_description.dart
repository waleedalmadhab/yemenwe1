import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:yemenwe/models/store/Product.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/htmlItem.dart';
import 'package:yemenwe/utils/MQSize.dart';
class productdetails_description extends StatelessWidget {
  Product product;
  productdetails_description({this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MQSize.height,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(children: <Widget>[


            Text("${product.name}",style: Styles().consualtionStatisc(fsize: 12,mcolor: colors.black),)


            ,
            Row(
              children: <Widget>[
                Text(" السعر:",style: Styles().consualtionStatisc(fsize: 10),),

                Text("${product.price}",textAlign: TextAlign.right,style: Styles().consualtionStatiscNormalFont(fsize: 8),),

              ],
            ),

            Container(height: 20,

              child: Row(children: <Widget>[


                Icon(CupertinoIcons.location,size: 15,),
                Text("${product.location}",style: Styles().consualtionStatisc(fsize: 10),)


              ],),
            ),


            Container(height: 1,color: colors.grey,),
            Text(" التفاصيل:",style: Styles().consualtionStatisc(fsize: 10),),
htmlItem(data: product.details.toString(),),
            Container(height: 1,color: colors.grey,),








          ],),

        ],
      ),


    );
  }
}
