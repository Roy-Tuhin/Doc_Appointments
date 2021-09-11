// import 'dart:convert';
// import 'package:date_time_picker/date_time_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:medbo/models/allSurgicalPackModels.dart';
// import 'AllPathLabTestModel.dart';
// import 'package:http/http.dart' as http;

// import 'Dependent_DropDown_in_MultipleTest_Model.dart';

// class MultipleTestBooking extends StatefulWidget {
//   const MultipleTestBooking({Key? key}) : super(key: key);

//   @override
//   _MultipleTestBookingState createState() => _MultipleTestBookingState();
// }

// class _MultipleTestBookingState extends State<MultipleTestBooking> {

//  Partner? _selectedLab;
//  Datum? _selectedTest;


//   String encLabId = '';


//   void initState(){
//   super.initState();
//   AllPathLab();
// }



//   String _selectedDate = DateTime.now().toString();
//   final List<String> allLabList = [
//     "Select Lab",
//     "Abc",
//     "Xyz",
//   ];
//   String selectedLabFromList = "Abc";

//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//     var screenHeight = MediaQuery.of(context).size.height;
//     var blockSizeHorizontal = (screenWidth / 100);
//     var blockSizeVertical = (screenHeight / 100);

//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListTile(
//                   title: Text("Booking Information",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: blockSizeHorizontal * 5,
//                         fontFamily: 'Poppins',
//                         color: Theme.of(context).primaryColor,
//                       )),
//                   subtitle: Text("Preferred Visit Date"),
//                 ),
//               ),
//               //==============================================================================
//               Container(
//                 margin: EdgeInsets.only(left: 20),
//                 padding: EdgeInsets.only(left: 0, right: 150),
//                 decoration: BoxDecoration(
//                   // color: Color(0xFF3E64FF),
//                   color: Colors.lightBlue[50],
//                   borderRadius: BorderRadius.all(Radius.circular(12)),
//                   // boxShadow: [
//                   //   BoxShadow(
//                   //     //color: Color(0xFF3E64FF).withOpacity(0.3),
//                   //     color: Colors.grey.withOpacity(0.9),
//                   //     offset: const Offset(
//                   //       0.0,
//                   //       5.0,
//                   //     ),
//                   //     blurRadius: 3.0,
//                   //     spreadRadius: 0.5,
//                   //   ),
//                   // ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: DateTimePicker(
//                     initialValue: DateTime.now().toString(),
//                     //initialValue:'', // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
//                     type: DateTimePickerType.date,
//                     dateLabelText: 'Select Date',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: blockSizeHorizontal * 3.5,
//                       fontFamily: 'Poppins',
//                       color: Colors.green,
//                       letterSpacing: 2.0,
//                     ),
//                     firstDate: DateTime.now(),
//                     lastDate: DateTime.now().add(Duration(
//                         days: 30)), // This will add one year from current date
//                     validator: (value) {
//                       return null;
//                     },
//                     onChanged: (value) {
//                       if (value.isNotEmpty) {
//                         setState(() {
//                           _selectedDate = value;
//                         });
//                       }
//                     },
//                     onSaved: (value) {
//                       if (value.isNotEmpty) {
//                         _selectedDate = value;
//                       }
//                     },
//                   ),
//                 ),
//               ),

//               //==============================================================================


//                             ListTile(
//                                 title: Text(
//                                   "Select Pathological Lab",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: blockSizeHorizontal * 4.0,
//                                     fontFamily: 'Poppins',
//                                     color: Theme.of(context).primaryColor,
//                                   ),
//                                 ),
//                               ),


//                Container(
//                       child: FutureBuilder<List<Partner>>(
//                         future: AllPathLab(),
//                         builder:
//                             (BuildContext context, AsyncSnapshot snapshot) {
//                           if (snapshot.connectionState !=ConnectionState.done) {
//                             return CircularProgressIndicator();
//                           }
//                           if (snapshot.hasError) {
//                             return Text("Somthing went wrong");
//                           }

