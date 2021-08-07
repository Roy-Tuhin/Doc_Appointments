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
      // theme: ThemeData(
      //   primaryColor: AppColor.colorPrimary1,
      //   accentColor: AppColor.colorPrimary2,
      // ),
      // home: Home(),
      // initialRoute: '/',
      // routes: {
      //   '/': (_) => Home(),
      //   '/services': (_) => Services(),
      //   '/about': (_) => About(),
      //   // '/blogs':(_)=>Blogs(),
      //   '/settings': (_) => Settings(),
      //   '/splash': (_) => SplashScreen(),
      // },
      home: SplashScreen(),
    );
  }
}

Can you please share it to your github repository? I would like to check it on my Android Studio.ok email please. ashiqullahmg@gmail.com //ok sendng you in a minute? bye for now? no. I am waiting for you email.yea wait// hey i did not creat repo in git hub for this.. cresting and sending you the link