
import 'package:yemenwe/utils/IssueType.dart';

class  Issue{

  var id=0;
  var title="";
  var details="";
  //var url="";
 // var filename="";
  var img="";
  var video="";
  var sound="";
  var book="";
  var ext_book="";


  IssueType type=IssueType.img;

  var date="";
  var cat="";

var fav=0;


  Issue({this.id,this.title,this.details,this.img="",this.video="",this.book="",this.ext_book,this.sound="",this.type,this.date,this.cat,this.fav=0});


  List<Issue> issues=[];


  List<Issue>  getIssues(){
    var url="VCWwlT4tpZY";
    var url1="https://img.youtube.com/vi/VCWwlT4tpZY/mqdefault.jpg";
    var sound="https://luan.xyz/files/audio/ambient_c_motion.mp3";




    issues.add(Issue(id: 1,title: "العنوان الاول لشؤون المرأة",details:

    "اصبحت الحياة أكثر صعوبة خاصة بعد ان ترمله أختي الكبرى حيث توفي زوجها في الحرب وعادة لتسكن معنا هي وطفلها وكذا انفصلت اختي "+
    ""+
    " . تتحدث صبحية عن حالها ً "+
    ""+""


        +"والد صبيحة تبرء من بناته الثلاث وتركهم ورحل تقول صبيحة   انا واخواتي نعيش مع والدتنا المسنة حيث تركنا ولدنا من فترة طويلة وترك ولدتنا وهي من تعولنا رغم كبر سنها عملت صبحية بطف القات ورعى الأغنام ",type: IssueType.article,date: "20/3/2020",cat: "الزواج المبكر"));
    issues.add(Issue(id: 1,title: "العنوان الاول لشؤون المرأة",details: "العنوان الجزئي لشؤون المرأة",img: "img_2.jpg",video: "bQvaem17cz4",type: IssueType.img,date: "20/3/2020",cat: "تنظيم الأسرة"));
    issues.add(Issue(id: 1,title: "العنوان الاول لشؤون المرأة",details: "العنوان الجزئي لشؤون المرأة",sound: "$sound",img: "img_1.jpg",type: IssueType.sound,date: "20/3/2020",cat: "الزواج المبكر"));
    issues.add(Issue(id: 1,title: "فيلم مابش لها حاجة",details: "",video: "MEWcvhpkICU",book: "",type: IssueType.video,date: "20/3/2020",cat: "الزواج المبكر"));
    issues.add(Issue(id: 1,title: "العنوان الاول لشؤون المرأة",details: "العنوان الجزئي لشؤون المرأة",book: "",sound: "$sound",type: IssueType.book,date: "20/3/2020",cat: "الزواج المبكر"));
    issues.add(Issue(id: 1,title: "مشروع دعم قيادة المرأة وتمكينها ووصولها وحمايتها في مواجهة الأزمات",details: "العنوان الجزئي لشؤون المرأة",video: "_BNHRFSF0KU",type: IssueType.book,date: "20/3/2020",cat: "الزواج المبكر"));
    issues.add(Issue(id: 1,title: "العنوان الاول لشؤون المرأة",details: "العنوان الجزئي لشؤون المرأة",img: "img_3.jpg",type: IssueType.book,date: "20/3/2020",cat: "الزواج المبكر"));
    issues.add(Issue(id: 1,title: "العنوان الاول لشؤون المرأة",details: "العنوان الجزئي لشؤون المرأة",sound: "$sound",type: IssueType.book,date: "20/3/2020",cat: "الزواج المبكر"));

    return issues;



  }




}