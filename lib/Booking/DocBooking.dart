import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medbo/API/Login/ApiResponse.dart';
import 'package:medbo/models/DocBookingModel.dart';
import 'package:medbo/models/allSurgicalPackModels.dart';
import 'package:medbo/models/docDetailsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:medbo/models/docVisitDaysModel.dart';

import 'afterDateSelectPage.dart';
import 'confirmPaymentPage.dart';

class DocBooking extends StatefulWidget {
  var partnerData, docData;
  DocBooking(this.partnerData, this.docData);

  @override
  _DocBookingState createState() =>
      _DocBookingState(this.partnerData, this.docData);
}

class _DocBookingState extends State<DocBooking> {
  String radioItemHolder = '03/09/2021';
  String radioFee = '';
  String discountRadioFee = '';
  String bookingRadioFee = '';

  int _radioValue = 1;
  String _selectedDate = "";
  final List<String> appointments = [
    "Physically Appointment",
    "Online Appointment"
  ];
  String selectedAppointmentType = "Online Appointment";

  var partnerDataRef, docDataRef;
  _DocBookingState(this.partnerDataRef, this.docDataRef);
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
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightBlue[50],
                      radius: 30,
                      backgroundImage:
                          NetworkImage("${docDataRef.doctorImage}"),
                    ),
                    title: Text("${docDataRef.doctorName}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: blockSizeHorizontal * 3.5,
                          fontFamily: 'Poppins',
                          color: Theme.of(context).primaryColor,
                        )),
                    subtitle: Text(
                        "${docDataRef.qualification}\n${docDataRef.specialisation}  "),
                    //"Booking Information: ${partnerDataRef.partnerName},\n Location: ${partnerDataRef.partnerAddress}",
                  ),

                  // Text("Booking Information: ${partnerDataRef.partnerName}",textAlign: TextAlign.left,),
                  // Text("Location: ${partnerDataRef.partnerAddress}",textAlign: TextAlign.left,),
                  //Text(_finalUserData.encUserId),
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
                    Text(
                      "Booking Information",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: blockSizeHorizontal * 3.5,
                        fontFamily: 'Poppins',
                        color: Theme.of(context).primaryColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "${partnerDataRef.partnerName}",
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Location: ${partnerDataRef.partnerAddress}",
                      textAlign: TextAlign.left,
                    ),

                    SizedBox(
                      height: 50,
                    ),

                    Text(
                      "Appointment Type",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: blockSizeHorizontal * 3.5,
                        fontFamily: 'Poppins',
                        color: Theme.of(context).primaryColor,
                      ),
                      textAlign: TextAlign.left,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
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
                      height: 50,
                    ),

                    Text(
                      "Preferred Visit Date",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: blockSizeHorizontal * 3.5,
                        fontFamily: 'Poppins',
                        color: Theme.of(context).primaryColor,
                      ),
                      textAlign: TextAlign.left,
                    ),

                    // Text('Selected Item = '+'$_radioValue', style: TextStyle(fontSize: 23)),

                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // color: Color(0xFF3E64FF),
                        color: Colors.lightBlue[50],
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: DateTimePicker(
                        initialValue:
                            '', // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
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
                        lastDate: DateTime.now().add(Duration(
                            days:
                                30)), // This will add 30 days from current date
                        validator: (value) {
                          return null;
                        },
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              _selectedDate = value;
                            });
                            DocVisitDays(); //============= API calling

                          }
                        },
                        onSaved: (value) {
                          if (value.isNotEmpty) {
                            _selectedDate = value;
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Your Selected Date: $_selectedDate',
                      style: TextStyle(fontSize: 16),
                    ),

//=========================================================================================================================================

                    Container(
                      child: FutureBuilder(
                        future: DocVisitDays(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
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
                                              radioItemHolder = snapshot
                                                  .data[index].visitDate;
                                              radioFee =
                                                  snapshot.data[index].fee;
                                              discountRadioFee = snapshot
                                                  .data[index].discountedFee;
                                              bookingRadioFee = snapshot
                                                  .data[index].bookingFee;
                                              _radioValue = val as int;
                                            });
                                          },
                                        ),
                                        Text(
                                          "Visit Day: ${snapshot.data[index].visitDate},\n Fee: ${snapshot.data[index].fee},  \n Discounted Fee: ${snapshot.data[index].discountedFee},  \n Booking Fee: ${snapshot.data[index].bookingFee} ",
                                          style:
                                              TextStyle(fontFamily: 'Poppins'),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          }
                          return Text("Error while calling");
                        },
                      ),
                    ),

                    ElevatedButton(
                        onPressed: () {
                          SaveDoctBooking();
                        },
                        child: Text("Next")),

                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ConfirmPaymentPage(partnerDataRef)));
                        },
                        child: Text("Payment Confirmm")),

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

  Future<List<Datum>> DocVisitDays() async {
    var jsonResponse;
    if (partnerDataRef.encPartnerId.isNotEmpty &&
        docDataRef.encDoctorId.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://medbo.digitalicon.in/api/medboapi/DoctorVisitDay"),
          body: ({
            'EncPartnerId': partnerDataRef.encPartnerId,
            'EncDoctorId': docDataRef.encDoctorId,
            'VisitDate': _selectedDate,
          }));
      if (response.statusCode == 200) {
        print("Correct");
        // print(response.body);
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmPaymentPage(rresponse: DocVisitDaysModel.fromJson(jsonResponse))));

        DocVisitDaysModel dataModel = docVisitDaysModelFromJson(response.body);
        print(dataModel.data.length);
        for (final item in dataModel.data) print(item.visitDayName);

        List<Datum> arrData =
            dataModel.data; // this data is actuall json array of data[]
        //print(arrData[1].visitDayName);
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

  Future<void> SaveDoctBooking() async {
    var jsonResponse;
    if (partnerDataRef.encPartnerId.isNotEmpty &&
        docDataRef.encDoctorId.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://medbo.digitalicon.in/api/medboapi/SaveDoctBooking"),
          body: ({
            'EncPartnerId': partnerDataRef.encPartnerId,
            'EncDoctorId': docDataRef.encDoctorId,
            'VisitDate': radioItemHolder,
            'Fee': radioFee,
            'DiscountedFee': discountRadioFee,
            'BookingFee': bookingRadioFee,
          }));
      if (response.statusCode == 200) {
        print("Correct");
        print(response.body);
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AfterDateSelectPage(
                    rresponse: DocBookingModel.fromJson(jsonResponse),)));
      } else {
        print("Wrong URL");
        throw Exception("Faild to fetch");
      }
    } else {
      throw Exception("Faild to fetch");
    }
  }
}
//partnerDataRef,