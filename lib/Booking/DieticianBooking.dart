import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medbo/API/Login/ApiResponse.dart';
import 'package:medbo/models/DieticianModel/DieticianVisitModel.dart';
import 'package:medbo/models/DocBookingModel.dart';
import 'package:medbo/models/allSurgicalPackModels.dart';
import 'package:medbo/models/docDetailsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:medbo/models/docVisitDaysModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DieticianAfterDateSelect/DieticianAfterDateSelectPage.dart';
import 'DieticianEncBookingIdModel.dart';
import 'afterDateSelectPage.dart';
import 'confirmPaymentPage.dart';

class DieticianBookingPage extends StatefulWidget {//DieticianBookingPage
  var dieticianAllPartnerData,  dietName , encDieticianId;
  DieticianBookingPage(this.dieticianAllPartnerData, this.dietName, this.encDieticianId);

  @override
  _DieticianBookingPageState createState() =>
      _DieticianBookingPageState(this.dieticianAllPartnerData, this.dietName, this.encDieticianId);
}

class _DieticianBookingPageState extends State<DieticianBookingPage> {




  
//=====================================================================================S H O W   USER  DETIALS IN APP DRAWER WITH SHARED PREFERENCES====================================================

String Name="";
String EncUserId="";

void initState(){
  super.initState();
  getCred();
}

void getCred() async{
  //HERE WE FETCH OUR CREDENTIALS FROM SHARED PREF 
  SharedPreferences pref = await SharedPreferences.getInstance();
  setState(() {
    Name = pref.getString("userEmail");
    EncUserId= pref.getString("encId");
  });

}
//=====================================================================================S H O W   USER  DETIALS IN APP DRAWER WITH SHARED PREFERENCES====================================================













  String radioItemHolder = '';
  String radioFee = '';
  String discountRadioFee = '';
  String bookingRadioFee = '';

  int _radioValue = -1;
   String _selectedDate =  DateTime.now().toString();
  final List<String> appointments = [
    "Offline Appointment",
    "Online Appointment"
  ];
  String selectedAppointmentType = "Offline Appointment";

  var dieticianAllPartnerDataRef, dietNameRef, encDieticianIdRef;
  _DieticianBookingPageState(this.dieticianAllPartnerDataRef, this.dietNameRef, this.encDieticianIdRef);
  @override
  Widget build(BuildContext context) {
    // int _radioValue=1 ;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidth / 100);
    var blockSizeVertical = (screenHeight / 100);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking',
          style: TextStyle(fontFamily: 'Roboto_Condensed'),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      //=====================================================================================================================================================================

      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
                  // Text(
                  //          " $EncUserId",
                  //           style: TextStyle(color: Colors.blue,fontFamily: 'Poppins'),//  EncUserId from login
                  //          ),
                  ListTile(
                    // leading: CircleAvatar(
                    //   backgroundColor: Colors.lightBlue[50],
                    //   radius: 30,
                    //   // backgroundImage:
                    //   //     NetworkImage("${docDataRef.doctorImage}"),
                    // ),
                    title: Text(" Doctor Name : ${widget.dietName}", //${widget.encDieticianId}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: blockSizeHorizontal * 4.0,
                          fontFamily: 'Poppins',
                          color: Theme.of(context).primaryColor,
                        )),
                    subtitle: Text("Dietician Partner Name: ${widget.dieticianAllPartnerData.partnerName}",//\n${widget.dieticianAllPartnerData.partnerName}  "
                    ),
                    //"Booking Information: ${widget.dieticianAllPartnerData},\n Location: ${widget.dieticianAllPartnerData}",
                  ),

