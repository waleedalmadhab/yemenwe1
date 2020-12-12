import 'package:flutter/material.dart';
import 'package:yemenwe/models/training/Content.dart';
import 'package:yemenwe/utils/IssueType.dart';
class ExpandableListView extends StatelessWidget {
  static final List<String> _listViewData = [
    "Inducesmile.com",
    "Flutter Dev",
    "Android Dev",
    "iOS Dev!",
    "React Native Dev!",
    "React Dev!",
    "express Dev!",
    "Laravel Dev!",
    "Angular Dev!",
  ];

  List<ExpansionTile> _listOfExpansions = List<ExpansionTile>.generate(
      9,
          (i) => ExpansionTile(
        title: Text("Expansion $i"),
        children: _listViewData
            .map((data) => ListTile(
          leading: Icon(Icons.person),
          title: Text(data),
          subtitle: Text("a subtitle here"),
        ))
            .toList(),
      ));

  List <Content> lectures1=[
//    Content(id: 1,title: "About this lecture",length: "",issueType: IssueType.book,size: "1.2MB",isComplete: 1),
//    Content(id: 1,title: "Creative",length: "",issueType: IssueType.video,size: "1.2MB",isComplete: 1),
//    Content(id: 1,title: "Resourse on creative",length: "",issueType: IssueType.sound,size: "1.2MB",isComplete: 0),
//    Content(id: 1,title: "Edward de bono on Creative thinking",length: "",issueType: IssueType.video,size: "1.2MB",isComplete: 0),
//    Content(id: 1,title: "Question of this Lecture",length: "",issueType: IssueType.book,size: "1.2MB",isComplete: 0)
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expandable ListView Example'),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (bc,i)=>Container(
          child: ExpansionTile(title: Text("index= $i ")

          ,
            children:lectures1.map((e) => Container(
              child: Text(e.title),

            )).toList() ),
          ),
        ),
      );

  }
}