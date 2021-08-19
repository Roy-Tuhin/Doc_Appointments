import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:medbo/main.dart';
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (final item in widget.rresponse.data)
                  Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(item.image),
                        ),
                      ),
                      // Text(item.status),
                      // Text(item.message),
                      Text(item.name),
                      Text(item.extra1),
                      Text(item.extra2),
                      //Image.network(item.image,height: 200,),
                    ],
                  ),

                //  Text("Status: ${widget.rresponse.status}"),
                //     Text("Message: ${widget.rresponse.message}"),
                //     Text("Name: ${widget.rresponse.data[0].name}"),

                //==??????????????????????????????????????
                // Text("Name: ${widget.rresponse.userData!.name}"),
                //Text("encUserId: ${widget.rresponse.userData!.encUserId}"),
                // Text("name: ${widget.UserData.name}"),
                SizedBox(
                  height: 50,
                ),

                OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home2(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.exit_to_app,
                      size: 18,
                    ),
                    label: Text("GoTo Home")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
