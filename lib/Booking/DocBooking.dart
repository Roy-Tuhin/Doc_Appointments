import 'package:flutter/material.dart';
import 'package:medbo/models/docDetailsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_time_picker/date_time_picker.dart';

class DocBooking extends StatefulWidget {
  // const DocBooking(PartnerDatum finalpartnerData, { Key? key, encId }) : super(key: key);
  var partnerData, docData;
  DocBooking(this.partnerData, this.docData);

  @override
  _DocBookingState createState() =>
      _DocBookingState(this.partnerData, this.docData);
}

class _DocBookingState extends State<DocBooking> {
  String _selectedDate="";
  final List<String> appointments = [
    "Physically Appointment",
    "Online Appointment"
  ];
  String selectedAppointmentType = "Online Appointment";

  var partnerDataRef, docDataRef;
  _DocBookingState(this.partnerDataRef, this.docDataRef);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidth/100);
    var blockSizeVertical= (screenHeight/100);
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
                    title: Text("${docDataRef.doctorName}",style:TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: blockSizeHorizontal*3.5,
                                  fontFamily: 'Poppins',
                                  color: Theme.of(context).primaryColor,)),
                    subtitle: Text("${docDataRef.qualification}\n${docDataRef.specialisation},"),
                      //"Booking Information: ${partnerDataRef.partnerName},\n Location: ${partnerDataRef.partnerAddress}",
                    ),
                 
                  // Text("Booking Information: ${partnerDataRef.partnerName}",textAlign: TextAlign.left,),
                  // Text("Location: ${partnerDataRef.partnerAddress}",textAlign: TextAlign.left,),
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
              child: Align(alignment: Alignment.topLeft,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Booking Information",style:TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: blockSizeHorizontal*3.5,
                                  fontFamily: 'Poppins',
                                  color: Theme.of(context).primaryColor,), textAlign: TextAlign.left,),
                     Text("${partnerDataRef.partnerName}",textAlign: TextAlign.left,),
                    Text("Location: ${partnerDataRef.partnerAddress}",textAlign: TextAlign.left,),




                    SizedBox(height: 50,),






                    Text("Appointment Type",style:TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: blockSizeHorizontal*3.5,
                                  fontFamily: 'Poppins',
                                  color: Theme.of(context).primaryColor,), textAlign: TextAlign.left,),



                    Padding(
                      padding: const EdgeInsets.only(left:28.0),
                      child: DropdownButton<String>(
                        style: TextStyle(color: Colors.green, fontSize: 15,fontFamily: 'Poppins',),
                        value: selectedAppointmentType,
                        onChanged: (value) {
                          setState(() {
                            selectedAppointmentType = value!;
                          });
                        },
                        items: appointments.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                      ),
                    ),







                     SizedBox(height: 50,),






                    Text("Preferred Visit Date",style:TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: blockSizeHorizontal*3.5,
                                  fontFamily: 'Poppins',
                                  color: Theme.of(context).primaryColor,), textAlign: TextAlign.left,),



                Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
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
                  initialValue: '', // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
                  type: DateTimePickerType.date,
                  dateLabelText: 'Select Date',style:TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: blockSizeHorizontal*3.5,
                                  fontFamily: 'Poppins',
                                  color:Colors.green, letterSpacing: 2.0,) ,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now()
                      .add(Duration(days: 30)), // This will add one year from current date
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

            //     SizedBox(height: 16),
            // Text(
            //   'Your Selected Date: $_selectedDate',
            //   style: TextStyle(fontSize: 16),
            // ),








            //                     Container(
            //   height: 200,
            //   child: CupertinoDatePicker(
            //     mode: CupertinoDatePickerMode.date,
            //     // initialDateTime: DateTime(2021, 1, 1),
            //     // maximumYear: 2021,
            //     // minimumYear: 2021,
            //     maximumDate: DateTime.now().add(Duration(days: 30)),
            //     minimumDate: DateTime.now(),
            //     onDateTimeChanged: (DateTime newDateTime) {
            //       // Do something
            //     },
            //   ),
            // ),









                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}







                  // Text("Appointment"),
                  // DropdownButton<String>(
                  //   value:  selectedAppointmentType ,
                  //   onChanged: (value){
                  //     setState(() {
                  //        selectedAppointmentType = value!;
                  //     });
                  //   },
                  //   items: appointments.map<DropdownMenuItem <String>>((value){
                  //     return DropdownMenuItem(
                  //       child: Text(value),
                  //       value:value,
                  //     );
                  //   }).toList(),

                  // ),