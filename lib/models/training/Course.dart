

import 'Titles.dart';

class Course{


  int id=1;
  String  title="";
  String  shortDescription="";
  String  instractor="";
  String  img="";
  String  category="";
  String  type="";
  String  status="";
  String  featured="";
  String  start_date="";
  String  end_date="";
  int parts=3;
  int liked=0;
  int registered=0;
  dynamic ratecount=0;
  dynamic rateaverage=0;
  String length="";
  List <Titles> titles =[];

  Course({this.id,this.title,this.shortDescription="",this.rateaverage,this.ratecount,this.instractor="",this.registered,this.liked,this.category="",this.type,this.featured,this.img="images/img_1.jpg",this.start_date="",this.end_date="",this.parts,this.length="",this.titles=const[]});

// 1-  إدارة الحالة   الدعم االنفسي الدعم القانوني   التوثيق والتغطية الإعلامية
  List <Course> subjects =[];

  List <Course>  getSubjects(){

    subjects.add(Course(id: 1,title: "المادة التدريبية الأولى",category: "الدعم النفسي",shortDescription: "هذه المادة تركز على توضيح المفاهيم الأساسية للمحاسبة",img: "images/img_2.jpg",start_date: "2020/1/21",parts: 21,length: "5 أسابيع"));
    subjects.add(Course(id: 1,title: "المادة التدريبية الثانية",category: "التغطية الإعلامية",shortDescription: "هذه المادة تركز على توضيح المفاهيم الأساسية للمحاسبة",img: "images/img_3.jpg",start_date: "2020/1/21",parts: 9,length: "3 أسابيع"));
    subjects.add(Course(id: 1,title: "المادة التدريبية الثالثة",category: "الدعم القانوني",shortDescription: "هذه المادة تركز على توضيح المفاهيم الأساسية للمحاسبة",img: "images/img_1.jpg",start_date: "2020/3/15",parts: 13,length: "4 أسابيع"));
    subjects.add(Course(id: 1,title: "المادة التدريبية الرابعة",category: "التوثيق والتغطية الإعلامية",shortDescription: "هذه المادة تركز على توضيح المفاهيم الأساسية للمحاسبة",img: "images/img_2.jpg",start_date: "2020/7/05",parts: 6,length: "5 أيام"));
    subjects.add(Course(id: 1,title: "المادة التدريبية الخامسة",category: "إدارة الحالة",shortDescription: "هذه المادة تركز على توضيح المفاهيم الأساسية للمحاسبة",img: "images/img_3.jpg",start_date: "2020/4/09",parts: 29,length: " أسبوعين"));



return subjects;

  }




}