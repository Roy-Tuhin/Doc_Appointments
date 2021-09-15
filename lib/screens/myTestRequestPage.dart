import 'dart:convert';

import 'package:flutter/material.dart';
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
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topCenter,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor
              ],
            ),
          ),
        ),
        title: Text(
          'My Test Request',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
      ),
      drawer: SideDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder(
            future: MyTestRequestAPI(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(child: CircularProgressIndicator()),
                ));
              }
              if (snapshot.hasError) {
                return Text("No Booking found from this Account / Somthing went wrong");
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
                                  //MyTestReqDetailsPage(snapshot.data[index].encBookingId);
                                  Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            new MyTestReqDetailsPage(snapshot.data[index].encBookingId)),
                                  );
                                },
                                child: Text("Details"),
                              ),
                              subtitle: Text(
                                  "Booking Date : ${snapshot.data[index].bookingDate}\nVisit Date : ${snapshot.data[index].visitDate}\nTotalBookingFee  : ${snapshot.data[index].totalBookingFee}\n Paid Amount  : ${snapshot.data[index].paidAmt} "),
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
