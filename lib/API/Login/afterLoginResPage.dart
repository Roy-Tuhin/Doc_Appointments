import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:medbo/main.dart';
import 'package:medbo/screens/home.dart';

import 'ApiResponse.dart';

class AfterLoginResPage extends StatefulWidget {
  final ApiResponse rresponse;
  const AfterLoginResPage({required this.rresponse});

  @override
  _AfterLoginResPageState createState() => _AfterLoginResPageState();
}

class _AfterLoginResPageState extends State<AfterLoginResPage> {
  var responseRef;
  //  _SecondState(this.responseRef);
  @override
  Widget build(BuildContext context) {
    var tuhin = Text("Status: ${widget.rresponse.status}");
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Status: ${widget.rresponse.status}"),
              Text("Message: ${widget.rresponse.message}"),
              Text("Name: ${widget.rresponse.userData!.name}"),
              Text("encUserId: ${widget.rresponse.userData!.encUserId}"),
              // Text("name: ${widget.UserData.name}"),
              SizedBox(
                height: 50,
              ),

              OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
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
    );
  }
}
