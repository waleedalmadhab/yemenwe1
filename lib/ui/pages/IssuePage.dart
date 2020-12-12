import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/constants/Constant.dart';
import 'package:yemenwe/models/Issue.dart';
import 'package:yemenwe/ui/widgets/LoadingListShimmer.dart';
import 'package:yemenwe/ui/widgets/appBarItem.dart';
import 'package:yemenwe/ui/widgets/cosulationItem.dart';
import 'package:yemenwe/ui/widgets/issueItem.dart';
import 'package:yemenwe/utils/SharedPref.dart';
class IssuePage extends StatefulWidget {
  @override
  _IssuePageState createState() => _IssuePageState();
}

class _IssuePageState extends State<IssuePage> {
   int page = 1;
   int total=1;
  ScrollController _sc = new ScrollController();
  bool isLoading = false;
 // List consulations = new List();
  List<Issue> issues = [];
  List<Issue> issues2 = [];
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
    return issues.length>0?  Column(

      children: <Widget>[
        appBarItem(title: "شؤون المرأة",type: Constant().search_issue,),

        Expanded(
          child: ListView.builder(
            itemCount: issues.length , // Add one more item for progress indicator
            padding: EdgeInsets.symmetric(vertical: 8.0),
            itemBuilder: (BuildContext context, int index) {
              if (index == issues.length) {
                return _buildProgressIndicator();
              } else {
                return new issueItem(issue: issues[index],);
              }
            },
            controller: _sc,
          ),
        ),
      ],
    ):LoadingListShimmer();
  }

  void _getMoreData(int index) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      var url = urls.allWissuse+"?page="
         + page.toString()
      ;
       //   "&results=20&seed=abc";
      print(url);
      final response = await dio.post(url);


      SharedPref().read( "user").then((token) {

        var d=getResponseData().getDataWithToken(token: token['token'],url: url).then((res) {

          print("total");
          print(res.data['Posts']['last_page']);

          List tList = new List();
          for (int i = 0; i < res.data['Posts']['data'].length; i++) {



            var con=Issue(
              id: res.data['Posts']['data'][i]['id'],
              title: res.data['Posts']['data'][i]['title'],
              details: res.data['Posts']['data'][i]['body']!=null?res.data['Posts']['data'][i]['body']:"",
              img: res.data['Posts']['data'][i]['body']!=null?res.data['Posts']['data'][i]['image']:"",
              video: res.data['Posts']['data'][i]['body']!=null?res.data['Posts']['data'][i]['video_url']:"",
              book: res.data['Posts']['data'][i]['body']!=null?res.data['Posts']['data'][i]['book']:"",
              ext_book: res.data['Posts']['data'][i]['body']!=null?res.data['Posts']['data'][i]['book_external_link']:"",
              date: res.data['Posts']['data'][i]['published'],


            );
            issues2.add(con);
            tList.add(res.data['Posts']['data'][i]);
          }

          setState(() {
            total=res.data['Posts']['to'];

           if(page<total){
             isLoading = false;

             issues.addAll(issues2);

            page++;}
          });

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
