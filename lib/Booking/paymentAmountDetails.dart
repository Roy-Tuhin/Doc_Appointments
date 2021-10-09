//afterDateSelectPage

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:lottie/lottie.dart';
import 'package:medbo/main.dart';
import 'package:medbo/models/DocBookingAcknowledgement.dart';
import 'package:medbo/models/DocBookingModel.dart';
import 'package:medbo/models/docVisitDaysModel.dart';
import 'package:medbo/models/paymentAmountDetailsModel.dart';
import 'package:medbo/screens/home.dart';
import 'package:medbo/screens2.dart/home2.dart';
import 'package:http/http.dart' as http;

import 'DocBookingAcknowledgePage.dart';

class PaymentAmountDetailsPage extends StatefulWidget {
  final PaymentAmountDetailsModel rresponse;
  const PaymentAmountDetailsPage({required this.rresponse});

  @override
  _PaymentAmountDetailsPageState createState() =>
      _PaymentAmountDetailsPageState();
}

class _PaymentAmountDetailsPageState
    extends State<PaymentAmountDetailsPage> {
  var responseRef;
  //  _SecondState(this.responseRef);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidth / 100);
    var blockSizeVertical = (screenHeight / 100);

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // for (final item in widget.rresponse.data)
                // Row(
                //   children: [
                //     //Text(item.visitDate),
                //     //Text(item.visitDayName),

                //     Expanded(
                //       child: ElevatedButton(
                //         onPressed:(){},
                //         child:
                //          Container(
                //            child: Column(
                //              children: [
                //                Text(item.visitDayName, ),
                //                Text("Fee: ${item.fee}" ),
                //              ],
                //            ),
                //          ),
                //         ),
                //     )
                //     // Text(item.fee),
                //     // Text(item.discountedFee),
                //     // Text(item.bookingFee),

                //   ],
                // ),

                //Text("Message: ${widget.rresponse.message}"),
                Container(
                  margin: EdgeInsets.only(top: 60, left: 10, right: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    // color: Color(0xFF3E64FF),
                    color: Colors.lightBlue[50],
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    // boxShadow: [
                    //   BoxShadow(
                    //     //color: Color(0xFF3E64FF).withOpacity(0.3),
                    //     color: Colors.grey.withOpacity(0.9),
                    //     offset: const Offset(
                    //       0.0,
                    //       5.0,
                    //     ),
                    //     blurRadius: 3.0,
                    //     spreadRadius: 0.5,
                    //   ),
                    // ],
                  ),
                  child: Column(
                    children: [
                      // Image.asset(
                      //   "assets/images/payment2.png",
                      //   fit: BoxFit.cover,
                      // ),
                       Lottie.network('https://assets5.lottiefiles.com/packages/lf20_pu02tdjw.json',fit: BoxFit.cover,),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "Payment Amount :  " ,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: blockSizeHorizontal * 4,
                                  fontFamily: 'Poppins',
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text("${widget.rresponse.paymentAmount} ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: blockSizeHorizontal * 5,
                                  fontFamily: 'Poppins',
                                  color: Colors.green,
                                ),
                              
                              ),
                          ],
                        ),
                      ),
                      // ListTile(
                      //   title: Text(
                      //     "Payment Amount: ${widget.rresponse.paymentAmount} ",
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: blockSizeHorizontal * 5,
                      //       fontFamily: 'Poppins',
                      //       color: Colors.green,
                      //     ),
                      //   ),
                      //   // subtitle: Text(
                      //   //   "Payment Amount: ${widget.rresponse.paidAmt} ",
                      //   //   style: TextStyle(
                      //   //       fontFamily: 'Poppins',
                      //   //       color: Theme.of(context).primaryColor),
                      //   // ),
                      // ),
                      //Text("Doc Name: ${widget.rresponse.doctorName}"),
                      //Text("Booking Date: ${widget.rresponse.bookingDate}"),
                      //Text("Booking Refference No: ${widget.rresponse.refNo}"),
                      //Text("Visit Location: ${widget.rresponse.visitLocation}"),
                      SizedBox(
                        height: 50,
                      ),

                      ElevatedButton(
                          onPressed: () {
                            DoPaymentDetails();
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF5da45f)),
                                 padding: MaterialStateProperty.all(EdgeInsets.only(left:50,right: 50)),
                          ),
                          child: Text("Confirm")),
                    ],
                  ),
                ),
                //Text("Timing: ${widget.rresponse.timing}"),
                // Text("encUserId: ${widget.rresponse.userData!.encUserId}"),
                // Text("name: ${widget.UserData.name}"),
                // SizedBox(
                //   height: 50,
                // ),

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
      ),
    );
  }






   Future<void> DoPaymentDetails() async {
    var jsonResponse;
    if (widget.rresponse.encBookingId.isNotEmpty) {
      var response = await http.post(
          Uri.parse("https://medbo.in/api/medboapi/DoPayment"),
          body: ({
             'EncId': widget.rresponse.encBookingId,

          }));
      if (response.statusCode == 200) {
        print("Correct");
        print(response.body);
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
         Navigator.push(context, MaterialPageRoute(builder: (context)=>DocBookingAcknowledgementPage(rresponse:DocBookingAcknowledgement.fromJson(jsonResponse))));
      } else {
        print("Wrong URL");
        throw Exception("Faild to fetch");
      }
    } else {
      throw Exception("Faild to fetch");
    }
  }










}