//                           if (snapshot.hasData) {
//                             return DropdownButton<Partner>(
//                                 value: _selectedLab,
//                                hint: Text("Select Lab"),
//                         //underline: SizedBox(),
//                         //isExpanded: true,
//                         items: snapshot.data.map((Partner data) =>
//                         DropdownMenuItem<Partner>(
//                                                   child: Text("${data.partnerName}"),
//                                                   value: data,
//                                                 )
//                                                 ).toList().cast<DropdownMenuItem<Partner>>(),
//                           onChanged: (value){
//                             setState(() {
//                                _selectedLab=value;
//                               encLabId = value!.encPartnerId;
//                               GetTestByLab(); 
//                             });
//                             //GetTestByLab(value!.encPartnerId); // passing encid to my next API function
//                            // GetTestByLab(); 

//                           },
                          
//                           );
                              
//                             }
//                           return Text("Waiting for Internet Connection");
//                         },
//                       ),
//                     ),

//                     //=========================================================== Dependent drop down===================================


//                          ListTile(
//                                 title: Text(
//                                   "Test Name",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: blockSizeHorizontal * 4.0,
//                                     fontFamily: 'Poppins',
//                                     color: Theme.of(context).primaryColor,
//                                   ),
//                                 ),
//                               ),

//                     Container(
//                       child: FutureBuilder<List<Datum>>(
//                         future: GetTestByLab(),
//                         builder:
//                             (BuildContext context, AsyncSnapshot snapshot) {
//                           if (snapshot.connectionState !=ConnectionState.done) {
//                             return CircularProgressIndicator();
//                           }
//                           if (snapshot.hasError) {
//                             return Text("Select a Lab for your Test");
//                           }

//                           if (snapshot.hasData) {
//                             return DropdownButton<Datum>(
//                               value: _selectedTest,
//                               hint: Text(""),
//                         //underline: SizedBox(),
//                         //isExpanded: true,
//                         items: snapshot.data.map((Datum data) =>
//                         DropdownMenuItem<Datum>(
//                           child: Text("${data.testName}"),
//                         value: data,
//                         )
//                           ).toList().cast<DropdownMenuItem<Datum>>(),
//                           onChanged: (value){
//                             _selectedTest=value;
//                             //GetTestByLab(value!.encPartnerId); // passing encid to my next API function

//                           });
                              
//                             }
//                           return Text("Waiting for Internet Connection");
//                         },
//                       ),
//                     ),










//               // ListTile(
//               //   title: Text(
//               //     " Select Pathological Lab",
//               //     style: TextStyle(
//               //       fontWeight: FontWeight.bold,
//               //       fontSize: blockSizeHorizontal * 4.0,
//               //       fontFamily: 'Poppins',
//               //       color: Theme.of(context).primaryColor,
//               //     ),
//               //   ),
//               // ),

//               // Padding(
//               //         padding: const EdgeInsets.only(left: 0.0),
//               //         child: DropdownButton<String>(

//               //           value: selectedLabFromList,
//               //           onChanged: (value) {
//               //             setState(() {
//               //               selectedLabFromList = value!;
//               //             });
//               //           },
//               //           items:allLabList.map<DropdownMenuItem<String>>((value) {
//               //             return DropdownMenuItem(
//               //               child: Text(value),
//               //               value: value,
//               //             );
//               //           }).toList(),
//               //         ),
//               //       ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   //==========================================================================================================================================================================



//   Future<List<Partner>> AllPathLab() async {
//     var jsonResponse;
  
//       var response = await http.post(Uri.parse("http://medbo.digitalicon.in/api/medboapi/AllPathLab"),
//           body: ({
            
//           }));
//       if (response.statusCode == 200) {
//         print("Correct");
//         // print(response.body);
//         jsonResponse = json.decode(response.body.toString());
//         print(jsonResponse);

//         AllPathLabTestModel dataModel = allPathLabTestModelFromJson(response.body);
//         print(dataModel.partner.length);
//         for (final item in dataModel.partner) {
//         print(item.partnerName);
 
        
//         }

//         List<Partner> arrData = dataModel.partner; // this "partner" is actual json array of data[]
//         return arrData;
//       } else {
//         print("Wrong URL");
//         throw Exception("Faild to fetch");
//       }
    
