import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:medbo/main.dart';
import 'package:medbo/models/docVisitDaysModel.dart';
import 'package:medbo/screens/home.dart';
import 'package:medbo/screens2.dart/home2.dart';



class ConfirmPaymentPage extends StatefulWidget {
  var partnerData;
   ConfirmPaymentPage(this.partnerData);

  @override
  _ConfirmPaymentPageState createState() => _ConfirmPaymentPageState(this.partnerData);
}

class _ConfirmPaymentPageState extends State<ConfirmPaymentPage> {
  var partnerDataRef;
  _ConfirmPaymentPageState(this.partnerDataRef);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                      "Payment Amount: ${partnerDataRef.fee}",
                      textAlign: TextAlign.left,
                    ),
              // Text("Status: ${widget.rresponse.status}"),
              // Text("Message: ${widget.rresponse.message}"),
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
