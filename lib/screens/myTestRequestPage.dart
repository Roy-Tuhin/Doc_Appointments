import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medbo/BookingList/MyTestRequestModel.dart';
import 'package:medbo/BookingList/UserBookingRecordModel.dart';
import 'package:medbo/screen_helper/side_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
      drawer: SideDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder(
            future: MyTestRequestAPI(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text("Somthing went wrong");
              }
      
              if(snapshot.hasData){
                return ListView.builder(
                  scrollDirection:  Axis.vertical,
                   physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context, int index) {
      
                                    return Container(
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text("Booking for : ${snapshot.data[index].bookingFor}\nPatient Name : ${snapshot.data[index].patientName}"),
                                            subtitle: Text("Booking Date : ${snapshot.data[index].bookingDate}\nVisit Date : ${snapshot.data[index].visitDate}\nTotalBookingFee  : ${snapshot.data[index].totalBookingFee}\n Paid Amount  : ${snapshot.data[index].paidAmt} "),
                                          )
                                          //Text(snapshot.data[index].visitDate),
                                        ],
                                      ),
      
                                    );
                                  }
      
                );
      
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

        MyTestRequestModel dataModel = myTestRequestModelFromJson(response.body);
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
