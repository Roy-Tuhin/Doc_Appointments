import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medbo/Booking/DocBooking.dart';
import 'package:medbo/models/DocRefactor/DocDetailsRefactorModel.dart';
import 'package:http/http.dart' as http;

class DocDetailsRefactorPage extends StatefulWidget {
  var docEncId;
  DocDetailsRefactorPage(this.docEncId);

  @override
  _DocDetailsRefactorPageState createState() =>
      _DocDetailsRefactorPageState(this.docEncId);
}

class _DocDetailsRefactorPageState extends State<DocDetailsRefactorPage> {
  final _colors = [
    // Colors.blue.withOpacity(0.1),
    // Colors.red.withOpacity(0.1),
    // Colors.yellow.withOpacity(0.1),
    // Colors.green.withOpacity(0.1),

    Color(0xff6DC8F3).withOpacity(0.3),
    Color(0xffFFB157).withOpacity(0.3),
    Color(0xffFF5B95).withOpacity(0.3),
    Color(0xffD76EF5).withOpacity(0.3),
    Color(0xff42E695).withOpacity(0.3),

    // Color(0xff6DC8F3),
    // Color(0xffFFB157),
    // Color(0xffFF5B95),
    // Color(0xffD76EF5),
    // Color(0xff42E695),
  ];

