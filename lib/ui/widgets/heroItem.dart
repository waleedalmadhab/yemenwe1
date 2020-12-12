import 'package:flutter/material.dart';
class HeroItem extends StatelessWidget {

  String tag;
  HeroItem({this.tag});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Hero(tag: tag,
child: Image.asset("images/ywulogo.png",width: 300,height: 300,),


      ),
    );
  }
}
