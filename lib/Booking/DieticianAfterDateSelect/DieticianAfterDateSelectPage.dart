import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:lottie/lottie.dart';
import 'package:medbo/Booking/paymentAmountDetails.dart';
import 'package:medbo/main.dart';
import 'package:medbo/models/DocBookingAcknowledgement.dart';
import 'package:medbo/models/DocBookingModel.dart';
import 'package:medbo/models/docVisitDaysModel.dart';
import 'package:medbo/models/paymentAmountDetailsModel.dart';
import 'package:medbo/screens/home.dart';
import 'package:medbo/screens2.dart/home2.dart';
import 'package:http/http.dart' as http;

import '../DieticianEncBookingIdModel.dart';

// DieticianAfterDateSelectPage

class DieticianAfterDateSelectPage extends StatefulWidget {
  final DieticianEncBookingIdModel rresponse;
  const DieticianAfterDateSelectPage({required this.rresponse});

  @override
  _DieticianAfterDateSelectPageState createState() => _DieticianAfterDateSelectPageState();
}

class _DieticianAfterDateSelectPageState extends State<DieticianAfterDateSelectPage> {
  var responseRef;
  //  _SecondState(this.responseRef);
  @override
  Widget build(BuildContext context) {
        var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidth / 100);
    var blockSizeVertical = (screenHeight / 100);
    return Scaffold(
      backgroundColor: Color(0xFFd6ecfe),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Text(
                      "Your Health",
                      style: TextStyle(
                        fontSize: 45,
                        color: Color(0xFF283c50),
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Our Care",
                      style: TextStyle(
                        color: Color(0xFF283c50),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Health care should be simple, fast\nuncomplicated.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black38,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          wordSpacing: 4.0,
                          height: 1.5),
                    ),
                    Spacer(),
                    ElevatedButton(
                        style: TextButton.styleFrom(
                                          //backgroundColor: Color(0xFF6CD8D1),
                                          elevation: 0,
                                          backgroundColor: Theme.of(context).primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            // side: BorderSide(color: Color(0xFF6CD8D1)),
                                          ),),
          
                        onPressed: () {
                          //PaymentDetails();
                          PaymentDetailsAmount();
                        },
                        // style: ButtonStyle(
                        //   backgroundColor:
                        //       MaterialStateProperty.all(Color(0xFF79a0be)),
                        //   padding: MaterialStateProperty.all(
                        //       EdgeInsets.only(left: 50, right: 50)),
                        // ),
                         child: Container(
                                          width: blockSizeHorizontal*70,
                                          height: blockSizeVertical*7,
                                          child: Center(child: Text("Book Now", style: TextStyle(fontFamily: 'Poppins',color: Colors.white),)))),
                    Spacer(),
                  ],
                ),
              ),
            ),
            // image section
            Expanded(
              flex: 3,
              child: Container(
                child: 
                // Image.asset(
                //   "assets/images/medbo-doctors.png",
                //   fit: BoxFit.cover,
                // ),
                Lottie.network('https://assets6.lottiefiles.com/private_files/lf30_brec9S.json')
              ),
            ),
            // now we create homePage
          ],
        ),
      ),
    );
  }

  Future<void> PaymentDetailsAmount() async {
    var jsonResponse;
    if (widget.rresponse.encBookingId.isNotEmpty) {
      var response = await http.post(
          Uri.parse("https://medbo.in/api/medboapi/PaymentDetails"),
          body: ({
            'EncId': widget.rresponse.encBookingId,
          }));
      if (response.statusCode == 200) {
        print("Correct");
        print(response.body);
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PaymentAmountDetailsPage(
                    rresponse:
                        PaymentAmountDetailsModel.fromJson(jsonResponse))));
      } else {
        print("Wrong URL");
        throw Exception("Faild to fetch");
      }
    } else {
      throw Exception("Faild to fetch");
    }
  }

}
