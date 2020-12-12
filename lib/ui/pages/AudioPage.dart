import 'package:flutter/material.dart';
import 'package:yemenwe/ui/widgets/PlayerWidget.dart';
class AudioPage extends StatelessWidget {
  AudioPage({this.url});
  var url="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    //  body: PlayerWidget(url: url),

    );
  }
}
