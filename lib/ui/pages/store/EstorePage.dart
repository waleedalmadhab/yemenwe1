import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:ff_navigation_bar/ff_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:yemenwe/models/store/Product.dart';
import 'package:yemenwe/models/store/category.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/screens/store/OrderScreen.dart';
import 'package:yemenwe/ui/screens/store/SearchScreen.dart';
import 'package:yemenwe/ui/screens/store/storeFav.dart';
import 'package:yemenwe/ui/screens/store/storehome.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/Badge.dart';
import 'package:yemenwe/ui/widgets/store/noAccount.dart';
import 'package:yemenwe/utils/Login.dart';
import 'package:yemenwe/utils/MQSize.dart';

import 'CartPage.dart';
class EstorePage extends StatefulWidget {
  @override
  _EstorePageState createState() => _EstorePageState();
}

class _EstorePageState extends State<EstorePage> {
  int selectedIndex = 0;


  var tabs=[

    storehome(),
   Login().isLogin()? OrderScreen():noAccount(),
SearchScreen(),
    Login().isLogin()? storeFav():noAccount(),
   Login().isLogin()? CartPage():noAccount(),

  ];
  Future<double> get _height => Future<double>.value(80);

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          child: FFNavigationBar(

            theme: FFNavigationBarTheme(
              barBackgroundColor: Colors.white,
              selectedItemBorderColor: Colors.transparent,
              selectedItemBackgroundColor: Colors.green,
              selectedItemIconColor: Colors.white,
              selectedItemLabelColor: Colors.black,
              showSelectedItemShadow: false,
              barHeight: 70,

            ),
            selectedIndex: selectedIndex,
            onSelectTab: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              FFNavigationBarItem(
                iconData:  selectedIndex==0? Icons.home:CupertinoIcons.home,
                label: 'الرئيسية',
                selectedBackgroundColor: colors.secondry,
              ),
              FFNavigationBarItem(
                iconData:  selectedIndex==1? CupertinoIcons.tags_solid:CupertinoIcons.tags,
                label: 'طلباتي',
                selectedBackgroundColor: colors.secondry,
              ),
              FFNavigationBarItem(
                iconData:  selectedIndex==2? Ionicons.search:CupertinoIcons.search,
                label: 'بحث',
                selectedBackgroundColor: colors.secondry,
              ),
              FFNavigationBarItem(
                iconData:  selectedIndex==3? Icons.favorite:Icons.favorite_border,
                label: 'المفضلة',
                selectedBackgroundColor: colors.secondry,
              ),
              FFNavigationBarItem(

                iconData:  selectedIndex==4? Ionicons.cart:Ionicons.cart_outline,
                label: 'السلة',
                selectedBackgroundColor: colors.secondry,
              ),
            ],
          ),
preferredSize: Size(MQSize.width, 100),
        ),
        body:tabs[selectedIndex]
      ),
    );

  }
}
