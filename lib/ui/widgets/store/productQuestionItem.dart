import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:yemenwe/models/Rate.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/utils/MQSize.dart';
class productQuestionItem extends StatelessWidget {

  Map rate;
  productQuestionItem({this.rate});
  @override
  Widget build(BuildContext context) {
    return Directionality(

     textDirection: TextDirection.rtl,
      child: Card(

        margin: EdgeInsets.all(0),
        child: Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Ionicons.person_circle_outline,size: 20,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(rate['user_name'],style: Styles().consualtionStatisc(fsize: 12),),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: <Widget>[
                        Icon(Ionicons.calendar_outline,size: 12,),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(rate['published'],style: Styles().consualtionStatiscNormalFont(fsize: 8),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
            ,


            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
                width: MQSize.width,
                child: Text(rate['text'],style: Styles().consualtionStatiscNormalFont(fsize: 12),))

            ,

            Divider(height: 1,thickness: 1,

            color: colors.grey,
            )


          ],
        ),

      ),
    );
  }
}
