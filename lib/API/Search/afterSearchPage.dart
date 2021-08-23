import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:medbo/main.dart';
import 'package:medbo/models/surgPackDetailsModel.dart';
import 'package:medbo/screens/home.dart';
import 'package:medbo/screens2.dart/home2.dart';

import 'SearchApiResponse.dart';

// import 'ApiResponse.dart';

class AfterSearchPage extends StatefulWidget {
  final SearchApiResponse rresponse;
  const AfterSearchPage({required this.rresponse});
  @override
  _AfterSearchPageState createState() => _AfterSearchPageState();
}

class _AfterSearchPageState extends State<AfterSearchPage> {
  // var responseRef;
  //  _SecondState(this.responseRef);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlue[50],
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topCenter,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor
              ],
            ),
          ),
        ),
        title: Text(
          'Search Result',
          style: TextStyle(
            fontFamily: 'Roboto_Condensed',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final item in widget.rresponse.data)
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      // color: Color(0xFF3E64FF),
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                          //color: Color(0xFF3E64FF).withOpacity(0.3),
                          color: Colors.grey.withOpacity(0.9),
                          offset: const Offset(
                            0.0,
                            5.0,
                          ),
                          blurRadius: 3.0,
                          spreadRadius: 0.5,
                        ),
                      ]),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(item.name),
                        trailing: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor),
                            onPressed: () {},
                            child: Text("Show details")),
                        leading: CircleAvatar(
                          backgroundColor: Colors.lightBlue[50],
                          radius: 30,
                          backgroundImage: NetworkImage(item.image),
                        ),
                      ),
                      // Text(item.name),
                      Text(item.extra1),
                      Text(item.extra2),
                      //Image.network(item.image,height: 200,),
                    ],
                  ),
                ),
              SizedBox(
                height: 50,
              ),

              // OutlinedButton.icon(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => Home2(),
              //         ),
              //       );
              //     },
              //     icon: Icon(
              //       Icons.exit_to_app,
              //       size: 18,
              //     ),
              //     label: Text("GoTo Home")),
            ],
          ),
        ),
      ),
    );
  }
}
