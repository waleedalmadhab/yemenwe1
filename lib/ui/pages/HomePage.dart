import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:yemenwe/api/getData.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/constants/Constant.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/store/EstorePage.dart';
import 'package:yemenwe/ui/screens/ConsulationsScreen.dart';
import 'package:yemenwe/ui/screens/HomeScreen.dart';
import 'package:yemenwe/ui/screens/TrainingScreen.dart';
import 'package:yemenwe/ui/screens/WomanIssuesScreen.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/dialogs.dart';
import 'package:yemenwe/ui/widgets/listTileAcountItem.dart';
import 'package:yemenwe/ui/widgets/myDrawer.dart';
import 'package:yemenwe/utils/SharedPref.dart';
import 'package:yemenwe/utils/Toast.dart';
import 'package:yemenwe/utils/launcher.dart';

import 'AccountPage.dart';
import 'MyConsulationsPage.dart';
import 'MyCourses.dart';
import 'PrivacyPolicyPage.dart';
import 'ProfilePage.dart';
import 'SplashPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _counter = 3;
  int currentIndex=3;

  void changePage(int index) {
    setState(() {
      currentIndex = index;

      switch(currentIndex){

        case 0:color=colors.red1;
        break;
        case 1:color=colors.blue;
        break;
        case 2:color=colors.orange;
        break;
        case 3:color=colors.green2;
        break;



      }

    });
  }
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }


  var tabs=[


    WomanIssueScreen(),

    ConsulationsScreen(),

    TrainingScreen(),
    EstorePage(),


    // ,    HomeScreen(),

    //  MoreScreen(),

  ];

  var color=colors.red1;

  var title=Constant().app_name;

   TabController tabcontroller ;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcontroller=TabController(length: 4, vsync: this,initialIndex: 3);
  }
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {


    var size=22.0;
    var fsize=10.0;
var _show=true;
    var w=MediaQuery.of(context).size.width;
//print(controller.page);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
key: _drawerKey,

        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //
        //   centerTitle: false,
        //   // Here we take the value from the MyHomePage object that was created by
        //   // the App.build method, and use it to set our appbar title.
        //
        //
        //
        //     iconTheme: new IconThemeData(color: colors().white),
        //     backgroundColor: colors().blueDark,
        //
        //
        //
        //
        // ),

        endDrawer: myDrawer(),

        body:  Column(
          children: <Widget>[
            Container(height: 25,
            color: colors.primary,
            ),

           AnimatedContainer(
              color: colors.primary,
              height: tabcontroller.index!=4? 60:0,
              duration: Duration(milliseconds: 300)
            ,child: tabcontroller.index!=4? Row(
              children: <Widget>[


                // GestureDetector(
                //   onTap: (){
                //
                // //    Get.to(SearchPage(type: Constant().search_training,));
                //
                //     //   launcher().hotLineCall();
                //
                //
                //     SharedPref().read( "user").then((value) {
                //
                //    //   print(value['token']);
                //
                //      getResponseData().getData(url: urls().search,data: {"search":"العلاقات","type":"posts"}).then((res) {
                //        print(res.data);
                //
                //       });
                //
                //
                //     });
                //
                //
                //
                //   },
                //   child:      Container(
                //       margin: EdgeInsets.symmetric(horizontal: 10),
                //       child: Icon(Icons.search,color: colors().white,size: 22,)),
                //
                // ),
                GestureDetector(
                  onTap: (){
                    launcher().hotLineCall();

                  },
                  child:      Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: colors.white),
                    //  color: colors().white
                    ),
                      margin: EdgeInsets.symmetric(horizontal: 10),

                      child: Row(
                        children: <Widget>[
                          Icon(CupertinoIcons.phone_solid,color: colors.white,size: 22,),
                          Text("  تواصل معنا  ",style: Styles().consualtionStatisc(fsize: 10,mcolor: colors.white),)
                        ],
                      )
                  ),

                ),


                Expanded(child: Text(title,textAlign: TextAlign.right,style: Styles().consualtionStatisc(fsize: 14,mcolor:colors.white),overflow: TextOverflow.ellipsis,)),

                IconButton(
                  icon: Icon(Icons.menu,size: 22,color: colors.white,),
                  onPressed: () =>  _drawerKey.currentState.openEndDrawer(),
                )
              ],
            ):Container(),


            ),

            PreferredSize(

              preferredSize: Size.fromHeight(kToolbarHeight),
              child: TabBar(
                indicatorColor: colors.primary,
                labelStyle: Styles().consualtionStatisc(fsize: 12,mcolor: colors.primary),
                unselectedLabelStyle: Styles().consualtionStatisc(fsize: 10,mcolor: colors.grey),

onTap: (i){


    setState(() {

      if(i==3){
      _show=true;}
      else{
        _show=false;
      }
    });


 // print("##################################3   $_show   $i");
},

                controller: tabcontroller,
                tabs: [

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),

                    child: Tab(

                      icon: Icon(tabcontroller.index==0?Ionicons.woman:Ionicons.woman_outline,size: size,),

                     //   icon: Image.asset( tabcontroller.index!=0? "images/issue.png":"images/issue_colored.png",width: size,height: size,),
                      text: ("شؤون المرأة"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),

                    child: Tab(

                      icon: Icon(tabcontroller.index==1?Ionicons.chatbubble_ellipses_sharp:Ionicons.chatbubble_ellipses_outline,size: size,),
                    //  icon:Image.asset( tabcontroller.index==1? "images/consu.png":"images/consu_colored.png" ,width: size,height: size,),


                      //  icon: Image.asset( currentIndex!=0? "images/issue.png":"images/issue_colored.png",width: imgh,height: imgh,),
                      text: ("الاستشارات"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),

                    child: Tab(

                      icon: Icon( tabcontroller.index!=2?EvaIcons.bookOpenOutline: EvaIcons.bookOpen,size: size,),

                      //  icon: Image.asset( currentIndex!=0? "images/issue.png":"images/issue_colored.png",width: imgh,height: imgh,),
                      text: ("التدريب"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),

                    child: Tab(

                      icon: Icon(tabcontroller.index==3?EvaIcons.shoppingBag:EvaIcons.shoppingBagOutline,size: size,),

                      //   icon: Image.asset( tabcontroller.index!=0? "images/issue.png":"images/issue_colored.png",width: size,height: size,),
                      text: ("السوق الإلكتروني"),
                    ),
                  ),

                  // Container(
                  //   margin: const EdgeInsets.symmetric(horizontal: 8),
                  //   child: Tab(
                  //   //  child: Container(padding: EdgeInsets.symmetric(horizontal: 5)),
                  //     icon: Icon(tabcontroller.index==4?Icons.home:CupertinoIcons.home,size: size,),
                  //
                  //     //  icon: Image.asset( currentIndex!=0? "images/issue.png":"images/issue_colored.png",width: imgh,height: imgh,),
                  //     text: ("الرئيسية"),
                  //   ),
                  // ),
                ]

                ,
                labelColor: colors.primary,
                unselectedLabelColor: colors.grey,
                isScrollable: true,
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),

                controller: tabcontroller,

                children:

                tabs

                ,),
            ),
          ],
        ),



      ),
    );

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.


