// @dart=2.9
import 'package:flutter/material.dart';
import 'package:medbo/screen_helper/app_color.dart';
import 'package:medbo/screens/about.dart';
import 'package:medbo/screens/home.dart';
import 'package:medbo/screens/our_services.dart';
import 'package:medbo/SplashScreen.dart';
import 'package:medbo/screens/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColor.colorPrimary1,
        accentColor: AppColor.colorPrimary2,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Medbo',
      initialRoute: '/',
      routes: {
        '/': (_) => Home(),
        '/services': (_) => Services(),
        '/about': (_) => About(),
        // '/blogs':(_)=>Blogs(),
        '/settings': (_) => Settings(),
        '/splash': (_) => SplashScreen(),
      },
    );
  }
}//test