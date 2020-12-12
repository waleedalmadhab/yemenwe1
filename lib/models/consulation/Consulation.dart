

import 'Comment.dart';

class  Consulation{

  int id=0;
  String title="";
  String description="";
  String date="";
  String img="";
  int cat=1;
  int answers=0;
  int fav=0;
  int views=0;
  int userId=1;
  String type="";
  List <Comment> comments=[];

  Consulation({this.id,this.title,this.description,this.cat,this.answers,this.fav,this.views,this.type,this.userId,this.img="con1.jpeg",this.date="",this.comments=const[]});

 List<Consulation> consulations=[];







}