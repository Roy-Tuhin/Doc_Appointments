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


   final _colors = [
    // Colors.blue.withOpacity(0.1),
    // Colors.red.withOpacity(0.1),
    // Colors.yellow.withOpacity(0.1),
    // Colors.green.withOpacity(0.1),

    // Color(0xff6DC8F3).withOpacity(0.3),
    // Color(0xffFFB157).withOpacity(0.3),
    // Color(0xffFF5B95).withOpacity(0.3),
    // Color(0xffD76EF5).withOpacity(0.3),
    Color(0xff42E695).withOpacity(0.3),

    // Color(0xff6DC8F3),
    // Color(0xffFFB157),
    // Color(0xffFF5B95),
    // Color(0xffD76EF5),
    // Color(0xff42E695),


  ];
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
            //backgroundColor: Color(0XFFF3F1F5),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.topLeft,
        //       end: Alignment.topCenter,
        //       colors: [
        //         Color(0xffFAF3F3).withOpacity(0.3),
        //         Color(0xffFAF3F3).withOpacity(0.3),
        //        // Theme.of(context).accentColor
        //       ],
        //     ),
        //   ),
        // ),
        title: Text(
          'Test Request Details',
          style: TextStyle(
            fontFamily: 'Poppins',
             color: Color(0xFF02475E),
            fontWeight: FontWeight.w700
          ),
        ),
        centerTitle: true,
        leading: BackButton(onPressed: (){
          Navigator.of(context).pop(true);
        },
        color: Color(0xFF02475E),),
      ),
      drawer: SideDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
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
                         margin: EdgeInsets.only(top:20, left: 5, right: 5, bottom: 5),
                            padding: EdgeInsets.only(top:20, left: 5, right: 5,bottom: 20),
                          decoration: BoxDecoration(
                              // color: Color(0xFF3E64FF),
                              //color: Colors.lightBlue[50],
                              color: _colors[index % _colors.length],
                              borderRadius: BorderRadius.all(Radius.circular(24)),
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
                                    "Requested Test : ${snapshot.data[index].extra5}\nBooking for : ${snapshot.data[index].bookingFor}\nPatient Name : ${snapshot.data[index].patientName}",style: TextStyle(fontFamily: 'Poppins', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15),),
                                     trailing: ElevatedButton(
                                  onPressed: () {
                                    AcceptTestProposal();
                                    //MyTestReqDetailsPage(snapshot.data[index].encBookingId);
                                    //Navigator.push(context, new MaterialPageRoute( builder: (context) => new MyTestReqDetailsPage(snapshot.data[index].encBookingId)), );
                                  },
                                  style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xFF79a0be)),
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.only(left: 5, right: 5)),
                                        ),
                                  child: Text("Accept",style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                        ),),
                                ),
                                subtitle: Text("Booking Date : ${snapshot.data[index].bookingDate}\nVisit Date : ${snapshot.data[index].visitDate}\nTotalBookingFee  : ${snapshot.data[index].totalBookingFee}\nPaid Amount  : ${snapshot.data[index].paidAmt}\nAcceptStatus:  : ${snapshot.data[index].acceptStatus}\nAcceptDate:  : ${snapshot.data[index].acceptDate}  ",
                                  style: TextStyle(
                                                   color: Colors.white70,
                                                  fontFamily: 'Poppins',
                                                 ),
                                ),
                              ),
                              //Text(snapshot.data[index].visitDate),

                               Container(
                                //  height: 100,
                                //  width: 100,
                                child: Image.network(snapshot.data[index].extra2,),
                                
                                  ),
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
      ),
    );
  }

  Future<List<TRequestDetails>> TestRequestDetailsAPI() async {
    var jsonResponse;
    if (encBookingIdRef.isNotEmpty) {
      var response = await http.post(
          Uri.parse(
              "https://medbo.in/api/medboapi/TestRequestDetail"),
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
          Uri.parse("https://medbo.in/api/medboapi/AcceptTestProposal"),
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
