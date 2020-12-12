
class Active{

  var id=0;
  var title="";
  var details="";
  var date="";
  var thumbnail="";
  var url="";
  List <String> imgages=[];


  Active({this.id,this.title="",this.details="",this.url,this.date="",this.thumbnail,this.imgages=const[]});



  List <Active> actives=[];
  List<Active> getActives(){

    actives.add(Active(title: "النشاط الأول",details: "تفاصيل النشاط الأول",date: "منذ ساعة",imgages: ["img_1.jpg","img_2.jpg"]));
    actives.add(Active(title: "النشاط الثاني",details: "تفاصيل النشاط الثاني",date: "منذ ساعة",imgages: ["img_2.jpg","img_2.jpg"]));
    actives.add(Active(title: "النشاط الثالث",details: "تفاصيل النشاط الثالث",date: "منذ ساعة",imgages: ["img_3.jpg","img_2.jpg"]));
    actives.add(Active(title: "النشاط الرابع",details: "تفاصيل النشاط الرابع",date: "منذ ساعة",imgages: ["img_1.jpg","img_2.jpg"]));
    actives.add(Active(title: "النشاط الخامس",details: "تفاصيل النشاط الخامس",date: "منذ ساعة",imgages: ["img_3.jpg","img_2.jpg"]));
    actives.add(Active(title: "النشاط السادس",details: "تفاصيل النشاط السادس",date: "منذ ساعة",imgages: ["img_2.jpg","img_2.jpg"]));

    return actives;

  }





}