import 'package:flutter/material.dart';
import 'package:medbo/login_n_registration/login.dart';
import 'package:medbo/main.dart';
import 'package:medbo/screens/home.dart';

import 'RegistrationApiResponse.dart';

class AfterRegistrationResPage extends StatefulWidget {
  final RegistrationApiResponse response;
  const AfterRegistrationResPage({required this.response});
  

  @override
  AfterRegistrationResPageState createState() => AfterRegistrationResPageState();
}

class AfterRegistrationResPageState extends State<AfterRegistrationResPage> {
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
               Text("Name: ${widget.response.userData!.name}"),
               Text("encUserId: ${widget.response.userData!.encUserId}"),
              
              SizedBox(height: 50,),

             // OutlinedButton.icon(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));}, icon: Icon(Icons.exit_to_app,size :18,), label: Text("LogIn Now")),

            ],
          ),
        ),
      ),
    );
  }
}