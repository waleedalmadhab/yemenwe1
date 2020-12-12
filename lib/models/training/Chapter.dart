

import 'package:yemenwe/utils/IssueType.dart';

import 'Titles.dart';

class  Chapter{

  var id=1;
  var trainMaterialId=1;
  var title="";

  List<Titles> levels=[];


  Chapter({this.id,this.trainMaterialId,this.title,this.levels});


  List <Chapter> chapters=[];

//
//  List<Chapter> getChapters(){
//
//    List <Titles> levels1=[];
//    List <Titles> levels2=[];
//    List <Titles> levels3=[];
//    List <Titles> levels4=[];
//    List <Titles> levels5=[];
//    List <Content> lectures1=[];
//    List <Content> lectures2=[];
//    List <Content> lectures3=[];
//    List <Content> lectures4=[];
//    List <Content> lectures5=[];
//
//    lectures1.add(Content(id: 1,title: "About this lecture",length: "",issueType: IssueType.book,size: "1.2MB"));
//    lectures1.add(Content(id: 1,title: "Creative",length: "",issueType: IssueType.video,size: "1.2MB"));
//    lectures1.add(Content(id: 1,title: "Resourse on creative",length: "",issueType: IssueType.sound,size: "1.2MB"));
//    lectures1.add(Content(id: 1,title: "Edward de bono on Creative thinking",length: "",issueType: IssueType.video,size: "1.2MB"));
//    lectures1.add(Content(id: 1,title: "Question of this Lecture",length: "",issueType: IssueType.book,size: "1.2MB"));
//
//
//    lectures2.add(Content(id: 1,title: "About this lecture",length: "",issueType: IssueType.book,size: "1.2MB"));
//    lectures2.add(Content(id: 1,title: "Creative",length: "",issueType: IssueType.video,size: "1.2MB"));
//    lectures2.add(Content(id: 1,title: "Resourse on creative",length: "",issueType: IssueType.sound,size: "1.2MB"));
//
//
//    lectures3.add(Content(id: 1,title: "About this lecture",length: "",issueType: IssueType.book,size: "1.2MB"));
//    lectures3.add(Content(id: 1,title: "Creative",length: "",issueType: IssueType.video,size: "1.2MB"));
//    lectures3.add(Content(id: 1,title: "Resourse on creative",length: "",issueType: IssueType.sound,size: "1.2MB"));
//    lectures3.add(Content(id: 1,title: "Edward de bono on Creative thinking",length: "",issueType: IssueType.video,size: "1.2MB"));
//    lectures3.add(Content(id: 1,title: "Question of this Lecture",length: "",issueType: IssueType.book,size: "1.2MB"));
//
//
//    lectures4.add(Content(id: 1,title: "About this lecture",length: "",issueType: IssueType.book,size: "1.2MB"));
//    lectures4.add(Content(id: 1,title: "Creative",length: "",issueType: IssueType.video,size: "1.2MB"));
//    lectures4.add(Content(id: 1,title: "Resourse on creative",length: "",issueType: IssueType.sound,size: "1.2MB"));
//    lectures4.add(Content(id: 1,title: "Edward de bono on Creative thinking",length: "",issueType: IssueType.video,size: "1.2MB"));
//    lectures4.add(Content(id: 1,title: "Question of this Lecture",length: "",issueType: IssueType.book,size: "1.2MB"));
//
//    lectures5.add(Content(id: 1,title: "About this lecture",length: "",issueType: IssueType.book,size: "1.2MB"));
//    lectures5.add(Content(id: 1,title: "Creative",length: "",issueType: IssueType.video,size: "1.2MB"));
//
//
//    levels1.add(Titles(id: 1,isComplete: 0,title: "0.1 Welcome to this course",contents: lectures1));
//levels2.add(Titles(id: 1,isComplete: 0,title: "1.0 overview",contents: lectures2));
//levels2.add(Titles(id: 1,isComplete: 0,title: "1.1 Curisoity",contents: lectures3));
//levels2.add(Titles(id: 1,isComplete: 0,title: "1.2 Creativity",contents: lectures4));
//levels2.add(Titles(id: 1,isComplete: 0,title: "1.3 Different Thinking",contents: lectures5));
//levels2.add(Titles(id: 1,isComplete: 0,title: "1.4 Applying Creativity to a probleem",contents: lectures3));
//
//
//
//    levels3.add(Titles(id: 1,isComplete: 0,title: "2.1 Curisoity",contents: lectures3));
//    levels3.add(Titles(id: 1,isComplete: 0,title: "2.2 Creativity",contents: lectures5));
//    levels3.add(Titles(id: 1,isComplete: 0,title: "2.3 Different Thinking",contents: lectures2));
//    levels3.add(Titles(id: 1,isComplete: 0,title: "2.4 Applying Creativity to a probleem",contents: lectures4));
//
//
//    levels4.add(Titles(id: 1,isComplete: 0,title: "3.1 Curisoity",contents: lectures2));
//    levels4.add(Titles(id: 1,isComplete: 0,title: "3.2 Creativity",contents: lectures5));
//    levels4.add(Titles(id: 1,isComplete: 0,title: "3.3 Different Thinking",contents: lectures3));
//    levels4.add(Titles(id: 1,isComplete: 0,title: "3.4 Applying Creativity to a probleem",contents: lectures1));
//
//    levels5.add(Titles(id: 1,isComplete: 0,title: "4.1 Curisoity",contents: lectures2));
//    levels5.add(Titles(id: 1,isComplete: 0,title: "4.2 Creativity",contents: lectures5));
//    levels5.add(Titles(id: 1,isComplete: 0,title: "4.3 Different Thinking",contents: lectures3));
//    levels5.add(Titles(id: 1,isComplete: 0,title: "4.4 Applying Creativity to a probleem",contents: lectures1));
//
//    chapters.add(Chapter(id: 1,title: "Chapter 0:course overview",levels: levels1));
//    chapters.add(Chapter(id: 1,title: "Chapter 1:creativty's Role in Crictical Thinking and Problem",levels: levels2));
//    chapters.add(Chapter(id: 1,title: "Chapter 2:Another side of Thinking",levels: levels3));
//    chapters.add(Chapter(id: 1,title: "Chapter 3:Another side of Thinking",levels: levels4));
//    chapters.add(Chapter(id: 1,title: "Chapter 3:Another side of Thinking",levels: levels5));
//
//return chapters;
//
//
//  }
//  List<Titles> getTitles(){
//
//    List <Titles> levels1=[];
//    List <Titles> levels2=[];
//    List <Titles> levels3=[];
//    List <Titles> levels4=[];
//    List <Titles> levels5=[];
//    List <Content> lectures1=[];
//    List <Content> lectures2=[];
//    List <Content> lectures3=[];
//    List <Content> lectures4=[];
//    List <Content> lectures5=[];
//
//    lectures1.add(Content(id: 1,title: "About this lecture",length: "",issueType: IssueType.book,size: "1.2MB"));
//    lectures1.add(Content(id: 1,title: "Creative",length: "",issueType: IssueType.video,size: "1.2MB"));
//    lectures1.add(Content(id: 1,title: "Resourse on creative",length: "",issueType: IssueType.sound,size: "1.2MB"));
//    lectures1.add(Content(id: 1,title: "Edward de bono on Creative thinking",length: "",issueType: IssueType.video,size: "1.2MB"));
//    lectures1.add(Content(id: 1,title: "Question of this Lecture",length: "",issueType: IssueType.book,size: "1.2MB"));
//
//
//    lectures2.add(Content(id: 1,title: "About this lecture",length: "",issueType: IssueType.book,size: "1.2MB"));
//    lectures2.add(Content(id: 1,title: "Creative",length: "",issueType: IssueType.video,size: "1.2MB"));
//    lectures2.add(Content(id: 1,title: "Resourse on creative",length: "",issueType: IssueType.sound,size: "1.2MB"));
//
//
//    lectures3.add(Content(id: 1,title: "About this lecture",length: "",issueType: IssueType.book,size: "1.2MB"));
//    lectures3.add(Content(id: 1,title: "Creative",length: "",issueType: IssueType.video,size: "1.2MB"));
//    lectures3.add(Content(id: 1,title: "Resourse on creative",length: "",issueType: IssueType.sound,size: "1.2MB"));
//    lectures3.add(Content(id: 1,title: "Edward de bono on Creative thinking",length: "",issueType: IssueType.video,size: "1.2MB"));
//    lectures3.add(Content(id: 1,title: "Question of this Lecture",length: "",issueType: IssueType.book,size: "1.2MB"));
//
//
//    lectures4.add(Content(id: 1,title: "About this lecture",length: "",issueType: IssueType.book,size: "1.2MB"));
//    lectures4.add(Content(id: 1,title: "Creative",length: "",issueType: IssueType.video,size: "1.2MB"));
//    lectures4.add(Content(id: 1,title: "Resourse on creative",length: "",issueType: IssueType.sound,size: "1.2MB"));
//    lectures4.add(Content(id: 1,title: "Edward de bono on Creative thinking",length: "",issueType: IssueType.video,size: "1.2MB"));
//    lectures4.add(Content(id: 1,title: "Question of this Lecture",length: "",issueType: IssueType.book,size: "1.2MB"));
//
//    lectures5.add(Content(id: 1,title: "About this lecture",length: "",issueType: IssueType.book,size: "1.2MB"));
//    lectures5.add(Content(id: 1,title: "Creative",length: "",issueType: IssueType.video,size: "1.2MB"));
//
//
//    levels1.add(Titles(id: 1,isComplete: 1,title: "0.1 Welcome to this course",contents: lectures1));
//    levels1.add(Titles(id: 1,isComplete: 1,title: "1.0 overview",contents: lectures2));
//    levels1.add(Titles(id: 1,isComplete: 1,title: "1.1 Curisoity",contents: lectures3));
//    levels1.add(Titles(id: 1,isComplete: 1,title: "1.2 Creativity",contents: lectures4));
//levels1.add(Titles(id: 1,isComplete: 0,title: "1.3 Different Thinking",contents: lectures5));
//levels1.add(Titles(id: 1,isComplete: 0,title: "1.4 Applying Creativity to a probleem",contents: lectures3));
//
//
//
//    levels1.add(Titles(id: 1,isComplete: 0,title: "2.1 Curisoity",contents: lectures3));
//    levels1.add(Titles(id: 1,isComplete: 0,title: "2.2 Creativity",contents: lectures5));
//    levels1.add(Titles(id: 1,isComplete: 0,title: "2.3 Different Thinking",contents: lectures2));
//    levels1.add(Titles(id: 1,isComplete: 0,title: "2.4 Applying Creativity to a probleem",contents: lectures4));
//
//
//    levels1.add(Titles(id: 1,isComplete: 0,title: "3.1 Curisoity",contents: lectures2));
//    levels1.add(Titles(id: 1,isComplete: 0,title: "3.2 Creativity",contents: lectures5));
//    levels1.add(Titles(id: 1,isComplete: 0,title: "3.3 Different Thinking",contents: lectures3));
//    levels1.add(Titles(id: 1,isComplete: 0,title: "3.4 Applying Creativity to a probleem",contents: lectures1));
//
//    levels1.add(Titles(id: 1,isComplete: 0,title: "4.1 Curisoity",contents: lectures2));
//    levels1.add(Titles(id: 1,isComplete: 0,title: "4.2 Creativity",contents: lectures5));
//    levels1.add(Titles(id: 1,isComplete: 0,title: "4.3 Different Thinking",contents: lectures3));
//    levels1.add(Titles(id: 1,isComplete: 0,title: "4.4 Applying Creativity to a probleem",contents: lectures1));
////
////    chapters.add(Chapter(id: 1,title: "Chapter 0:course overview",levels: levels1));
////    chapters.add(Chapter(id: 1,title: "Chapter 1:creativty's Role in Crictical Thinking and Problem",levels: levels2));
////    chapters.add(Chapter(id: 1,title: "Chapter 2:Another side of Thinking",levels: levels3));
////    chapters.add(Chapter(id: 1,title: "Chapter 3:Another side of Thinking",levels: levels4));
////    chapters.add(Chapter(id: 1,title: "Chapter 3:Another side of Thinking",levels: levels5));
//
//return levels1;
//
//
//  }





}

