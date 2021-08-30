//afterDateSelectPage

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:medbo/main.dart';
import 'package:medbo/models/DocBookingAcknowledgement.dart';
import 'package:medbo/models/DocBookingModel.dart';
import 'package:medbo/models/docVisitDaysModel.dart';
import 'package:medbo/screens/home.dart';
import 'package:medbo/screens2.dart/home2.dart';
import 'package:http/http.dart' as http;


class DocBookingAcknowledgementPage extends StatefulWidget {
  final DocBookingAcknowledgement rresponse;
  const DocBookingAcknowledgementPage({required this.rresponse});

  @override
  _DocBookingAcknowledgementPageState createState() => _DocBookingAcknowledgementPageState();
}

class _DocBookingAcknowledgementPageState extends State<DocBookingAcknowledgementPage> {
  var responseRef;
  //  _SecondState(this.responseRef);
  @override
  Widget build(BuildContext context) {
        var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidth / 100);
    var blockSizeVertical = (screenHeight / 100);


    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      // color: Color(0xFF3E64FF),
                                      color: Colors.lightBlue[50],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
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
                                      ],
                                    ),
                   child: Column(
                     children: [
                       ListTile(
                         title:  Text("Doc Name: ${widget.rresponse.doctorName}",style:TextStyle(fontWeight: FontWeight.bold,
                        fontSize: blockSizeHorizontal * 5,
                        fontFamily: 'Poppins',
                        color: Theme.of(context).primaryColor,),),
                         subtitle:  Text("Booking Refference No: ${widget.rresponse.refNo}\nBooking Date: ${widget.rresponse.bookingDate}\nVisit Location: ${widget.rresponse.visitLocation} ",
                          style:TextStyle(fontFamily: 'Poppins'),
                         
                         ),
                       ),
                       //Text("Doc Name: ${widget.rresponse.doctorName}"),
                       //Text("Booking Date: ${widget.rresponse.bookingDate}"),
                       //Text("Booking Refference No: ${widget.rresponse.refNo}"),
                       //Text("Visit Location: ${widget.rresponse.visitLocation}"),
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














}
