import 'dart:convert';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'DieticianAfterDateSelect/DieticianAfterDateSelectPage.dart';
import 'DieticianEncBookingIdModel.dart';

class PathalogicalBookingPage extends StatefulWidget {
  //const SurgicalPackBooking({ Key? key }) : super(key: key);
  var pathTestAllData;
  var pathTestPartnerData;
  PathalogicalBookingPage(this.pathTestAllData, this.pathTestPartnerData);

  @override
  _PathalogicalBookingPageState createState() => _PathalogicalBookingPageState(
    this.pathTestAllData, this.pathTestPartnerData);
}

class _PathalogicalBookingPageState extends State<PathalogicalBookingPage> {




  
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








  String _selectedDate = DateTime.now().toString();
  var pathTestAllDataRef;
  var pathTestPartnerDataRef;
  _PathalogicalBookingPageState(
      this.pathTestAllDataRef, this.pathTestPartnerDataRef);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidth / 100);
    var blockSizeVertical = (screenHeight / 100);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${ pathTestAllDataRef.testName} \n TestEncId: ${pathTestAllDataRef.encTestId} Booking',
          style: TextStyle(fontFamily: 'Poppins'),
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
                child: Column(children: [
                  ListTile(
                    title: Text("${ pathTestAllDataRef.testName} \n TestEncId: ${pathTestAllDataRef.encTestId} ",//=====================================================
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: blockSizeHorizontal * 5,
                          fontFamily: 'Poppins',
                          color: Theme.of(context).primaryColor,
                        )),
                    // subtitle: Text("${ pathTestAllDataRef.description}"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text("Booking Information",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: blockSizeHorizontal * 5,
                          fontFamily: 'Poppins',
                          color: Theme.of(context).primaryColor,
                        )),
                    subtitle: Text(
                        "${ pathTestPartnerDataRef.partnerName} \n ${pathTestPartnerDataRef.partnerAddress} \n ${pathTestPartnerDataRef.encPartnerId}  "),
                  ),


                  SizedBox(
                    height: 20,
                  ),



                  ListTile(
                    title: Text(
                      "Fee",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: blockSizeHorizontal * 5,
                        fontFamily: 'Poppins',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    subtitle: Container(
                      height: blockSizeVertical * 13,
                      //color: Colors.green,
                      child: Row(
                        children: [
                          Text(
                            'Actual Fee : ₹ ${pathTestPartnerDataRef.fee}\nDiscount Fee : ₹ ${pathTestPartnerDataRef.discountedFee}\nBooking Fee : ₹ ${pathTestPartnerDataRef.bookingFee}   ',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: blockSizeHorizontal * 4.0,
                              fontFamily: 'Poppins',
                              //color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                  // ListTile(
                  //   title: Text(
                  //     "Fee",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: blockSizeHorizontal * 5,
                  //       fontFamily: 'Poppins',
                  //       color: Theme.of(context).primaryColor,
                  //     ),
                  //   ),
                  //   subtitle: Expanded(
                  //     child: Container(
                  //         height: 17,
                  //         //color: Colors.green,
                  //         child: Row(
                  //           children: [
                  //             Text(
                  //               'Actual Fee: ₹ ${pathTestPartnerDataRef.fee}',
                  //                style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: blockSizeHorizontal * 2.3,
                  //       fontFamily: 'Poppins',
                  //       //color: Theme.of(context).primaryColor,
                  //     ),
                  //             ),
                  //             VerticalDivider(
                  //               thickness: 1,
                  //               color: Colors.blueGrey,
                  //             ),
                  //             Text(
                  //               'Discount Fee: ₹ ${pathTestPartnerDataRef.discountedFee}',
                  //               style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: blockSizeHorizontal * 2.3,
                  //       fontFamily: 'Poppins',
                  //       //color: Theme.of(context).primaryColor,
                  //     ),
                  //             ),
                  //             VerticalDivider(
                  //               thickness: 1,
                  //               color: Colors.blueGrey,
                  //             ),
                  //             Text(
                  //               'Discount Fee: ₹ ${pathTestPartnerDataRef.bookingFee}',
                  //               style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: blockSizeHorizontal * 2.3,
                  //       fontFamily: 'Poppins',
                  //       //color: Theme.of(context).primaryColor,
                  //     ),
                  //             ),
                  //           ],
                  //         ),
                  //         ),
                  //   ),
                  // ),





                  ListTile(
                    title: Text(
                      "Preferred Visit Date",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: blockSizeHorizontal * 5,
                        fontFamily: 'Poppins',
                        color: Theme.of(context).primaryColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    padding: EdgeInsets.only(left: 0, right: 150),
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
                    child: DateTimePicker(
                      initialValue: DateTime.now().toString(),
                      //initialValue:'', // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
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
                              30)), // This will add one year from current date
                      validator: (value) {
                        return null;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            _selectedDate = value;
                          });
                        }
                      },
                      onSaved: (value) {
                        if (value!.isNotEmpty) {
                          _selectedDate = value;
                        }
                      },
                    ),
                  ),
                  
                    ElevatedButton(
                        onPressed: () {
                          SaveSingleTestBooking();
                        },
                        child: Text("Book Appointment")),


                ],
                
                ),


                




              ),

              //=========================================================================

            ],
          ),
        ),
      ),
    );
  }




   Future<void> SaveSingleTestBooking() async {
    var jsonResponse;
    if (pathTestPartnerDataRef.encPartnerId.isNotEmpty && pathTestAllDataRef.encTestId.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://medbo.digitalicon.in/api/medboapi/SaveSingleTestBooking"),
          body: ({
            'EncPartnerId': pathTestPartnerDataRef.encPartnerId,
            'EncDoctorId': pathTestAllDataRef.encTestId,
            'VisitDate': _selectedDate,
            // 'Fee': radioFee,
            // 'DiscountedFee': discountRadioFee,
            // 'BookingFee': bookingRadioFee,
            'EncUserId' : EncUserId,
          }));
      if (response.statusCode == 200) {
        print("Correct");
        print(response.body);
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
        Navigator.push(context,MaterialPageRoute(builder: (context) => DieticianAfterDateSelectPage( rresponse: DieticianEncBookingIdModel.fromJson(jsonResponse),)));// common page for all after date selection
      } else {
        print("Wrong URL");
        throw Exception("Faild to fetch");
      }
    } else {
      throw Exception("Faild to fetch");
    }





}

}
