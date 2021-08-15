// @dart=2.9
import 'package:flutter/material.dart';
import 'package:medbo/API/Login/loginAtFirst.dart';
import 'package:medbo/screen_helper/app_color.dart';
import 'package:medbo/screens/about.dart';
import 'package:medbo/screens/home.dart';
import 'package:medbo/screens/our_services.dart';
import 'package:medbo/SplashScreen.dart';
import 'package:medbo/screens/settings.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
   await GetStorage.init();
  runApp(MyApp());
} 

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
      //  home: LoginAtFirst(),
      initialRoute: '/',
      routes: {
         '/': (_) => LoginAtFirst(),
        '/Home': (_) => Home(),
        '/services': (_) => Services(),
        '/about': (_) => About(),
        // '/blogs':(_)=>Blogs(),
        '/settings': (_) => Settings(),
        '/splash': (_) => SplashScreen(),
      },
    );
  }
}//test