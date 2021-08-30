import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

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
  String _selectedDate = "";
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
          '${ pathTestAllDataRef.testName} Booking',
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
                    title: Text("${ pathTestAllDataRef.testName}",
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
                        "${ pathTestPartnerDataRef.partnerName} \n ${pathTestPartnerDataRef.partnerAddress}"),
                  ),


                  SizedBox(
                    height: 20,
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
                        if (value.isNotEmpty) {
                          _selectedDate = value;
                        }
                      },
                    ),
                  ),
                ]),
              ),

              //=========================================================================

            ],
          ),
        ),
      ),
    );
  }
}
