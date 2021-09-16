import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medbo/BookingList/UserBookingRecordModel.dart';
import 'package:medbo/models/DieticianModel/My_TestRequest_Model/Accept_Proposal_Model.dart';
import 'package:medbo/models/DieticianModel/My_TestRequest_Model/TestRequestDetailsModel.dart';
import 'package:medbo/screen_helper/side_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'AcceptTest_ProposalPage.dart';

class MyTestReqDetailsPage extends StatefulWidget {
  //const MyTestReqDetailsPage(encBookingId, {Key? key}) : super(key: key);
  var encBookingId;
  MyTestReqDetailsPage(
    this.encBookingId,
  );

  @override
  _MyTestReqDetailsPageState createState() =>
      _MyTestReqDetailsPageState(this.encBookingId);
}

class _MyTestReqDetailsPageState extends State<MyTestReqDetailsPage> {
  var encBookingIdRef;
  _MyTestReqDetailsPageState(this.encBookingIdRef);
  //=====================================================================================S H O W   USER  DETIALS IN APP DRAWER WITH SHARED PREFERENCES====================================================

  String Name = "";
  String EncUserId = "";

  void initState() {
    super.initState();
    getCred();
    TestRequestDetailsAPI();
  }

  void getCred() async {
    //HERE WE FETCH OUR CREDENTIALS FROM SHARED PREF
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      Name = pref.getString("userEmail");
      EncUserId = pref.getString("encId");
    });
  }
//=====================================================================================S H O W   USER  DETIALS IN APP DRAWER WITH SHARED PREFERENCES====================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder(
            future: TestRequestDetailsAPI(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(
                    heightFactor: 90, child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text("Somthing went wrong");
              }

              if (snapshot.hasData) {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
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
                              title: Text(
                                  "Booking for : ${snapshot.data[index].bookingFor}\nPatient Name : ${snapshot.data[index].patientName}"),
                                   trailing: ElevatedButton(
                                onPressed: () {
                                  AcceptTestProposal();
                                  //MyTestReqDetailsPage(snapshot.data[index].encBookingId);
                                  //Navigator.push(context, new MaterialPageRoute( builder: (context) => new MyTestReqDetailsPage(snapshot.data[index].encBookingId)), );
                                },
                                child: Text("Accept"),
                              ),
                              subtitle: Text("Booking Date : ${snapshot.data[index].bookingDate}\nVisit Date : ${snapshot.data[index].visitDate}\nTotalBookingFee  : ${snapshot.data[index].totalBookingFee}\nPaid Amount  : ${snapshot.data[index].paidAmt} "),
                            )
                            //Text(snapshot.data[index].visitDate),
                          ],
                        ),
                      );
                    });
              }

              return Text("Waiting for Internet Connection");
            },
          ),
        ),
      ),
    );
  }

  Future<List<TRequestDetails>> TestRequestDetailsAPI() async {
    var jsonResponse;
    if (encBookingIdRef.isNotEmpty) {
      var response = await http.post(
          Uri.parse(
              "http://medbo.digitalicon.in/api/medboapi/TestRequestDetail"),
          body: ({
            "EncId": encBookingIdRef,
          }));
      if (response.statusCode == 200) {
        print("Correct");
        // print(response.body);
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmPaymentPage(rresponse: DocVisitDaysModel.fromJson(jsonResponse))));

        TestRequestDetailsModel dataModel =
            testRequestDetailsModelFromJson(response.body);
        print(dataModel.data.length);
        for (final item in dataModel.data) print(item.patientName);

        List<TRequestDetails> arrData =
            dataModel.data; // this data is actuall json array of data[]
        //print(arrData[1].visitDate);
        return arrData;
      } else {
        print("Wrong URL");
        throw Exception("Faild to fetch");
      }
    } else {
      throw Exception("Faild to fetch?");
    }
  }

  /////////////////////////////////////////After login Response//////////////////////
  Future<void> AcceptTestProposal() async {
    var jsonResponse;
    if (encBookingIdRef.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://medbo.digitalicon.in/api/medboapi/AcceptTestProposal"),
          body: ({
            'EncId': encBookingIdRef,
          }));
      if (response.statusCode == 200) {
        print("Correct");
        print(response.body);
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
         //Navigator.push(context, MaterialPageRoute(builder: (context)=>AcceptTestProposalPage(rresponse: AcceptProposalModel.fromJson(jsonResponse))));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(" ${jsonResponse['Message']}"),
          backgroundColor: Color(0xFF00b3a4),
        ));

      } else {
        print("Wronggooooooooooooooooooooooooooo");
        print(response.body);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid credentials")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Blank field is not allowed"),
        backgroundColor: Color(0xFFAF0404),
      ));
    }
  }
}