//    return Scaffold(
//      appBar: AppBar(
//        automaticallyImplyLeading: false,
//
//        centerTitle: true,
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Row(
//          children: <Widget>[
//
//            Expanded(flex: 1,
//
//              child: GestureDetector(
//                onTap: (){
//                  launcher().hotLineCall();
//
//                },
//                child: Row(children: <Widget>[Icon(Icons.headset_mic,color: Colors.white,size: 20,),
//                  Padding(
//                    padding: const EdgeInsets.symmetric(horizontal: 5),
//                    child: Text("الخط الساخن",style: Styles().consualtionStatisc(fsize: 10,mcolor: Colors.white),),
//                  )
//
//                ],),
//              ),
//            ),
//            Expanded(
//                flex: 2,
//                child: Text(widget.title,textAlign: TextAlign.right,style: Styles().consualtionStatisc(fsize: 16,mcolor: Colors.white),)),
//          ],
//        ),
//        backgroundColor: color,
//      ),
//      body:tabs[currentIndex],
//
//
//      bottomNavigationBar: Directionality(
//        textDirection: TextDirection.rtl,
//        child: BubbleBottomBar(
//          hasNotch: true,
//          opacity: .2,
//          currentIndex: currentIndex,
//          onTap: changePage,
//          borderRadius: BorderRadius.vertical(
//              top: Radius.circular(
//                  16)), //border radius doesn't work when the notch is enabled.
//          elevation: 8,
//          items: <BubbleBottomBarItem>[
//            BubbleBottomBarItem(
//                backgroundColor: colors().red1,
//                icon: Icon(
//                  Icons.home,
//                  color: Colors.black,
//                ),
//                activeIcon: Icon(
//                  Icons.home,
//                  color: colors().red1,
//                ),
//                title: Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 5),
//                  child: Text("الرئيسية",style: Styles().bottomNavTextStyle,),
//                )),
//            BubbleBottomBarItem(
//                backgroundColor: colors().blue,
//                icon: Icon(
//                  Icons.library_books,
//                  color: Colors.black,
//                ),
//                activeIcon: Icon(
//                  Icons.library_books,
//                  color: colors().blue,
//                ),
//                title: Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 5),
//                  child: Text("التدريب",style: Styles().bottomNavTextStyle,),
//                )),
//            BubbleBottomBarItem(
//                backgroundColor: colors().orange,
//                icon: Icon(
//                  Icons.live_help,
//                  color:Colors.black ,
//                ),
//                activeIcon: Icon(
//                  Icons.live_help,
//                  color: colors().orange,
//                ),
//                title: Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 5),
//                  child: Text("الاستشارات",style: Styles().bottomNavTextStyle,),
//                )),
//            BubbleBottomBarItem(
//                backgroundColor: colors().green2,
//                icon: Image.asset("images/woman3.png",width: 24,height: 24,),
//                activeIcon: Image.asset("images/woman2.png",width: 24,height: 24,),
//                title: Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 5),
//                  child: Text("شؤون المرأة",style: Styles().bottomNavTextStyle,),
//                )),
//
//            BubbleBottomBarItem(
//                backgroundColor: colors().brown,
//                icon: Icon(
//                  Icons.more_horiz,
//                  color: Colors.black,
//                ),
//                activeIcon: Icon(
//                  Icons.more_horiz,
//                  color: colors().brown,
//                ),
//                title: Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 5),
//                  child: Text("المزيد",style: Styles().bottomNavTextStyle,),
//                )),
//          ],
//        ),
//      ),
//      resizeToAvoidBottomPadding: false,
//
//    );
  }



}