                  // Text("Booking Information: ${partnerDataRef.partnerName}",textAlign: TextAlign.left,),
                  // Text("Location: ${partnerDataRef.partnerAddress}",textAlign: TextAlign.left,),
                  // Text(_finalUserData.encUserId),
                ],
              ),
            ),
            Container(
              width: screenWidth,
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
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(
                    //   "Booking Information",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: blockSizeHorizontal * 3.5,
                    //     fontFamily: 'Poppins',
                    //     color: Theme.of(context).primaryColor,
                    //   ),
                    //   textAlign: TextAlign.left,
                    // ),
                    // Text(
                    //   "${encPartnerIdRef.partnerName}",
                    //   textAlign: TextAlign.left,
                    // ),
                    // Text(
                    //   "Location: ${encPartnerIdRef.partnerAddress}",
                    //   textAlign: TextAlign.left,
                    // ),

                    // SizedBox(
                    //   height: 50,
                    // ),

                    // Text(
                    //   "Appointment Type",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: blockSizeHorizontal * 3.5,
                    //     fontFamily: 'Poppins',
                    //     color: Theme.of(context).primaryColor,
                    //   ),
                    //   textAlign: TextAlign.left,
                    // ),
                    ListTile(
                      title: Text(
                        "Appointment Type",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: blockSizeHorizontal * 4.0,
                          fontFamily: 'Poppins',
                          color: Theme.of(context).primaryColor,
                        ),
                        ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: DropdownButton<String>(
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                        value: selectedAppointmentType,
                        onChanged: (value) {
                          setState(() {
                            selectedAppointmentType = value!;
                          });
                        },
                        items:
                            appointments.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    ListTile(
                      title: Text(
                        "Preferred Visit Date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: blockSizeHorizontal * 4.0,
                          fontFamily: 'Poppins',
                          color: Theme.of(context).primaryColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),

                    // Text('Selected Item = '+'$_radioValue', style: TextStyle(fontSize: 23)),

                    Container(
                      margin: EdgeInsets.only(top:0, left: 20, right: 20,bottom: 20),
                      padding: EdgeInsets.only(top:10),
                      decoration: BoxDecoration(
                        // color: Color(0xFF3E64FF),
                        color: Colors.lightBlue[50],
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: DateTimePicker(
                        initialValue: DateTime.now().toString(),
                       // initialValue: '', // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
                        type: DateTimePickerType.date,
                        dateLabelText: 'Select Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: blockSizeHorizontal * 3.5,
                          fontFamily: 'Poppins',
                          color: Colors.green,
                          letterSpacing: 2.0,
                        ),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days:30)), // This will add 30 days from current date
                        validator: (value) {
                          return null;
                        },
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              _selectedDate = value;
                            });
                            DieticianVisitDay(); //============= API calling

                          }
                        },
                        onSaved: (value) {
                          if (value!.isNotEmpty) {
                            _selectedDate = value;
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 0),
                    // Text(
                    //   'Your Selected Date: $_selectedDate',
                    //   style: TextStyle(fontSize: 16, fontFamily: 'Poppins', color: Colors.green ),
                    // ),
                    ListTile(
                      title: Text("Available Dates : ",
                      style: TextStyle(fontSize: 16, fontFamily: 'Poppins', color: Colors.green ),
                      ),
                    ),

//=========================================================================================================================================

                    Container(
                      child: FutureBuilder(
                        future: DieticianVisitDay(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState !=ConnectionState.done) {
                            return CircularProgressIndicator();
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
                                  // return Text(
                                  //   "Visit Day: ${snapshot.data[index].visitDayName},\n Fee: ${snapshot.data[index].fee},  \n Discounted Fee: ${snapshot.data[index].discountedFee},  \n Booking Fee: ${snapshot.data[index].bookingFee} ",
                                  //   style: TextStyle(fontFamily: 'Poppins'),
                                  // );
                                  return Container(
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
                                    child: Row(
                                      children: [
                                        Radio(
                                          activeColor: Colors.green,
                                          value: index,
                                          groupValue: _radioValue,
                                          onChanged: (val) {
                                            setState(() {
                                              radioItemHolder = snapshot.data[index].visitDate;
                                              radioFee =snapshot.data[index].fee;
                                              discountRadioFee = snapshot.data[index].discountedFee;
                                              bookingRadioFee = snapshot.data[index].bookingFee;
                                              _radioValue = val as int;
                                            });
                                          },
                                        ),
                                        Text(
                                          "Visit Day: ${snapshot.data[index].visitDate},\n Fee: ${snapshot.data[index].fee}  \n Discounted Fee: ${snapshot.data[index].discountedFee}  \n Booking Fee: ${snapshot.data[index].bookingFee} ",
                                          style:
                                              TextStyle(fontFamily: 'Poppins'),
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

                    ElevatedButton(
                        onPressed: () {
                          SaveDietBooking();
                        },
                        child: Text("Next")),

                    // ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) =>
                    //                   ConfirmPaymentPage(partnerDataRef)));
                    //     },
                    //     child: Text("Payment Confirmm")),

//=========================================================================================================================================
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Future<List<DieticianVisitData>> DieticianVisitDay() async {
    var jsonResponse;
    if (widget.encDieticianId.isNotEmpty && widget.dieticianAllPartnerData.encPartnerId.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://medbo.digitalicon.in/api/medboapi/DietVisitDay"),
          body: ({
            'EncPartnerId': widget.dieticianAllPartnerData.encPartnerId,
            'EncDoctorId': widget.encDieticianId,
            'VisitDate': _selectedDate,
            'AppointmentType': 'Offline',
          }));
      if (response.statusCode == 200) {
        print("Correct");
        // print(response.body);
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmPaymentPage(rresponse: DocVisitDaysModel.fromJson(jsonResponse))));

        DieticianVisitModel dataModel = dieticianVisitModelFromJson(response.body);
        print(dataModel.data.length);
        for (final item in dataModel.data) 
        print(item.visitDate);

        List<DieticianVisitData> arrData = dataModel.data; // this data is actuall json array of data[]
        //print(arrData[1].visitDate);
        return arrData;
      } else {
        print("Wrong URL");
        throw Exception("Faild to fetch");
      }
    } else {
      throw Exception("Faild to fetch");
    }
  }

//==============================================================================================================================

  Future<void> SaveDietBooking() async {
    var jsonResponse;
    if (widget.dieticianAllPartnerData.encPartnerId.isNotEmpty && widget.encDieticianId.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://medbo.digitalicon.in/api/medboapi/SaveDietBooking"),
          body: ({
            'EncPartnerId': widget.dieticianAllPartnerData.encPartnerId,
            'EncDoctorId': widget.encDieticianId,
            'VisitDate': radioItemHolder,
            'Fee': radioFee,
            'DiscountedFee': discountRadioFee,
            'BookingFee': bookingRadioFee,
            'EncUserId' : EncUserId,
            'AppointmentType': 'Offline',
          }));
      if (response.statusCode == 200) {
        print("Correct");
        print(response.body);
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
        Navigator.push(context,MaterialPageRoute(builder: (context) => DieticianAfterDateSelectPage( rresponse: DieticianEncBookingIdModel.fromJson(jsonResponse),)));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Please select from available dates")));
        throw Exception("Faild to fetch");
      }
    } else {
      throw Exception("Faild to fetch");
    }
  }
}
//partnerDataRef,