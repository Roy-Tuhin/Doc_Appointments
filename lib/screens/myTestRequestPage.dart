import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medbo/Animation/showupAnimation.dart';
import 'package:medbo/Booking/PathologicalMultipleBooking/SingleTestBooking.dart';
import 'package:medbo/BookingList/MyTestRequestModel.dart';
import 'package:medbo/BookingList/UserBookingRecordModel.dart';
import 'package:medbo/screen_helper/side_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'myTestReqDetailsPage.dart';

class MyTestRquestPage extends StatefulWidget {
  const MyTestRquestPage({Key? key}) : super(key: key);

  @override
  _MyTestRquestPageState createState() => _MyTestRquestPageState();
}

class _MyTestRquestPageState extends State<MyTestRquestPage> {
  int delayAmount = 500;

  final _colors = [
    // Colors.blue.withOpacity(0.1),
    // Colors.red.withOpacity(0.1),
    // Colors.yellow.withOpacity(0.1),
    // Colors.green.withOpacity(0.1),

    Color(0xff6DC8F3).withOpacity(0.3),
    Color(0xffFFB157).withOpacity(0.3),
    Color(0xffFF5B95).withOpacity(0.3),
    Color(0xffD76EF5).withOpacity(0.3),
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
    MyTestRequestAPI();
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
      backgroundColor: Color(0XFFF3F1F5),
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
          'My Test Request',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF02475E),
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          color: Color(0xFF02475E),
        ),
      ),
      //drawer: SideDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //color: Colors.blue,
            child: FutureBuilder(
              future: MyTestRequestAPI(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(child: CircularProgressIndicator()),
                  ));
                }
                if (snapshot.hasError) {
                  return  Container(
                    child: Stack(
                      children:[ Image.asset(
                                "assets/images/14_No Search Results.png",
                                fit: BoxFit.cover,
                              ),

                                 Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 13),
                    blurRadius: 25,
                    color: Color(0xFF5666C2).withOpacity(0.17),
                  ),
                ],
              ),
              child: ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PathologicalSingleTestBookingPage(),
                            )),
                        style: TextButton.styleFrom(
                          // backgroundColor: Color(0xFF6CD8D1),
                          elevation: 0,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                           // side: BorderSide(color: Color(0xFF6CD8D1)),
                          ),
                        ),
                        child: Text("Book a Test",style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),),
                      ),
            ),
          )
                              
                              ]
                    ),
                  );
                }

                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ShowUp(
                          delay: delayAmount,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 20, left: 5, right: 5, bottom: 5),
                            padding: EdgeInsets.only(
                                top: 20, left: 5, right: 5, bottom: 20),
                            decoration: BoxDecoration(
                                // color: Color(0xFF3E64FF),
                                //color: Colors.lightBlue[50],
                                color: _colors[index % _colors.length],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
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
                                  title: ShowUp(
                                    delay: delayAmount + 200,
                                    child: Text(
                                      "Booking for : ${snapshot.data[index].bookingFor}\nPatient Name : ${snapshot.data[index].patientName}",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),
                                    ),
                                  ),
                                  trailing: ShowUp(
                                    delay: delayAmount + 1000,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        //MyTestReqDetailsPage(snapshot.data[index].encBookingId);
                                        Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  new MyTestReqDetailsPage(
                                                      snapshot.data[index]
                                                          .encBookingId)),
                                        );
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color(0xFF79a0be)),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.only(left: 5, right: 5)),
                                      ),
                                      child: Text("Details",style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                      ),),
                                    ),
                                  ),
                                  subtitle: ShowUp(
                                    delay: delayAmount + 500,
                                    child: Text(
                                      "Booking Date : ${snapshot.data[index].bookingDate}\nVisit Date : ${snapshot.data[index].visitDate}\nTotalBookingFee  : ${snapshot.data[index].totalBookingFee}\nPaid Amount  : ${snapshot.data[index].paidAmt} ",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                )
                                //Text(snapshot.data[index].visitDate),
                              ],
                            ),
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

  Future<List<TestRequest>> MyTestRequestAPI() async {
    var jsonResponse;
    if (EncUserId.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://medbo.digitalicon.in/api/medboapi/MyTestRequest"),
          body: ({
            "EncId": EncUserId,
          }));
      if (response.statusCode == 200) {
        print("Correct");
        // print(response.body);
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmPaymentPage(rresponse: DocVisitDaysModel.fromJson(jsonResponse))));

        MyTestRequestModel dataModel =
            myTestRequestModelFromJson(response.body);
        print(dataModel.data.length);
        for (final item in dataModel.data) print(item.patientName);

        List<TestRequest> arrData =
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
}
