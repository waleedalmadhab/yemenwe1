import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/models/Issue.dart';
import 'package:yemenwe/models/consulation/Comment.dart';
import 'package:yemenwe/models/consulation/Consulation.dart';
import 'package:yemenwe/models/training/Course.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/widgets/cosulationItem.dart';
import 'package:yemenwe/ui/widgets/courseItemList.dart';
import 'package:yemenwe/ui/widgets/issueItem.dart';
class SearchPage extends StatefulWidget {

  String type="trainings";
  SearchPage({this.type="trainings"});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  var text="";

  List<Course> courses=[];
  List<Consulation> consulations=[];
  List<Issue> issuses=[];

  bool issearch=false;

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    Provider.of<TokenProvider>(context,listen: true).update();

  return Scaffold(

        body: Column(
          children: <Widget>[


            Container(

              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 25),
                        child: BackButton(onPressed: (){
                          Navigator.pop(context);

                        },))
,
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 30,right: 5,left: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: colors.primary.withOpacity(0.2),

                        ),


                        height: 35,
                        width: w,
                        alignment: Alignment.centerRight,
                        //   margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: <Widget>[

                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(right: 20,left: 10,top: 10),

                                  child: TextFormField(

                                    onFieldSubmitted: (txt){
                                      print(txt);
                                      this.text=txt;
                                    },
                                    onChanged: (txt){

                                      text=txt;
                                    },
                                    textInputAction: TextInputAction.search,

                                    textDirection: TextDirection.rtl,

                                    decoration: InputDecoration(
                                        hintText: "بحث",

                                        border: InputBorder.none
                                    ),

                                  ),
                                ),
                              ),
                               Container(
                              //   color: colors().grey,
                              //   margin: EdgeInsets.only(bottom: 20),
                                 child: IconButton(
                                  icon: Icon(Icons.search)

                                  ,
                                  onPressed: (){

                                    setState(() {
                                      issearch=true;
                                    });
                                  },
                              ),
                               )

                            ],
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(

                width: w,
                height: h,
                child: issearch?getData():Container(),
              ),
            ),
          ],
        ));
  }



 Widget getData(){
print(TokenProvider.token);


print(text);
    return FutureBuilder(
      future: getResponseData().getDataWithToken(url: urls.search,token: TokenProvider.token,data: {"token":TokenProvider.token,"search":"$text","type":"${widget.type}"}),
        builder: (bc,snapshot){
//         consulations.clear();
//           var d = json.decode(snapshot.data.toString());
//           var dd = d['data'] as List;
// print(dd);
//
//           for (int i = 0; i < dd.length; i++)
//           {
//
//
//             List<Comment> comments=[];
//
//             var comnts=dd[i]['comments'] as List;
//
//
//             comnts.forEach((element) {
//
//               var c=Comment(
//
//                 id: element['id'],
//                 msg: element['body'],
//                 type: element['is_consonant']==0?"مستخدم":"استشاري",
//                 date: element['published'],
//
//               );
//
//               comments.add(c);
//
//             });
//
//             var con=Consulation(
//                 id: dd[i]['id'],
//                 title: dd[i]['title'],
//                 description: dd[i]['body'],
//                 date: dd[i]['published'],
//                 cat: dd[i]['category']['id'],
//                 type: dd[i]['category']['name'],
//                 comments: comments
//
//
//             );
//             consulations.add(con);
//             //  tList.add(res.data['Posts']['data'][i]);
//           }
//
// print(consulations.length);
        if(snapshot.data==null){
          return Container();
        }
        else{


          {
        //    print(snapshot.data);

              if (widget.type == "trainings") {
                if (snapshot.data != null) {
                  var d = json.decode(snapshot.data.toString());
                  var dd = d['data'];
                  courses.clear();
                  dd.forEach((element) {
                    print(element['id']);

                    courses.add(Course(
                      id: element['id'],
                      instractor: element['instructor'],
                      title: element['name'],
                      type: element['type'],
                      length: element['length'],
                      start_date: element['start_at'],
                      end_date: element['end_at'],
                      img: element['thumbnail'],
                      liked: element['is_like'] != null ? 1 : 0,
                      registered: element['is_register'] != null ? 1 : 0,

                      shortDescription: element['description'],

                    ));
                  });
                  Provider.of<TokenProvider>(context, listen: false).update();


                  return trainingwidget();
                }
              }

              else if (widget.type == "posts") {
                if (snapshot.data != null) {
                  var d = json.decode(snapshot.data.toString());
                  var dd = d['data'] as List;


                  List tList = new List();
                  consulations.clear();
                  for (int i = 0; i < dd.length; i++) {


                    List<Comment> comments=[];

                    var comnts=dd[i]['comments'] as List;


                    comnts.forEach((element) {

                      var c=Comment(

                        id: element['id'],
                        msg: element['body'],
                        type: element['is_consonant']==0?"مستخدم":"استشاري",
                        date: element['published'],

                      );

                      comments.add(c);

                    });

                    var con=Consulation(
                        id: dd[i]['id'],
                        title: dd[i]['title'],
                        description: dd[i]['body'],
                        date: dd[i]['published'],
                        cat: dd[i]['category']['id'],
                        type: dd[i]['category']['name'],
                        comments: comments


                    );
                    consulations.add(con);
                    //  tList.add(res.data['Posts']['data'][i]);
                  }

                  //consulations.clear();
                  // dd.forEach((element) {
                  //   //   print(element['id']);
                  //
                  //
                  //
                  //   consulations.add(Consulation(
                  //     id: element['id'],
                  //     title: element['id'],
                  //     description: element['id'],
                  //
                  //
                  //   ));
                  // });
                  Provider.of<TokenProvider>(context,listen: false).update();


                  return consulationswidget();
                }
              }
              else if (widget.type == "women_posts") {
                if (snapshot.data != null) {


                  var d = json.decode(snapshot.data.toString());
                  var dd = d['data'];

                  print(d);
                  issuses.clear();
                  dd.forEach((element) {
//print(element);
                    issuses.add(Issue(
                      id: element['id'],
                       title: element['title'],
                       details: element['body'],
                       img: element['image'],
                       date: element['published'],

                    ));
                  });
                  Provider.of<TokenProvider>(context,listen: false).update();


                  return issusewidget();
                }
              }
              else {
                return Container();
              }



          }

        }


    });

  }


  Widget trainingwidget(){



    return  courses.length!=null&&courses.length>0? ListView.builder(

itemCount: courses.length,
        itemBuilder: (bc,index){


  return courseItemList(course: courses[index],);

        }):Container();

  }

  Widget issusewidget(){



    return  issuses.length!=null&&issuses.length>0? ListView.builder(

        itemCount: issuses.length,
        itemBuilder: (bc,index){


          return issueItem(issue: issuses[index],);

        }):Container();

  }
  Widget consulationswidget(){



    return  consulations.length!=null&&consulations.length>0? ListView.builder(

        itemCount: consulations.length,
        itemBuilder: (bc,index){


          return consulationItem(consulation: consulations[index],);

        }):Container();

  }


}
