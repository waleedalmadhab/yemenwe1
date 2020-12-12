
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yemenwe/ui/colors/colors.dart';

class HideNavbar {
  final ScrollController controller = ScrollController();
  ValueNotifier<bool> visible = ValueNotifier<bool>(true);

  HideNavbar() {
    visible.value = true;
    controller.addListener(
          () {
        if (controller.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (visible.value) {
            visible.value = false;
          }
        }

        if (controller.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (!visible.value) {
            visible.value = true;
          }
        }
      },
    );
  }
}

class HideAppbar extends StatelessWidget {

  final HideNavbar hiding = HideNavbar();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        child: ListView.builder(
            controller: hiding.controller,

            itemCount: 10,
            itemBuilder: (bc,index)=>Container(height: 100,
        width: 300,
          margin: EdgeInsets.all(20),
        )),


      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: hiding.visible,
        builder: (context, bool value, child) => AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: value ? 56.0 : 0.0,
          child: Wrap(
            children: <Widget>[
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.blue,
                fixedColor: Colors.white,
                unselectedItemColor: Colors.white,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.card_giftcard),
                    title: Text('Offers'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_box),
                    title: Text('Account'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),


    );
  }
}


class HideTab extends StatefulWidget {

  @override
  _HideTabState createState() => _HideTabState();
}

class _HideTabState extends State<HideTab> {
  final HideNavbar hiding = HideNavbar();

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  var _show=true;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,


      child: Scaffold(
        drawerEdgeDragWidth: 1, // THIS WAY IT WILL NOT OPEN
drawer: Drawer(
  child: ListView(
    children: <Widget>[

      Card(

        child: Container(height: 200,),
      )

    ],
  ),
),
        body: Column(
          children: <Widget>[
            Container(height: 20,),

            AnimatedContainer(

              height: _show ?60:0,
              duration: Duration(milliseconds: 800),
              child: Text("yemenwe"),
            ),

            ValueListenableBuilder(valueListenable: hiding.visible, builder: (contx, bool value,child)=>AnimatedContainer(
              margin: EdgeInsets.only(top: 5),
              duration: Duration(milliseconds:800 ),
              height: value?60:0,
              child: Row(
                children: <Widget>[
                  Text("yemenwe"),
                  IconButton(icon: Icon(Icons.list), onPressed: (){

               //     _drawerKey.currentState.openDrawer();
                //    Scaffold.of(context).openDrawer();
                //     if (_drawerKey.currentState.isEndDrawerOpen) {
                //       _drawerKey.currentState.openDrawer();
                //     } else {
                //       _drawerKey.currentState.openEndDrawer();
                //     }
                    setState(() {
                      _show=!_show;
                    });

                  })


                ],
              ),
            )),

            TabBar(

                labelColor: colors.primary,

                tabs: [

              Tab(
                icon: Icon(Icons.person),
                text: "person",
              ),
              Tab(
                icon: Icon(Icons.search),
                text: "search",
              ),
              Tab(
                icon: Icon(Icons.home),
                text: "home",
              ),


            ]),

            Expanded(
              child: TabBarView(children: [


                ListView.builder(
                  controller: hiding.controller,
                itemBuilder: (cotx,index)=>Card(
                  child: Container(

                    height:100 ,
                  ),
                ),
                  itemCount: 10,
                ),
                Center(

                  child: Text("search"),
                ),
                Center(

                  child: Text("home"),
                ),

              ]),
            ),
          ],
        ),



      ),
    );
  }
}

