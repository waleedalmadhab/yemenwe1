import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:yemenwe/constants/Constant.dart';
import 'package:yemenwe/providers/CartProvider.dart';
import 'package:yemenwe/providers/ConsulationsProvider.dart';
import 'package:yemenwe/providers/ContentProvider.dart';
import 'package:yemenwe/providers/FavProvider.dart';
import 'package:yemenwe/providers/TokenProvider.dart';
import 'package:yemenwe/providers/TrainingProvider.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/ui/pages/AccountPage.dart';
import 'package:yemenwe/ui/pages/PrivacyPolicyPage.dart';
import 'package:yemenwe/ui/pages/RegisterPage.dart';
import 'package:yemenwe/ui/pages/SplashPage.dart';
import 'package:yemenwe/ui/screens/HomeScreen.dart';
import 'package:yemenwe/ui/screens/ConsulationsScreen.dart';
import 'package:yemenwe/ui/screens/TrainingScreen.dart';
import 'package:yemenwe/ui/screens/WomanIssuesScreen.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/ui/widgets/dialogs.dart';
import 'package:yemenwe/utils/HideNavbar.dart';
import 'package:yemenwe/utils/launcher.dart';

import 'providers/ConsulationsProvider.dart';
import 'ui/pages/MyConsulationsPage.dart';
import 'ui/pages/ProfilePage.dart';
import 'ui/widgets/listTileAcountItem.dart';
import 'utils/SharedPref.dart';
import 'utils/Toast.dart';

void main() {
  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => ContentProvider()),
        ChangeNotifierProvider(create: (_) => TokenProvider()),
        ChangeNotifierProvider(create: (_) => TrainingProvider()),
        ChangeNotifierProvider(create: (_) => ConsulationsProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavProvider()),

      ],

      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constant().app_name,
        theme: ThemeData(

          fontFamily: Constant().arabicFont,

          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.

primaryColor: colors.primary,
          accentColor: colors.primary,

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashPage(),
      ),
    );
  }
}
