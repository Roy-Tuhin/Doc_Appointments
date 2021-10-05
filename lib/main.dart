// @dart=2.9
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medbo/API/Login/loginAtFirst.dart';
import 'package:medbo/screen_helper/app_color.dart';
import 'package:medbo/screens/about.dart';
import 'package:medbo/screens/home.dart';
import 'package:medbo/screens/our_services.dart';
import 'package:medbo/SplashScreen.dart';
import 'package:medbo/screens/settings.dart';
import 'package:medbo/screens2.dart/home2.dart';

void main() async{
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
        home: ForInternetChecking(),
      //initialRoute: '/',
      routes: {
        '/SplashScreen': (_) => SplashScreen(),
         '/LoginAtFirst': (_) => LoginAtFirst(),
        '/Home2': (_) => Home2(),
        '/services': (_) => Services(),
        '/about': (_) => About(),
        // '/blogs':(_)=>Blogs(),
        '/settings': (_) => Settings(),
        '/splash': (_) => SplashScreen(),
      },
    );
  }
}//test


class ForInternetChecking extends StatefulWidget {
  // const ForInternetChecking({ Key? key }) : super(key: key);

  @override
  _ForInternetCheckingState createState() => _ForInternetCheckingState();
}

class _ForInternetCheckingState extends State<ForInternetChecking> {
ConnectivityResult previous;
  @override

  void initState(){
    super.initState();
    try {
      InternetAddress.lookup('example.com').then((result){
        if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
          //internet conn available
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => 
            SplashScreen(),
          ));
        }else{
          // no conn
          _showdialog();
        }
      }).catchError((error){
        // no conn
        _showdialog();
      });
    } on SocketException catch (_){
      // no internet
      _showdialog();
    }


    Connectivity().onConnectivityChanged.listen((ConnectivityResult connresult){
      if(connresult == ConnectivityResult.none){

      }else if(previous == ConnectivityResult.none){
        // internet conn
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => 
            SplashScreen(),
          ));
      }

      previous = connresult;
    });




  }


  

      void _showdialog(){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('ERROR'),
        content: Text("No Internet Detected."),
        actions: <Widget>[
          Center(
            child: ElevatedButton(
              // method to exit application programitacally
             // onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
             onPressed: (){Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/');},
              child: Text("Try Again"),
            ),
          ),
        ],
      ),
      barrierDismissible: false
    );
  }



  Widget build(BuildContext context) {
       return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                      child: Stack(
                        children:[ Image.asset(
                                  "assets/images/10_Connection Lost.png",
                                  fit: BoxFit.cover,
                                ),
      
                                   Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 13),
                      blurRadius: 25,
                      color: Color(0xFF5666C2).withOpacity(0.17),
                    ),
                ],
              ),
              child: ElevatedButton(
                          onPressed: (){Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/');},
                          style: TextButton.styleFrom(
                            // backgroundColor: Color(0xFF6CD8D1),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                             // side: BorderSide(color: Color(0xFF6CD8D1)),
                            ),
                          ),
                          child: Text("Try Again",style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),),
                        ),
            ),
          )
                                
                                ]
                      ),
                    ),
            Padding(
              padding: EdgeInsets.only(
                top: 20.0
              ),
          //     child: Column(
          //       children: [
          //         Text(
          //           "Checking Your Internet Connection."
          //         ),
          // //          ElevatedButton(
          // //   // method to exit application programitacally
          // //   onPressed: () => SystemNavigator.pop(),
          // //   child: Text("Exit"),
          // // ),
          //       ],
              ),
           // ),
          ],
        ),
      ),
    );

  }
}