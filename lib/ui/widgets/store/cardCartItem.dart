import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/store/Product.dart';
import 'package:yemenwe/providers/CartProvider.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/utils/MQSize.dart';
class cardCartItem extends StatefulWidget {

  Product product;
  cardCartItem({this.product});

  @override
  _cardCartItemState createState() => _cardCartItemState();
}

class _cardCartItemState extends State<cardCartItem> {


  var count=1;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    count=widget.product.quantity;
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Card(

            child: Column(
              children: <Widget>[


                Container(

             //     margin: EdgeInsets.all(10),
                  child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
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
                                            child: new CachedNetworkImage(imageUrl:
                                            '${widget.product.thumbnail}',
                                              width: 300.0,
                                              height: 300.0,
                                              alignment: Alignment.center,
                                              fit: BoxFit.contain,
                                            ),
                                            tag: "${widget.product.thumbnail}",
                                          ),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ));
                                }));


                          },

                          child: CachedNetworkImage(imageUrl: widget.product.thumbnail,width: 100,height: 100,)),


Expanded(child: Container(
  padding: EdgeInsets.only(right: 10),
alignment: Alignment.centerRight,
  width: MQSize.width,
  child: Column(

mainAxisAlignment: MainAxisAlignment.end,
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[



            Row(
              children: <Widget>[
                  Text(widget.product.name,textAlign: TextAlign.right,style: Styles().consualtionStatisc(fsize: 10),),
              ],
            ),

            Row(
              children: <Widget>[
                  Text("سعر الوحدة:",style: Styles().consualtionStatisc(fsize: 10),),

                  Text(   widget.product.price+ "  ر.ي ",textAlign: TextAlign.right,style: Styles().consualtionStatiscNormalFont(fsize: 10),),

              ],
            ),

            Row(
              children: <Widget>[
                  Text("المجموع الفرعي:",style: Styles().consualtionStatisc(fsize: 10),),

                  Text(  (count*double.parse( widget.product.price)).toString()+  "  ر.ي ",textAlign: TextAlign.right,style: Styles().consualtionStatiscNormalFont(fsize: 10),),

              ],
            ),



            Directionality(

              textDirection: TextDirection.rtl,

              child: Row(

                children: <Widget>[

                  Text("البائع:",style: Styles().consualtionStatisc(fsize: 10),),

                  Text(""+widget.product.seller,style: Styles().consualtionStatiscNormalFont(fsize: 8),overflow: TextOverflow.ellipsis,maxLines: 1,),

                ],

              ),

            ),







          ],



  ),
)),
                      Container(
                             margin: EdgeInsets.only(top: 30,left: 3,bottom: 3),

                      decoration: BoxDecoration(border: Border.all(width: 1)),
                        height: 60,
                        width: 90,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[

                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: colors.grey2,
                                          border: Border.symmetric(vertical: BorderSide(width: 1,color: colors.primary))),
                                      child: Column(

                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                           //   color: colors().bg3,
                                              child: GestureDetector(

                                                  onTap: (){
                                                    if(count<50){
                                                      setState(() {
                                                        count++;

                                                        widget.product.quantity=count;

                                                      });
                                                    }

                                                  },

                                                  child: Icon(Icons.add,color: colors.primary,)),
                                            ),
                                          ),
Divider(height: 5,color: colors.primary,),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: (){
                                                  if(count>1){
                                                    setState(() {
                                                      count--;
                                                      widget.product.quantity=count;


                                                    });
                                                  }



                                                },
                                              child: Container(
                                                child: Icon(Icons.remove,color: colors.primary,),
                                              ),
                                            ),
                                          )

                                        ],


                                      ),
                                    ),
                                  ),




                                ],



                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child:                                 Container(
                                  alignment: Alignment.center,
                                  child: Text("$count")),
                            )
                          ],
                        ),

                      ),


                    ],
                  ),
                ),),

              ],

            ),


          ),
          Positioned(
              top: 0,
              left: 0,
              child: GestureDetector(
                  onTap: (){
getResponseData().getDataWithToken(url: urls.delete_from_cart,token: TokenProvider.token,data: {"id":widget.product.cartId}).then((value) {
print(value);
  Provider.of<CartProvider>(context,listen: false).update();


});

                  },

                  child: Icon(Icons.cancel,color: colors.primary,)))

        ],
      ),
    );
  }
}
