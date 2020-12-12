import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/store/Product.dart';
import 'package:yemenwe/models/training/Course.dart';
import 'package:yemenwe/providers/FavProvider.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';
class fav extends StatefulWidget {
  fav({this.isFav=false,this.product});
  var isFav=true;
  Product product;

  @override
  _favState createState() => _favState();
}

class _favState extends State<fav> {

  var load=0;

  addTofav(){



      //   print(value['token']);
      if(TokenProvider.token!=null&&TokenProvider.token.length>0) {
        getResponseData().getDataWithToken(url: urls.like,
            token: TokenProvider.token,
            data: {
              "token": TokenProvider.token,
              //  "training_id": widget.course.id,
              "liked_id": widget.product.id,
              "type": "product"
            }).then((res) {
          print(res.data);
          Provider.of<FavProvider>(context,listen: false).update();

          // var d=json.decode(res.data.toString());
          print(res.data['data']);

          setState(() {
            widget.product.fav=int.parse(res.data['data'].toString().trim());
          });
        });
      }
      else{

        mToast().show(context,msg: "يجب تسجيل الدخول");
      }


  }


  @override
  Widget build(BuildContext context) {

print("ffffffffffffffffffffffffffffffffffffff");
//print(widget.course.liked);
print("ffffffffffffffffffffffffffffffffffffff");
    //Provider.of<FavProvider>(context,listen: false).update();

    return   GestureDetector(
        onTap: (){

          addTofav();
        },

        child:
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 6,
          child: Container(
            padding: EdgeInsets.all(5),
            //    color: colors().primary.withOpacity(0.1),

            child: Icon( widget.product.fav==1? Icons.favorite :Icons.favorite_border,size: 25,color: colors.primary,),
          ),
        ));
  }
}
