import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/ui/pages/store/ViewMoreProducts1.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
class cardCatItem extends StatelessWidget {
  String title, img;
  int id;
  Function function;


  cardCatItem({this.id,this.title,this.img,this.function});



  @override
  Widget build(BuildContext context) {
  //  print(urls().storeimages+img);
    return
      GestureDetector(
          onTap: (){
          //  function();
            Get.to(ViewMoreProducts1(id: id,));
          },
          child: Container(
          //  height: 80,
           // width: 120,
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Column(
mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(

                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),

                child
                : Container(

padding: EdgeInsets.all(10),
                    child: CachedNetworkImage(imageUrl: urls.storeimages+img,width: 40,height: 40,)))
            ,
            Text(title,textAlign: TextAlign.center,style: Styles().consualtionStatisc(fsize: 12),)

          ],

          ),
          ));
  }
}
