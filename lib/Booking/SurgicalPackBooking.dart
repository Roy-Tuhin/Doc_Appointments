import 'dart:convert';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'DieticianAfterDateSelect/DieticianAfterDateSelectPage.dart';
import 'DieticianEncBookingIdModel.dart';

class SurgicalPackBooking extends StatefulWidget {
  //const SurgicalPackBooking({ Key? key }) : super(key: key);
  var surgicalPackageAllData;
  var surgicalPartnerData;
  SurgicalPackBooking(this.surgicalPackageAllData, this.surgicalPartnerData);

  @override
  _SurgicalPackBookingState createState() => _SurgicalPackBookingState(
      this.surgicalPackageAllData, this.surgicalPartnerData);
}

class _SurgicalPackBookingState extends State<SurgicalPackBooking> {




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









  String _selectedDate =  DateTime.now().toString();
  var SurgicalPackDataRef;
  var surgicalPartnerDataRef;
  _SurgicalPackBookingState(
      this.SurgicalPackDataRef, this.surgicalPartnerDataRef);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidth / 100);
    var blockSizeVertical = (screenHeight / 100);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${SurgicalPackDataRef.packageName} Booking',
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
                    title: Text(
                        "${SurgicalPackDataRef.packageName}\nPackageEncId : ${SurgicalPackDataRef.encPackageId}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: blockSizeHorizontal * 5,
                          fontFamily: 'Poppins',
                          color: Theme.of(context).primaryColor,
                        )),
                    subtitle: Text("${SurgicalPackDataRef.description}"),
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
                        "${surgicalPartnerDataRef.partnerName} \n ${surgicalPartnerDataRef.partnerAddress} \n \nEncPartnerId:  ${surgicalPartnerDataRef.encPartnerId}"),
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
                            'Actual Fee : ₹ ${surgicalPartnerDataRef.fee}\nDiscount Fee : ₹ ${surgicalPartnerDataRef.discountedFee}\nBooking Fee : ₹ ${surgicalPartnerDataRef.bookingFee}   ',
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
                ]),
              ),

              //=========================================================================Text form field===============================================================

              // Container(
              //   margin: EdgeInsets.all(20),
              //   padding: EdgeInsets.all(10),
              //   decoration: BoxDecoration(
              //       // color: Color(0xFF3E64FF),
              //       color: Colors.lightBlue[50],
              //       borderRadius: BorderRadius.all(Radius.circular(12)),
              //       boxShadow: [
              //         BoxShadow(
              //           //color: Color(0xFF3E64FF).withOpacity(0.3),
              //           color: Colors.grey.withOpacity(0.9),
              //           offset: const Offset(
              //             0.0,
              //             5.0,
              //           ),
              //           blurRadius: 3.0,
              //           spreadRadius: 0.5,
              //         ),
              //       ]),



                // child: Column(
                //   children: [
                //     ListTile(
                //         title: Text(
                //       "Patient Information",
                //       style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         fontSize: blockSizeHorizontal * 5,
                //         fontFamily: 'Poppins',
                //         color: Theme.of(context).primaryColor,
                //       ),
                //     )),

                //     Padding(
                //       padding: const EdgeInsets.only(left: 13, right: 13),
                //       child: TextFormField(
                //         style: TextStyle(
                //           color: Colors.black,
                //           fontFamily: 'Poppins',
                //         ),
                //         //controller: searchController,
                //         onChanged: (text) {
                //           setState(
                //             () {
                //               // textLength = text.length;
                //             },
                //           );
                //         },

                //         decoration: InputDecoration(
                //           enabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.black12),
                //             borderRadius: BorderRadius.only(
                //               bottomLeft: Radius.circular(20),
                //               bottomRight: Radius.circular(20),
                //               topRight: Radius.circular(20),
                //               topLeft: Radius.circular(20),
                //             ),
                //           ),

                //           focusedBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //                 color: Colors
                //                     .black12 //greenAccent//Color(0xFF425c5a),
                //                 ),
                //             borderRadius: BorderRadius.only(
                //               bottomLeft: Radius.circular(20),
                //               bottomRight: Radius.circular(20),
                //               topRight: Radius.circular(20),
                //               topLeft: Radius.circular(20),
                //             ),
                //           ),

                //           errorBorder: OutlineInputBorder(
                //             //  borderSide: BorderSide(color: Colors.red[100]),
                //             borderRadius: BorderRadius.only(
                //               bottomLeft: Radius.circular(20),
                //               bottomRight: Radius.circular(20),
                //               topRight: Radius.circular(20),
                //               topLeft: Radius.circular(20),
                //             ),
                //           ),

                //           // suffixIcon: IconButton(
                //           // icon: Icon(Icons.search, color: Colors.white,size: 34,),
                //           // onPressed: (){
                //           //   //searchByUser();
                //           //   },//=============================================================
                //           // ),

                //           // suffixIcon: Icon(textLength <= 5 ? Icons.cancel : Icons.check,
                //           //     color: textLength >= 6 ? Colors.green : Colors.redAccent),

                //           labelText: 'Patient Name',
                //           labelStyle: TextStyle(
                //             fontFamily: 'Poppins',
                //             color: Colors.blueGrey, //Color(0xFF425c5a),
                //             fontWeight: FontWeight.normal,
                //             letterSpacing: 2.0,
                //             fontSize: 11.0,
                //           ),
                //           //hintText: 'Ex : Dental or Sugar Check up etc',
                //           hintStyle: TextStyle(
                //             fontFamily: 'Poppins',
                //             color: Colors.white38, //Color(0xFF425c5a),
                //             fontWeight: FontWeight.normal,
                //             letterSpacing: 2.0,
                //             fontSize: 9.0,
                //           ),
                //           //filled: true,
                //           //fillColor: Colors.grey[200],
                //           prefixIcon: Icon(
                //             Icons.face,
                //             color: Colors.blueGrey,
                //           ),
                //         ),

                //         //keyboardType: TextInputType.number,
                //         // inputFormatters: [
                //         //   //only numeric keyboard.
                //         //  // LengthLimitingTextInputFormatter(6), //only 6 digit
                //         //  // WhitelistingTextInputFormatter.digitsOnly,
                //         // ],

                //         // validator: (String value) {
                //         //   if (value.length < 6) {
                //         //     return 'Enter your vaild 6 digit User ID';
                //         //   }
                //         //   return null;
                //         // },                                                                              // Active button validation
                //       ),
                //     ),

                //     //================================================= A D D R E S S ==================================================

                //     Padding(
                //       padding:
                //           const EdgeInsets.only(left: 13, right: 13, top: 13),
                //       child: TextFormField(
                //         style: TextStyle(
                //           color: Colors.black,
                //           fontFamily: 'Poppins',
                //         ),
                //         //controller: searchController,
                //         onChanged: (text) {
                //           setState(
                //             () {
                //               // textLength = text.length;
                //             },
                //           );
                //         },

                //         decoration: InputDecoration(
                //           enabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.black12),
                //             borderRadius: BorderRadius.only(
                //               bottomLeft: Radius.circular(20),
                //               bottomRight: Radius.circular(20),
                //               topRight: Radius.circular(20),
                //               topLeft: Radius.circular(20),
                //             ),
                //           ),

                //           focusedBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //                 color: Colors
                //                     .black12 //greenAccent//Color(0xFF425c5a),
                //                 ),
                //             borderRadius: BorderRadius.only(
                //               bottomLeft: Radius.circular(20),
                //               bottomRight: Radius.circular(20),
                //               topRight: Radius.circular(20),
                //               topLeft: Radius.circular(20),
                //             ),
                //           ),

                //           errorBorder: OutlineInputBorder(
                //             //  borderSide: BorderSide(color: Colors.red[100]),
                //             borderRadius: BorderRadius.only(
                //               bottomLeft: Radius.circular(20),
                //               bottomRight: Radius.circular(20),
                //               topRight: Radius.circular(20),
                //               topLeft: Radius.circular(20),
                //             ),
                //           ),

                //           // suffixIcon: IconButton(
                //           // icon: Icon(Icons.search, color: Colors.white,size: 34,),
                //           // onPressed: (){
                //           //   //searchByUser();
                //           //   },//=============================================================
                //           // ),

                //           // suffixIcon: Icon(textLength <= 5 ? Icons.cancel : Icons.check,
                //           //     color: textLength >= 6 ? Colors.green : Colors.redAccent),

                //           labelText: 'Address',
                //           labelStyle: TextStyle(
                //             fontFamily: 'Poppins',
                //             color: Colors.blueGrey, //Color(0xFF425c5a),
                //             fontWeight: FontWeight.normal,
                //             letterSpacing: 2.0,
                //             fontSize: 11.0,
                //           ),
                //           //hintText: 'Ex : Dental or Sugar Check up etc',
                //           hintStyle: TextStyle(
                //             fontFamily: 'Poppins',
                //             color: Colors.white38, //Color(0xFF425c5a),
                //             fontWeight: FontWeight.normal,
                //             letterSpacing: 2.0,
                //             fontSize: 9.0,
                //           ),
                //           //filled: true,
                //           //fillColor: Colors.grey[200],
                //           prefixIcon: Icon(
                //             Icons.home,
                //             color: Colors.blueGrey,
                //           ),
                //         ),

                //         //keyboardType: TextInputType.number,
                //         // inputFormatters: [
                //         //   //only numeric keyboard.
                //         //  // LengthLimitingTextInputFormatter(6), //only 6 digit
                //         //  // WhitelistingTextInputFormatter.digitsOnly,
                //         // ],

                //         // validator: (String value) {
                //         //   if (value.length < 6) {
                //         //     return 'Enter your vaild 6 digit User ID';
                //         //   }
                //         //   return null;
                //         // },                                                                              // Active button validation
                //       ),
                //     ),

                //     //=================================================PHONE ==================================================

                //     Padding(
                //       padding:
                //           const EdgeInsets.only(left: 13, right: 13, top: 13),
                //       child: TextFormField(
                //         style: TextStyle(
                //           color: Colors.black,
                //           fontFamily: 'Poppins',
                //         ),
                //         //controller: searchController,
                //         onChanged: (text) {
                //           setState(
                //             () {
                //               // textLength = text.length;
                //             },
                //           );
                //         },

                //         decoration: InputDecoration(
                //           enabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.black12),
                //             borderRadius: BorderRadius.only(
                //               bottomLeft: Radius.circular(20),
                //               bottomRight: Radius.circular(20),
                //               topRight: Radius.circular(20),
                //               topLeft: Radius.circular(20),
                //             ),
                //           ),

                //           focusedBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //                 color: Colors
                //                     .black12 //greenAccent//Color(0xFF425c5a),
                //                 ),
                //             borderRadius: BorderRadius.only(
                //               bottomLeft: Radius.circular(20),
                //               bottomRight: Radius.circular(20),
                //               topRight: Radius.circular(20),
                //               topLeft: Radius.circular(20),
                //             ),
                //           ),

                //           errorBorder: OutlineInputBorder(
                //             //  borderSide: BorderSide(color: Colors.red[100]),
                //             borderRadius: BorderRadius.only(
                //               bottomLeft: Radius.circular(20),
                //               bottomRight: Radius.circular(20),
                //               topRight: Radius.circular(20),
                //               topLeft: Radius.circular(20),
                //             ),
                //           ),

                //           // suffixIcon: IconButton(
                //           // icon: Icon(Icons.search, color: Colors.white,size: 34,),
                //           // onPressed: (){
                //           //   //searchByUser();
                //           //   },//=============================================================
                //           // ),

                //           // suffixIcon: Icon(textLength <= 5 ? Icons.cancel : Icons.check,
                //           //     color: textLength >= 6 ? Colors.green : Colors.redAccent),

                //           labelText: 'Phone',
                //           labelStyle: TextStyle(
                //             fontFamily: 'Poppins',
                //             color: Colors.blueGrey, //Color(0xFF425c5a),
                //             fontWeight: FontWeight.normal,
                //             letterSpacing: 2.0,
                //             fontSize: 11.0,
                //           ),
                //           //hintText: 'Ex : Dental or Sugar Check up etc',
                //           hintStyle: TextStyle(
                //             fontFamily: 'Poppins',
                //             color: Colors.white38, //Color(0xFF425c5a),
                //             fontWeight: FontWeight.normal,
                //             letterSpacing: 2.0,
                //             fontSize: 9.0,
                //           ),
                //           //filled: true,
                //           //fillColor: Colors.grey[200],
                //           prefixIcon: Icon(
                //             Icons.phone_android,
                //             color: Colors.blueGrey,
                //           ),
                //         ),

                //         keyboardType: TextInputType.number,
                //         // inputFormatters: [
                //         //   //only numeric keyboard.
                //         //  // LengthLimitingTextInputFormatter(6), //only 6 digit
                //         //  // WhitelistingTextInputFormatter.digitsOnly,
                //         // ],

                //         // validator: (String value) {
                //         //   if (value.length < 6) {
                //         //     return 'Enter your vaild 6 digit User ID';
                //         //   }
                //         //   return null;
                //         // },                                                                              // Active button validation
                //       ),
                //     ),

                //     //================================================= A G E ==================================================

                //     Padding(
                //       padding:
                //           const EdgeInsets.only(left: 13, right: 13, top: 13),
                //       child: TextFormField(
                //         style: TextStyle(
                //           color: Colors.black,
                //           fontFamily: 'Poppins',
                //         ),
                //         //controller: searchController,
                //         onChanged: (text) {
                //           setState(
                //             () {
                //               // textLength = text.length;
                //             },
                //           );
                //         },

                //         decoration: InputDecoration(
                //           enabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.black12),
                //             borderRadius: BorderRadius.only(
                //               bottomLeft: Radius.circular(20),
                //               bottomRight: Radius.circular(20),
                //               topRight: Radius.circular(20),
                //               topLeft: Radius.circular(20),
                //             ),
                //           ),

                //           focusedBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //                 color: Colors
                //                     .black12 //greenAccent//Color(0xFF425c5a),
                //                 ),
                //             borderRadius: BorderRadius.only(
                //               bottomLeft: Radius.circular(20),
                //               bottomRight: Radius.circular(20),
                //               topRight: Radius.circular(20),
                //               topLeft: Radius.circular(20),
                //             ),
                //           ),

                //           errorBorder: OutlineInputBorder(
                //             //  borderSide: BorderSide(color: Colors.red[100]),
                //             borderRadius: BorderRadius.only(
                //               bottomLeft: Radius.circular(20),
                //               bottomRight: Radius.circular(20),
                //               topRight: Radius.circular(20),
                //               topLeft: Radius.circular(20),
                //             ),
                //           ),

                //           // suffixIcon: IconButton(
                //           // icon: Icon(Icons.search, color: Colors.white,size: 34,),
                //           // onPressed: (){
                //           //   //searchByUser();
                //           //   },//=============================================================
                //           // ),

                //           // suffixIcon: Icon(textLength <= 5 ? Icons.cancel : Icons.check,
                //           //     color: textLength >= 6 ? Colors.green : Colors.redAccent),

                //           labelText: 'Age',
                //           labelStyle: TextStyle(
                //             fontFamily: 'Poppins',
                //             color: Colors.blueGrey, //Color(0xFF425c5a),
                //             fontWeight: FontWeight.normal,
                //             letterSpacing: 2.0,
                //             fontSize: 11.0,
                //           ),
                //           //hintText: 'Ex : Dental or Sugar Check up etc',
                //           hintStyle: TextStyle(
                //             fontFamily: 'Poppins',
                //             color: Colors.white38, //Color(0xFF425c5a),
                //             fontWeight: FontWeight.normal,
                //             letterSpacing: 2.0,
                //             fontSize: 9.0,
                //           ),
                //           //filled: true,
                //           //fillColor: Colors.grey[200],
                //           prefixIcon: Icon(
                //             Icons.calendar_today,
                //             color: Colors.blueGrey,
                //           ),
                //         ),

                //         keyboardType: TextInputType.number,
                //         // inputFormatters: [
                //         //   //only numeric keyboard.
                //         //  // LengthLimitingTextInputFormatter(6), //only 6 digit
                //         //  // WhitelistingTextInputFormatter.digitsOnly,
                //         // ],

                //         // validator: (String value) {
                //         //   if (value.length < 6) {
                //         //     return 'Enter your vaild 6 digit User ID';
                //         //   }
                //         //   return null;
                //         // },                                                                              // Active button validation
                //       ),
                //     ),

                    ElevatedButton(
                           style: TextButton.styleFrom(
                                   // backgroundColor: Color(0xFF6CD8D1),
                                          elevation: 0,
                                          backgroundColor:  Theme.of(context).primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            // side: BorderSide(color: Color(0xFF6CD8D1)),
                                           ), ),
                        onPressed: () {
                           SaveSurgicalBooking();
                        },
                          child: Container(
                                          width: blockSizeHorizontal*70,
                                          height: blockSizeVertical*7,
                                          child: Center(child: Text("Book Appointment", style: TextStyle(fontFamily: 'Poppins',color: Colors.white),)))),
                //   ],
                // ),
             // ),
            ],
          ),
        ),
      ),
    );
  }





    Future<void> SaveSurgicalBooking() async {
    var jsonResponse;
    if (surgicalPartnerDataRef.encPartnerId.isNotEmpty && SurgicalPackDataRef.encPackageId.isNotEmpty) {
      var response = await http.post(
          Uri.parse("https://medbo.in/api/medboapi/SaveSurgicalBooking"),
          body: ({
            'EncPartnerId':surgicalPartnerDataRef.encPartnerId,
            'EncDoctorId': SurgicalPackDataRef.encPackageId,
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
