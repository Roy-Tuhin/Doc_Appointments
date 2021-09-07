import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class MultipleTestBooking extends StatefulWidget {
  const MultipleTestBooking({Key? key}) : super(key: key);

  @override
  _MultipleTestBookingState createState() => _MultipleTestBookingState();
}

class _MultipleTestBookingState extends State<MultipleTestBooking> {
  String _selectedDate = DateTime.now().toString();
  final List<String> appointments = [
    "Select Lab",
    "Offline Appointment",
    "Online Appointment",
  ];
  String selectedAppointmentType = "Select Lab";

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidth / 100);
    var blockSizeVertical = (screenHeight / 100);

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text("Booking Information",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: blockSizeHorizontal * 5,
                        fontFamily: 'Poppins',
                        color: Theme.of(context).primaryColor,
                      )),
                  subtitle: Text("Preferred Visit Date"),
                ),
              ),
              //==============================================================================
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                        days: 30)), // This will add one year from current date
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
              ),

              //==============================================================================

              ListTile(
                title: Text(
                  " Select Pathological Lab",
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
            ],
          ),
        ),
      ),
    );
  }
  //==========================================================================================================================================================================



  Future<List<DieticianVisitData>> AllPathLab() async {
    var jsonResponse;
    if (widget.encDieticianId.isNotEmpty && widget.dieticianAllPartnerData.encPartnerId.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://medbo.digitalicon.in/api/medboapi/AllPathLab"),
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





}