//   }


// //==========================================================================================================================================================================



//   Future<List<Datum>> GetTestByLab() async {
//     var jsonResponse;
  
//       var response = await http.post(Uri.parse("http://medbo.digitalicon.in/api/medboapi/GetTestByLab"),
//           body: ({
//             "EncId": encLabId
//             //"EncId": 'I3uXyzcuDZf21SSe5fHnSQ=='
//           }));
//       if (response.statusCode == 200) {
//         print("Correct");
//         // print(response.body);
//         jsonResponse = json.decode(response.body.toString());
//         print(jsonResponse);

//         DependentDropDownModel dataModel = dependentDropDownModelFromJson(response.body);
//         print(dataModel.data.length);
//         for (final item in dataModel.data) 
//         print(item.testName);
//        // print(item.testId);

//         List<Datum> arrData = dataModel.data; // this "partner" is actual json array of data[]
//         return arrData;
//       } else {
//         print("Wrong URL");
//         throw Exception("Faild to fetch");
//       }
    
//   }





// }





import 'dart:convert';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medbo/Animation/showupAnimation.dart';
import 'package:medbo/Booking/PathologicalMultipleBooking/testModel.dart';
import 'AllPathLabTestModel.dart';
import 'GetTestFeeModel.dart';


class GetTestFeeMap {
String? encPartnerId;
String? encTestId;
int? fee;
int? discountedFee;
int? bookingFee;

GetTestFeeMap(
  {this.encPartnerId,
  this.encTestId,
  this.fee,
  this.discountedFee,
  this.bookingFee});

GetTestFeeMap.fromJson(Map<String, dynamic> json) {
  encPartnerId = json['EncPartnerId'];
  encTestId = json['EncTestId'];
  //fee = json['Fee'];
  fee = int.parse(json['Fee']);
 // discountedFee = json['DiscountedFee'];
 discountedFee = int.parse(json['DiscountedFee']);
  //bookingFee = json['BookingFee'];
  bookingFee = int.parse(json['BookingFee']);
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['EncPartnerId'] = this.encPartnerId;
  data['EncTestId'] = this.encTestId;
  data['Fee'] = this.fee;
  data['DiscountedFee'] = this.discountedFee;
  data['BookingFee'] = this.bookingFee;
  return data;
 }
}



class MultipleTestBooking extends StatefulWidget {
  //const MultipleTestBooking({required Key key}) : super(key: key);

  @override
  _MultipleTestBookingState createState() => _MultipleTestBookingState();
}

class _MultipleTestBookingState extends State<MultipleTestBooking> {
  int delayAmount = 500;

 
  List<GetTestFeeMap> reponseArray =[];   // Storing API response || later showing test fee in table format
   int feeSum =0;
  int discountSum =0;
  int bookingSum =0 ;

  GetTestFeeMap? getTestFeeObj;

   Partner? _selectedLab;
   Datum? _selectedTest;
   Future? getAllPathLabResults;
   Future? getTestByLabResult;

  String encLabId = '';
  String encTestId = '';
  String testName ='';

  void initState() {
    super.initState();
    getAllPathLabResults = allPathLab();
    getTestByLabResult = getTestByLab();
  }

  String _selectedDate = DateTime.now().toString();
//============================================================================All Lab list API=============================================================================================
  Future<List<Partner>> allPathLab() async {
      var jsonResponse;
      var response = await http.post(Uri.parse("http://medbo.digitalicon.in/api/medboapi/AllPathLab"),
          body: ({  }));
      if (response.statusCode == 200) {
        print("Correct");
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);

        AllPathLabTestModel dataModel = allPathLabTestModelFromJson(response.body);
        print(dataModel.partner.length);
        for (final item in dataModel.partner) {
        print("This are the hte LAB name :${item.partnerName}");
        }

        List<Partner> arrData = dataModel.partner; // this "partner" is actual json array of data[]
        return arrData;
      } else {
        print("Wrong URL");
        throw Exception("Faild to fetch");
      }
  }
