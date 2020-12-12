import 'package:flutter/material.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';

class listTileAccountItem extends StatelessWidget {

  var title="";
  var subtitletitle="";
  var img="";
  IconData iconData;
  Function function;
  Color color;

  listTileAccountItem({this.title,this.iconData,this.function,this.color,this.subtitletitle="",this.img=""});

  @override
  Widget build(BuildContext context) {
    return ListTile(
onTap: function,
      contentPadding: EdgeInsets.only(left: 10,right: 10),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(this.title,style: Styles().TitleTextStyle14Black,textAlign: TextAlign.right,),
          this.subtitletitle!=""? Text(this.subtitletitle,style: Styles().subTitleTextStyle10,textAlign: TextAlign.right,):Container()

        ],
      ),
      trailing:          this.img!=""? Image.asset("images/"+ this.img,width: 25,height: 25,):Container(
//padding: EdgeInsets.all(7),

          decoration: BoxDecoration(
//border: Border.all(width: 2,color: colors().blueDark),
             // color:Colors.black87 ,
             // borderRadius: BorderRadius.circular(30)

          ),

          child: Icon(iconData
,            color:Colors.black87

            ,size: 30,))
        ,
      leading: Container(
          padding: EdgeInsets.all(5),

          decoration: BoxDecoration(
            //  border: Border.all(width: 2,color: colors().bg2),
              color: colors.bg3 ,
              borderRadius: BorderRadius.circular(30)

          ),


          child: Icon(Icons.keyboard_arrow_left ,)),


    );
  }
}
