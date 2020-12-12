import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/constants/Constant.dart';
import 'package:yemenwe/models/consulation/Comment.dart';
import 'package:yemenwe/models/consulation/Consulation.dart';
import 'package:yemenwe/ui/widgets/LoadingListShimmer.dart';
import 'package:yemenwe/ui/widgets/appBarItem.dart';
import 'package:yemenwe/ui/widgets/cosulationItem.dart';
import 'package:yemenwe/utils/SharedPref.dart';
class ConsulationScreen extends StatefulWidget {
  @override
  _ConsulationScreenState createState() => _ConsulationScreenState();
}

class _ConsulationScreenState extends State<ConsulationScreen> {
   int page = 1;
   int total=1;
  ScrollController _sc = new ScrollController();
  bool isLoading = false;
  var stop=false;
 // List consulations = new List();
  List<Consulation> consulations = [];
  List<Consulation> consulations2 = [];
  final dio = new Dio();
  @override
  void initState() {
    this._getMoreData(page);
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels ==
          _sc.position.maxScrollExtent) {
        if(page<total){

          _getMoreData(page);}
      }
    });
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildList(),
    );
  }

  Widget _buildList() {
    return consulations.length>0?  Column(
      children: <Widget>[
        appBarItem(title: "الاستشارات",type: Constant().search_consulation,),


        Expanded(
          child: ListView.builder(
            itemCount: consulations.length , // Add one more item for progress indicator
            padding: EdgeInsets.symmetric(vertical: 8.0),
            itemBuilder: (BuildContext context, int index) {
              if (index == consulations.length) {
                return _buildProgressIndicator();
              } else {
                return new consulationItem(consulation: consulations[index],);
              }
            },
            controller: _sc,
          ),
        ),
      ],
    ):stop?Center(
      child: Text(""
          "حاول مروة أخرى"),


    ):LoadingListShimmer();
  }

  void _getMoreData(int index) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      var url = urls.allCons+"?page="
         + page.toString()
      ;
       //   "&results=20&seed=abc";
     // print(url);
    //  final response = await dio.post(url);


      SharedPref().getString(key: "token").then((token) {

        var d=getResponseData().getDataWithToken(token: token,url: url).then((res) {
          if(res.data!=null) {
            print(res.data);
            print("total");
            print(res.data['Posts']['last_page']);

            List tList = new List();
            consulations.clear();
            consulations2.clear();
            for (int i = 0; i < res.data['Posts']['data'].length; i++) {
              List<Comment> comments = [];

              var comnts = res.data['Posts']['data'][i]['comments'] as List;


              comnts.forEach((element) {
                var c = Comment(

                  id: element['id'],
                  msg: element['body'],
                  type: element['is_consonant'] == 0 ? "مستخدم" : "استشاري",
                  date: element['published'],

                );

                comments.add(c);
              });

              var con = Consulation(
                  id: res.data['Posts']['data'][i]['id'],
                  title: res.data['Posts']['data'][i]['title'],
                  description: res.data['Posts']['data'][i]['body'],
                  date: res.data['Posts']['data'][i]['published'],
                  cat: res.data['Posts']['data'][i]['category']['id'],
                  type: res.data['Posts']['data'][i]['category']['name'],
                  comments: comments


              );
              consulations2.add(con);
              tList.add(res.data['Posts']['data'][i]);
            }

            setState(() {
              total = res.data['Posts']['to'];

              if (page < total) {
                isLoading = false;

                consulations.addAll(consulations2);

                page++;
              }
            });
          }

        else{
          setState(() {
            stop=true;
          });
          }
        });

      });


    }
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

}
