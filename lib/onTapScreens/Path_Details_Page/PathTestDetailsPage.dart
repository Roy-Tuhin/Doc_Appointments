import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:medbo/Booking/PathalogicalBookingPage.dart';
import 'package:medbo/models/PathRefacModel/PathTestDetailsRefactorModel.dart';
import 'package:medbo/screens2.dart/home2.dart';

class PathTestDetailsPageRef extends StatefulWidget {
  var encPathTestId;
  PathTestDetailsPageRef(this.encPathTestId);

  @override
  _PathTestDetailsPageRefState createState() =>
      _PathTestDetailsPageRefState(this.encPathTestId);
}

class _PathTestDetailsPageRefState extends State<PathTestDetailsPageRef> {
  var encPathTestIdRef;
  _PathTestDetailsPageRefState(this.encPathTestIdRef);
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
            future: PathTestDetailsRefacApi(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_E3llVz.json'));
                //CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Container(
                    child: Stack(children: [
                      Image.asset(
                        "assets/images/10_Connection Lost.png",
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.15,
                        left: MediaQuery.of(context).size.width * 0.3,
                        right: MediaQuery.of(context).size.width * 0.3,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 13),
                                blurRadius: 25,
                                color: Color(0xFF5666C2).withOpacity(0.17),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pushNamed('/');
                            },
                            style: TextButton.styleFrom(
                              // backgroundColor: Color(0xFF6CD8D1),
                              elevation: 0,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                // side: BorderSide(color: Color(0xFF6CD8D1)),
                              ),
                            ),
                            child: Text(
                              "Try Again",
                              style: TextStyle(
                                  color: Colors.black, fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                );
              }

              if (snapshot.hasData) {
                //for (var partnerInfo in snapshot.data.partnerData)
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //                     color: Color(0xFFffecdd),
                        //                     borderRadius:
                        //                         BorderRadius.circular(15)),
                        //     child: ClipRRect(
                        //        borderRadius: BorderRadius.circular(34.0),
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Image.network(snapshot.data.doctorData.doctorImage,
                        //         fit: BoxFit.cover,
                        //             height: blockSizeVertical * 20,
                        //             width: blockSizeHorizontal*30
                        //             ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Container(
                          width: MediaQuery.of(context).size.width - 12,
                          height: blockSizeVertical * 25,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  snapshot.data.testData.testName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: blockSizeHorizontal * 5,
                                    fontFamily: 'Poppins',
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  maxLines: 3,
                                ),
                                // Text(
                                //   snapshot.data.testData.testName,
                                //   style:
                                //       TextStyle(fontSize: 19, color: Colors.grey),maxLines: 2,
                                // ),

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
                                    ), //=========================================

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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
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
                                    snapshot
                                        .data.partnerData[index].partnerName,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: blockSizeVertical * 2),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot
                                        .data.partnerData[index].partnerAddress,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: blockSizeVertical * 2),
                                  ),
                                ),
                                //  Text(snapshot.data.partnerData[index].dayList[0].dayName),

                                SizedBox(
                                  height: 10,
                                ),

                                // for (var dayInfo
                                //     in snapshot.data.partnerData[index].dayList)
                                // Container(
                                //     child: Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: Row(
                                //     children: [
                                //       Text(
                                //         dayInfo.dayName,
                                //         style: TextStyle(
                                //             fontFamily: 'Poppins',
                                //             color: Colors.white,
                                //             fontWeight: FontWeight.w700,
                                //             fontSize: blockSizeVertical * 2),
                                //       ),
                                //       SizedBox(width: 50,),
                                //       Text(
                                //         dayInfo.timeFrom,
                                //         style: TextStyle(
                                //             fontFamily: 'Poppins',
                                //             color: Colors.white,
                                //             fontWeight: FontWeight.w700,
                                //             fontSize: blockSizeVertical * 2),
                                //       ),
                                //       SizedBox(width: 10,),

                                //       Text(
                                //         dayInfo.timeTo,
                                //         style: TextStyle(
                                //             fontFamily: 'Poppins',
                                //             color: Colors.white,
                                //             fontWeight: FontWeight.w700,
                                //             fontSize: blockSizeVertical * 2),
                                //       ),
                                //     ],
                                //   ),
                                // )),

                                Center(
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: blockSizeVertical * 6,
                                            width: blockSizeHorizontal * 20,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFfdf4f7),
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  child: Container(
                                                    child: Text(
                                                      'Actual Fee',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color: Color(0xFFc23b5d),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize:
                                                              blockSizeVertical *
                                                                  1.5),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  child: Container(
                                                    child: Text(
                                                      '₹ ${snapshot.data.partnerData[index].fee}',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color: Color(0xFFc23b5d),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize:
                                                              blockSizeVertical *
                                                                  1.5),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: blockSizeVertical * 6,
                                            width: blockSizeHorizontal * 20,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFfef6e5),
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  child: Container(
                                                    child: Text(
                                                      'Discount Fee',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color: Color(0xFFf6c53e),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize:
                                                              blockSizeVertical *
                                                                  1.5),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  child: Container(
                                                    child: Text(
                                                      '₹ ${snapshot.data.partnerData[index].discountedFee}',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color: Color(0xFFf6c53e),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize:
                                                              blockSizeVertical *
                                                                  1.5),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: blockSizeVertical * 6,
                                            width: blockSizeHorizontal * 20,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFecf8f4),
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  child: Container(
                                                    child: Text(
                                                      'Booking Fee',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color: Color(0xFF54a98c),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize:
                                                              blockSizeVertical *
                                                                  1.5),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  child: Container(
                                                    child: Text(
                                                      '₹ ${snapshot.data.partnerData[index].bookingFee}',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color: Color(0xFF54a98c),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize:
                                                              blockSizeVertical *
                                                                  1.5),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: blockSizeVertical * 10),

                                Center(
                                    child: ElevatedButton(
                                        style: TextButton.styleFrom(
                                          //backgroundColor: Color(0xFF6CD8D1),
                                          elevation: 0,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            // side: BorderSide(color: Color(0xFF6CD8D1)),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PathalogicalBookingPage(
                                                          snapshot
                                                              .data.testData,
                                                          snapshot.data
                                                                  .partnerData[
                                                              index])));
                                        },
                                        child: Container(
                                          width: blockSizeHorizontal*70,
                                          height: blockSizeVertical*7,
                                          child: Center(child: Text("Book Now", style: TextStyle(fontFamily: 'Poppins',color: Colors.black),)))))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              // return Text("Error while calling");
              return Container();
            },
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<PathTestDetailsRefactorModel> PathTestDetailsRefacApi() async {
    var jsonResponse;

    var response = await http.post(
        Uri.parse("https://medbo.in/api/medboapi/pathologicaltestdetails"),
        body: ({"EncId": encPathTestIdRef}));
    if (response.statusCode == 200) {
      print("Correct");
      print(response.body);
      jsonResponse = json.decode(response.body.toString());
      print(jsonResponse);

      PathTestDetailsRefactorModel dataModel =
          pathTestDetailsRefactorModelFromJson(response.body);
      return dataModel;
    } else {
      print("Wrong Url");
      print(response.body);
      throw Exception("Faild to fetch");
    }
    throw Exception("Faild to fetch");
  }
}