//============================================================== Dependent Test dropdown list Api =======================================================================================

  Future<List<Datum>> getTestByLab() async {
    print("This is the LabId :$encLabId");
    print("This is the EncTestId :$encTestId");
    _selectedTest = null as Datum;
    var response = await http.post(Uri.parse("http://medbo.digitalicon.in/api/medboapi/GetTestByLab"),
        body: ({
          "EncId": encLabId
          }));

    if (response.statusCode == 200) {
      final dataModel = dataModelFromJson(response.body);
      print(dataModel.data.length);
      for (final item in dataModel.data) {
        print("This are hte test names :${item.testName}");
        print("This are hte test EncTestId :${item.encTestId}");
      }
      

      List<Datum> arrData = dataModel.data;
      return arrData;
    }

    return [];
  }
//=====================================================================Get Test Fee Api===================================================================================================
   Future<void> GetTestFee() async {
    var jsonResponse;
    if (encTestId.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://medbo.digitalicon.in/api/medboapi/GetTestFee"),
          body: ({
            'EncPartnerId': encLabId,
            'EncTestId': encTestId,

          }));
      if (response.statusCode == 200) {
        print("Correct");
        print(response.body);
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
        getTestFeeObj=GetTestFeeMap.fromJson(jsonResponse);
        setState(() {
          reponseArray.add(getTestFeeObj!); // Adding data to my Arraylist
          feeSum=0;
          discountSum=0;
          bookingSum=0;
          for(GetTestFeeMap elem in reponseArray){
            
                  feeSum += elem.fee! ;
                  discountSum += elem.discountedFee! ; // Doing calculation here
                  bookingSum += elem.bookingFee! ;
                }
                print(feeSum);
                print(discountSum);
                print(bookingSum);
        });

      } else {
        throw Exception("Faild to fetch");
      }
    } else {
      throw Exception("Faild to fetch");
    }
    //throw Exception("Faild to fetch");
    //return GetTestFee();
  }

