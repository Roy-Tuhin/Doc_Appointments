import 'package:flutter/material.dart';
import 'package:medbo/main.dart';
import 'package:medbo/screens/home.dart';

import 'ApiResponse.dart';

class AfterLoginResPage extends StatefulWidget {
  final ApiResponse response;
  const AfterLoginResPage({required this.response});
  

  @override
  _AfterLoginResPageState createState() => _AfterLoginResPageState();
}

class _AfterLoginResPageState extends State<AfterLoginResPage> {
  var responseRef;
  //  _SecondState(this.responseRef);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("Status: ${widget.response.status}"),
               Text("Message: ${widget.response.message}"),
              // Text("name: ${widget.UserData.name}"),
              SizedBox(height: 50,),

              OutlinedButton.icon(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));}, icon: Icon(Icons.exit_to_app,size :18,), label: Text("GoTo Home")),

            ],
          ),
        ),
      ),
    );
  }
}