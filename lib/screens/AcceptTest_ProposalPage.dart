import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:medbo/main.dart';
import 'package:medbo/models/DieticianModel/My_TestRequest_Model/Accept_Proposal_Model.dart';
import 'package:medbo/screens/home.dart';
import 'package:medbo/screens2.dart/home2.dart';

// import 'ApiResponse.dart';

class AcceptTestProposalPage extends StatefulWidget {
  final AcceptProposalModel rresponse;
  const AcceptTestProposalPage({required this.rresponse});

  @override
  _AcceptTestProposalPageState createState() => _AcceptTestProposalPageState();
}

class _AcceptTestProposalPageState extends State<AcceptTestProposalPage> {
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
             // Text("Status: ${widget.rresponse.status}"),
              Text("Message: ${widget.rresponse.message}"),
              // Text("Name: ${widget.rresponse.userData!.name}"),
              // Text("encUserId: ${widget.rresponse.userData!.encUserId}"),
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
    );
  }
}