//=====================================================================================================================================================================================
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidth / 100);
    var blockSizeVertical = (screenHeight / 100);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShowUp(
                     delay: delayAmount+400,
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
                ),
                ShowUp(
                  delay: delayAmount+450,
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    padding: EdgeInsets.only(left: 0, right: 150),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.all(Radius.circular(12)),
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
                        lastDate: DateTime.now().add(Duration(days: 30)),
                        // This will add one year from current date
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
                ),
        
        //=========================================================== INITIAL drop down======================================================================================
        
                ShowUp(
                  delay: delayAmount+500,
                  child: ListTile(
                    title: Text(
                      "Select Pathological Lab",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: blockSizeHorizontal * 4.0,
                        fontFamily: 'Poppins',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
        
                ShowUp(
                  delay: delayAmount+400,
                  child: Container(
                    child: FutureBuilder<List<Partner>>(
                      future: getAllPathLabResults as Future<List<Partner>>,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text("Somthing went wrong");
                        }
                        
                        if (snapshot.hasData) {
                          List<Partner> data =
                              snapshot.hasData ? snapshot.data : [];
                          return Padding(
                            padding: const EdgeInsets.only(left:20.0, right: 150),
                            child: DropdownButton<Partner>(
                              value: _selectedLab,
                              hint: Text("Select Lab"),
                              //underline: SizedBox(),
                              isExpanded: true,
                              items: data
                                  .map((Partner data) => DropdownMenuItem<Partner>(
                                        child: Text("${data.partnerName}"),
                                        value: data,
                                      ))
                                  .toList()
                                  .cast<DropdownMenuItem<Partner>>(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedLab = value!;
                        
                                  encLabId = value.encPartnerId;
                                  getTestByLabResult = getTestByLab();
                                });
                                //GetTestByLab(value!.encPartnerId); // passing encid to my next API function
                                // GetTestByLab();
                              },
                            ),
                          );
                        }
                        return Text("Waiting for Internet Connection");
                      },
                    ),
                  ),
                ),
        
        //=========================================================== Dependent drop down===============================================================================================
        
                ShowUp(
                  delay: delayAmount+600,
                  child: ListTile(
                    title: Text(
                      "Test Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: blockSizeHorizontal * 4.0,
                        fontFamily: 'Poppins',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
        
                ShowUp(
                  delay: delayAmount+800,
                  child: Container(
                    child: FutureBuilder<List<Datum>>(
                      future: getTestByLabResult as Future<List<Datum>>,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text("Something wrong");
                        }
                        
                        if (snapshot.hasData) {
                          List<Datum> data = snapshot.hasData ? snapshot.data : [];
                        
                          return Padding(
                            padding: const EdgeInsets.only(left:20.0, right: 150),
                            child: DropdownButton<Datum>(
                                value: _selectedTest,
                                hint: Text(""),
                                //underline: SizedBox(),
                                isExpanded: true,
                                items: data
                                    .map((Datum data) => DropdownMenuItem<Datum>(
                                          child: Text("${data.testName}"),
                                          value: data,
                                        ))
                                    .toList()
                                    .cast<DropdownMenuItem<Datum>>(),
                                onChanged: (value) {
                                  print("This is the TestName : ${value!.testName}");
                                  print("This is the EncTestId : ${value.testId}");
                                  setState(() {
                                    encTestId = value.testId;
                                     testName = value.testName;
                                    _selectedTest = value;
                                  });
                                  //GetTestByLab(value!.encPartnerId); // passing encid to my next API function
                                }),
                          );
                        }
                        return Text("Waiting for Internet Connection");
                      },
                    ),
                  ),
                ),
        
                ShowUp(
                   delay: delayAmount+900,
                  child: OutlinedButton(
                    onPressed: (){
                      setState(() {
                         //GetTestFee();
                      });
                          GetTestFee();
                    }, 
                    child:Text("Add")),
                ),
        
               
          
               
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: DataTable(
                //     columnSpacing: 13.0,
                //     columns: <DataColumn>[
                //       //DataColumn(label: Text("encPartnerId")),
                //       //DataColumn(label: Text("encTestId")),
                //       DataColumn(label: Text("TestName")),
                //       DataColumn(label: Text("Fee")),
                //       DataColumn(label: Text("Discounted Fee")),
                //       DataColumn(label: Text("Booking Fee")),
                //     ],
                //    rows: <DataRow>[
                //     DataRow(
                //        cells: <DataCell>[
                //       // DataCell(Text(user?.encPartnerId ?? 'encPartnerId')),
                //       // DataCell(Text(user?.encTestId ?? 'encPartnerId')),
                //       DataCell(Container(child: Text(testName?? '',overflow: TextOverflow.ellipsis))),
                //       DataCell(Text(getTestFeeObj?.fee ?? '')),
                //       DataCell(Text(getTestFeeObj?.discountedFee ?? '')),
                //       DataCell(Text(getTestFeeObj?.bookingFee ?? '')),
                //      ],
                //     )
                //    ]
                //    ),
                // ),
        
                ShowUp(
                  delay: delayAmount+1000,
                  child: DataTable(
                     columnSpacing: 13.0,
                      columns: <DataColumn>[
                        //DataColumn(label: Text("encPartnerId")),
                        //DataColumn(label: Text("encTestId")),
                       // DataColumn(label: Text("TestName")),
                        DataColumn(label: Text("Fee")),
                        DataColumn(label: Text("Discounted Fee")),
                        DataColumn(label: Text("Booking Fee")),
                      ],
                      
                       rows:reponseArray.map((testRowData){
                        return DataRow(
                          cells: [
                            //DataCell(Text(testName)),
                            DataCell(Text (testRowData.fee!.toString() )),
                            DataCell(Text(testRowData.discountedFee !.toString() )),
                            DataCell(Text(testRowData.bookingFee!.toString()  ))
                          ]
                        );
                      }).toList()
                  ),
                ),



                ShowUp(
                  delay: delayAmount+ 1050,
                  child: Container(
                    child: 
                    Row(
                      children: [
                        Text("Total Fee: ${feeSum}\nTotal Discounted Fee:  ${discountSum}\nTotal Booking Fee:  ${bookingSum}" ),
                        //  Text(discountSum ),
                        //   Text(bookingSum ),
                      ],
                    ),
                  ),
                )
   
        
              ],
            ),
          ),
        ),
      ),
    );
  }



}

