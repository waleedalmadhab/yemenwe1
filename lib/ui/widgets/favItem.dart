import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/training/Course.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';
class favItem extends StatefulWidget {
  favItem({this.isFav=false,this.course});
  var isFav=true;
  Course course;

  @override
  _favItemState createState() => _favItemState();
}

class _favItemState extends State<favItem> {

  addTofav(){


    SharedPref().read( "user").then((value) {

      //   print(value['token']);
      if(value!=null) {

        getResponseData().getDataWithToken(url: urls.like,
            token: value['token'],
            data: {
              "token": value['token'],
              //  "training_id": widget.course.id,
              "liked_id": widget.course.id,
              "type": "training"
            }).then((res) {
          print(res.data);
          // var d=json.decode(res.data.toString());
          print(res.data['data']);

          setState(() {
            widget.course.liked=int.parse(res.data['data'].toString().trim());
          });
        });
      }
      else{

        mToast().show(context,msg: "يجب تسجيل الدخول");
      }

    });

  }


  @override
  Widget build(BuildContext context) {

print("ffffffffffffffffffffffffffffffffffffff");
print(widget.course.liked);
print("ffffffffffffffffffffffffffffffffffffff");
    //Provider.of<FavProvider>(context,listen: false).update();

    return   GestureDetector(
        onTap: (){

          addTofav();
        },

        child: Container(child: Icon(widget.course.liked==1?Icons.favorite:Icons.favorite_border,color: widget.course.liked==1?Colors.amber:colors.grey,),));
  }
}