  var docEncIdRef;
  _DocDetailsRefactorPageState(this.docEncIdRef);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidth / 100);
    var blockSizeVertical = (screenHeight / 100);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Details',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF02475E),
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          color: Color(0xFF02475E),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: blockSizeVertical * 100, //38
          child: FutureBuilder(
            future: DocDetailsApi(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text("Error...");
              }
      
              if (snapshot.hasData) {
                //for (var partnerInfo in snapshot.data.partnerData)
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                            color: Color(0xFFffecdd),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                            child: ClipRRect(
                               borderRadius: BorderRadius.circular(34.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(snapshot.data.doctorData.doctorImage,
                                fit: BoxFit.cover,
                                    height: blockSizeVertical * 20,
                                    width: blockSizeHorizontal*30
                                    ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 222,
                          height: blockSizeVertical * 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                snapshot.data.doctorData.doctorName,
                                style: TextStyle(fontSize: 32),maxLines: 1,
                              ),
                              Text(
                                snapshot.data.doctorData.specialisation,
                                style:
                                    TextStyle(fontSize: 19, color: Colors.grey),maxLines: 2,
                              ),
      
                              SizedBox(
                                height: 40,
                              ),
      
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 16),
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFffecdd),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.mail,
                                        ),
                                        iconSize: 20,
                                        color: Color(0xFFfbb97c),
                                        splashColor: Colors.green,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                  //===============================================
                                  Container(
                                    margin: EdgeInsets.only(right: 16),
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFffecdd),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.call,
                                        ),
                                        iconSize: 20,
                                        color: Color(0xffF69383),
                                        splashColor: Colors.green,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),//=========================================
      
                                  Container(
                                    margin: EdgeInsets.only(right: 16),
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFffecdd),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.video_call,
                                        ),
                                        iconSize: 20,
                                        color: Color(0xFFfbb97c),
                                        splashColor: Colors.green,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
      
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
      
                    // CircleAvatar(
                    // backgroundImage: NetworkImage(snapshot.data.doctorData.doctorImage),),
                    // Text(snapshot.data.doctorData.doctorName),
                    // Text(snapshot.data.doctorData.specialisation),
      
                    Expanded(
                      child: Container(
                        // decoration: BoxDecoration(
                        //   color: Colors.amberAccent,
                        //    borderRadius: BorderRadius.all(Radius.circular(24)),
                        // ),
                        child: ListView.builder(
                           physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                          itemCount: snapshot.data.partnerData.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                            margin: EdgeInsets.only(
                                top: 20, left: 5, right: 5, bottom: 5),
                            padding: EdgeInsets.only(
                                top: 20, left: 5, right: 5, bottom: 20),
                            decoration: BoxDecoration(
                                // color: Color(0xFF3E64FF),
                                //color: Colors.lightBlue[50],
                                color: _colors[index % _colors.length],
                                borderRadius: BorderRadius.all(Radius.circular(24)),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //for (var partnerInfo in snapshot.data.partnerData)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data.partnerData[index].partnerName,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: blockSizeVertical * 2),
                                  ),
                                ),
                                //  Text(snapshot.data.partnerData[index].dayList[0].dayName),
      
                                SizedBox(
                                  height: 10,
                                ),
      
                                for (var dayInfo
                                    in snapshot.data.partnerData[index].dayList)
                                  Container(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          dayInfo.dayName,
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: blockSizeVertical * 2),
                                        ),
                                        SizedBox(width: 50,),
                                        Text(
                                          dayInfo.timeFrom,
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: blockSizeVertical * 2),
                                        ),
                                        SizedBox(width: 10,),
      
                                        Text(
                                          dayInfo.timeTo,
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: blockSizeVertical * 2),
                                        ),
                                      ],
                                    ),
                                  )),

                                  Center(
                                    child: Container(
                                      child: Column(
                                        children: [
                                        Text( snapshot.data.partnerData[index].fee),
                                        Text( snapshot.data.partnerData[index].discountedFee),
                                        Text( snapshot.data.partnerData[index].bookingFee),

                                      ],),
                                    ),
                                  ),
      
                                Center(
                                    child: ElevatedButton(
                                        onPressed: () {
                                           Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              DocBooking(   snapshot.data.partnerData[index],  snapshot.data.doctorData,)));
                                        },
                                        child: Text("Book Appointment")))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
      
                // print(snapshot.data.partnerData);
      
                // for (var partnerInfo in snapshot.data.partnerData){
                //   print(partnerInfo.partnerName);
                // }
      
                // return Center(child: Text(snapshot.data.doctorData.doctorName));
      
                // return ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   physics: BouncingScrollPhysics(),
                //   shrinkWrap: true,
                //   //itemCount: snapshot.data.length,
                //   itemBuilder: (BuildContext context, int index) =>
                //       Container(
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     width: blockSizeHorizontal * 40,
                //     margin: EdgeInsets.all(10),
                //     child: Stack(children: [
                //       Column(
                //           crossAxisAlignment:
                //               CrossAxisAlignment.center,
                //           children: [
                //             Padding(
                //               //====================images
                //               padding: const EdgeInsets.all(5.0),
                //               // child: ClipRRect(
                //               //    borderRadius: BorderRadius.circular(14.0),
                //               //   child:
                //               //   Image(
                //               //     // image: NetworkImage(
                //               //     //   snapshot.data[index].image,
                //               //     // ),
                //               //     fit: BoxFit.cover,
                //               //     height: blockSizeVertical*18,
                //               //     width: blockSizeHorizontal*50,
                //               //   ),
                //               // ),
                //             ),
                //             SizedBox(height: blockSizeVertical * 0.5),
                //             Text(
                //               '${snapshot.data[index].dataModel.doctorData.partnerName}',
                //               style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: blockSizeHorizontal * 3.5,
                //                 fontFamily: 'Poppins',
                //                 color: Theme.of(context).primaryColor,
                //               ),
                //               textAlign: TextAlign.center,
                //             ),
                //             SizedBox(height: blockSizeVertical * 0.8),
                //             Container(
                //               padding: EdgeInsets.symmetric(
                //                   horizontal: 10),
                //               // color: Colors.green,
                //               child: Center(
                //                 child: Text(
                //                   'Test Names : ${snapshot.data[index].dataModel.doctorData.partnerName}', //put email
                //                   style: TextStyle(
                //                       fontFamily: 'Poppins',
                //                       // fontWeight: FontWeight.bold,
                //                       fontSize:
                //                           blockSizeHorizontal * 2.5,
                //                       color: Theme.of(context)
                //                           .primaryColor),
                //                   textAlign: TextAlign.center,
                //                   maxLines: 4,
                //                 ),
                //               ),
                //             ),
                //           ]),
                //       Positioned(
                //         bottom: 5,
                //         left: 2,
                //         child: Padding(
                //           padding: const EdgeInsets.only(
                //               left: 15.0, bottom: 5),
                //           child: InkWell(
                //             onTap: () {
                //               // Navigator.push(
                //               //     context,
                //               //     MaterialPageRoute(
                //               //         builder: (context) =>
                //               //             DietcianDetailsPage(
                //               //                 snapshot.data[index]
                //               //                     .encDietId,
                //               //                 snapshot.data[index]
                //               //                     .dietName)));
                //             },
                //             child: Container(
                //               alignment: Alignment.center,
                //               height: blockSizeVertical * 5,
                //               width: blockSizeHorizontal * 30,
                //               decoration: BoxDecoration(
                //                 shape: BoxShape.rectangle,
                //                 borderRadius:
                //                     BorderRadius.circular(10),
                //                 gradient: LinearGradient(
                //                   begin: Alignment.topLeft,
                //                   end: Alignment.topRight,
                //                   colors: [
                //                     Theme.of(context).primaryColor,
                //                     Theme.of(context).accentColor
                //                   ],
                //                 ),
                //               ),
                //               child: Text(
                //                 'Show Details',
                //                 style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: blockSizeHorizontal * 2.7,
                //                   fontWeight: FontWeight.bold,
                //                   fontFamily: 'Poppins',
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ]),
                //   ),
                // );
              }
              // return Text("Error while calling");
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Future<DocDetailsRefactorModel> DocDetailsApi() async {
    var jsonResponse;

    var response = await http.post(
        Uri.parse("https://medbo.in/api/medboapi/doctdetails"),
        body: ({"EncId": docEncIdRef}));
    if (response.statusCode == 200) {
      print("Correct");
      print(response.body);
      jsonResponse = json.decode(response.body.toString());
      print(jsonResponse);

      DocDetailsRefactorModel dataModel =
          docDetailsRefactorModelFromJson(response.body);
      return dataModel;
      // print(dataModel.partnerData.length);
      // for (final item in dataModel.partnerData){
      //  print(item.partnerName);
      //  print(item.fee);
      //  print(item.dayList);
      //  print(dataModel.doctorData);
      // }

      // List<PartnerData> arrData =
      //     dataModel.partnerData; // this data is actuall json array of data[]
      // return arrData;
    } else {
      print("Wrong Url");
      print(response.body);
      throw Exception("Faild to fetch");
    }
    throw Exception("Faild to fetch");
  }
}
