import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:medbo/Booking/DieticianBooking.dart';
import 'package:medbo/models/DietDetailsModel.dart';

class DietDetailsRefPage extends StatefulWidget {
  //const DietDetailsRefPage({ Key? key }) : super(key: key);
  var encDietcianId;
  DietDetailsRefPage(this.encDietcianId);

  @override
  _DietDetailsRefPageState createState() =>
      _DietDetailsRefPageState(this.encDietcianId);
}

class _DietDetailsRefPageState extends State<DietDetailsRefPage> {
  var encDietcianIdRef;
  _DietDetailsRefPageState(this.encDietcianIdRef);

  final _colors = [
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidth / 100);
    var blockSizeVertical = (screenHeight / 100);
    return Scaffold(
      backgroundColor: Color(0xFFd7e2f5),
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
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Container(
              // decoration: BoxDecoration(
              //   boxShadow: [
              //     BoxShadow(
              //       offset: Offset(0, 13),
              //       blurRadius: 25,
              //       //color: Color(0xFF5666C2).withOpacity(0.17),
              //       color: Colors.lightBlue.withOpacity(0.17),
              //     ),
              //   ],
              // ),
              child: FutureBuilder(
                future: dietcianDetailsApi(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if (snapshot.connectionState != ConnectionState.done) {
                  return Center(child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_E3llVz.json'));
                  //CircularProgressIndicator());
                }
      
                if(snapshot.hasError){
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
      
      
                if(snapshot.hasData){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
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
                                  child: Image.network(snapshot.data.data.image,
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
                          
                          Flexible(// important flex for image and name whole container=====================================================
                        fit: FlexFit.tight,
                            child: Container(
                              width: MediaQuery.of(context).size.width - 12,
                              height: blockSizeVertical * 23,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      snapshot.data.data.dietName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: blockSizeHorizontal * 5,
                                        fontFamily: 'Poppins',
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      maxLines: 3,
                                    ),
                                    // Flexible(
                                    //   fit: FlexFit.tight,
                                    //   child: Text(
                                    //     snapshot.data.partnerData.partnerName,
                                    //     style: TextStyle(
                                    //         fontSize: blockSizeVertical * 2,
                                    //         color: Colors.grey,
                                    //         fontFamily: 'Poppins'),
                                    //     maxLines: 8,
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: blockSizeVertical * 5,
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          fit:FlexFit.loose,
                                          child: Container(
                                            margin: EdgeInsets.only(right: 16),
                                            child: Container(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                  //color: Color(0xFFffecdd),
                                                  color: Theme.of(context).primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(15)),
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.mail,
                                                ),
                                                iconSize: 20,
                                                //color: Color(0xFFfbb97c),
                                                color: Colors.white,
                                                splashColor: Colors.green,
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        ),
                                        //===============================================
                                         Flexible(
                                          fit:FlexFit.loose,
                                          child: Container(
                                            margin: EdgeInsets.only(right: 16),
                                            child: Container(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                  //color: Color(0xFFffecdd),
                                                  color: Theme.of(context).primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(15)),
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.call,
                                                ),
                                                iconSize: 20,
                                                //color: Color(0xffF69383),
                                                color: Colors.white,
                                                splashColor: Colors.green,
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        ), //=========================================
                          
                                         Flexible(
                                          fit:FlexFit.loose,
                                          child: Container(
                                            margin: EdgeInsets.only(right: 16),
                                            child: Container(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                  //color: Color(0xFFffecdd),
                                                  color: Theme.of(context).primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(15)),
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.video_call,
                                                ),
                                                iconSize: 20,
                                                //color: Color(0xFFfbb97c),
                                                color: Colors.white,
                                                splashColor: Colors.green,
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          
                            
      
      
      
      
      
      
      
      
      
      
      
                          ],
                        )
                      ),
      
                      Container(
                        child: ListView.builder(
                           physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.partnerData.length,
                          itemBuilder: (BuildContext context, int index) =>
      
                          Column(
                            children: [
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
                              child: Container(
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
                                            // color: Theme.of(context).primaryColor,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: blockSizeVertical * 2.5),
                                      ),
                                    ),
      
                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: Text(
                                        'Location: \t${snapshot.data.partnerData[index].partnerAddress}📍',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            //color: Theme.of(context).primaryColor,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: blockSizeVertical * 2),
                                      ),
                                    ),
      
                                    SizedBox(
                                      height: 10,
                                    ),
      
                                    for (var dayInfo in snapshot
                                        .data.partnerData[index].dayList)
                                      Container(
                                        //color: Colors.blue,
                                          child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30.0,
                                            bottom: 30,
                                            left: 1,
                                            right: 1),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Flexible(
                                              fit: FlexFit.tight,
                                              child: Container(
                                                //color: Colors.amberAccent,
                                                child: Text(
                                                  '${dayInfo.dayName}\n${dayInfo.timeFrom} - ${dayInfo.timeTo} ',
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w700,
                                                      fontSize:
                                                          blockSizeVertical * 1.5),
                                                ),
                                              ),
                                            ),
      
      
      
      
      
      
      
      
      
      
      
      
                                            SizedBox(
                                              width: 1,
                                            ),
                                            Flexible(
                                               fit: FlexFit.tight,
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: blockSizeVertical * 5,
                                                width: blockSizeHorizontal * 17,
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
                                                              color:
                                                                  Color(0xFFc23b5d),
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontSize:
                                                                  blockSizeVertical *
                                                                      1.3),
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
                                                              color:
                                                                  Color(0xFFc23b5d),
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontSize:
                                                                  blockSizeVertical *
                                                                      1.3),
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
                                                height: blockSizeVertical * 5,
                                                width: blockSizeHorizontal * 17,
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
                                                          'Discount',
                                                          style: TextStyle(
                                                              fontFamily: 'Poppins',
                                                              color:
                                                                  Color(0xffF69383),
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontSize:
                                                                  blockSizeVertical *
                                                                      1.3),
                                                        ),
                                                      ),
                                                    ),
      
                                                      Flexible(
                                                      fit: FlexFit.tight,
                                                      child: Container(
                                                        child: Text(
                                                          'Fee',
                                                          style: TextStyle(
                                                              fontFamily: 'Poppins',
                                                              color:
                                                                  Color(0xffF69383),
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontSize:
                                                                  blockSizeVertical *
                                                                      1.3),
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
                                                              color:
                                                                  Color(0xffF69383),
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontSize:
                                                                  blockSizeVertical *
                                                                      1.3),
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
                                                height: blockSizeVertical * 5,
                                                width: blockSizeHorizontal * 17,
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
                                                              color:
                                                                  Color(0xFF54a98c),
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontSize:
                                                                  blockSizeVertical *
                                                                      1.3),
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
                                                              color:
                                                                  Color(0xFF54a98c),
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontSize:
                                                                  blockSizeVertical *
                                                                      1.3),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
      
                                    
      
                                    Center(
                                        child: ElevatedButton(
                                            style: TextButton.styleFrom(
                                              //backgroundColor: Color(0xFF6CD8D1),
                                              elevation: 0,
                                              backgroundColor:  Theme.of(context).primaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                // side: BorderSide(color: Color(0xFF6CD8D1)),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(context,MaterialPageRoute(
                                                builder: (context) =>
                                                DieticianBookingPage( 
                                                  snapshot.data.partnerData[index], 
                                                  snapshot.data.data.dietName, 
                                                  snapshot.data.data.encDietId, )));
                                            },
                                            child: Container(
                                                width: blockSizeHorizontal * 70,
                                                height: blockSizeVertical * 7,
                                                child: Center(
                                                    child: Text(
                                                  "Book Now",
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white),
                                                )))))
                                  ],
                                ),
                              ),
                            ),
                            ],
                          )
      
                        ),
                      )
                    ],
                  );
                }
      
      
                return Container();
                },
              ),
            ),
          ],
        )),
      ),
    );
  }

  Future<DietDetailsModel> dietcianDetailsApi() async {
    var jsonResponse;

    var response =
        await http.post(Uri.parse("https://medbo.in/api/medboapi/DietDetails"),
            body: ({
              'EncId': encDietcianIdRef,
            }));
    if (response.statusCode == 200) {
      print("Correct");
      print(response.body);
      jsonResponse = json.decode(response.body.toString());
      print(jsonResponse);
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>AfterSearchPage(rresponse: SearchApiResponse.fromJson(jsonResponse))));
      DietDetailsModel dataModel = dietDetailsModelFromJson(response.body);
      return dataModel;
    } else {
      print("Wrong Url");
      print(response.body);
      throw Exception("Faild to fetch");
    }
    //return AllDietician();
  }
}
