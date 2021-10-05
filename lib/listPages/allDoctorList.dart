import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medbo/models/DocRefactor/AllDocRefactorModel.dart';
import 'package:medbo/models/allDoctorsModel.dart';
import 'package:medbo/onTapScreens/Doc_Details_Page/DocDetailsRefactorPage.dart';
import 'package:medbo/onTapScreens/doctorDetails.dart';
import 'package:medbo/parsing/allDoctors.dart';
import 'package:http/http.dart' as http;

import '../screen_helper/clip_path.dart';

class DoctorServices extends StatefulWidget {
  @override
  _DoctorServicesState createState() => _DoctorServicesState();
}

class _DoctorServicesState extends State<DoctorServices> {
  // late List<Datum> _datum = [];
  // List<Datum> finalDatum = [];
  // // List<Datum> finalDatum=[];

  // late bool _loading = true;
  // AllDoctorsList doctorList = AllDoctorsList();
  // Future<void> getDocs() async {
  //   finalDatum = await doctorList.getDocs();
  //   setState(() {
  //     _datum = finalDatum;
  //   });
  //   // print(_datum[0].doctorId);
  //   // print(_datum.length);
  // }

  // void initState() {
  //   super.initState();
  //   getDocs();
  //   // print(_datum[0].doctorId);
  //   // _initUser();
  //   if (_datum != null) {
  //     setState(() {
  //       _loading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidth / 100);
    var blockSizeVertical = (screenHeight / 100);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topCenter,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor
              ],
            ),
          ),
        ),
        title: Text(
          'DOCTORS',
          style: TextStyle(
            fontFamily: 'Roboto_Condensed',
          ),
        ),
      ),
      // drawer: SideDrawer,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.lightBlue[50],
          child: Stack(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 400,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.center,
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).accentColor
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  //_searchBar(),

                  // Expanded(
                  //   child: ListView.separated(
                  //     padding: EdgeInsets.all(15),
                  //     scrollDirection: Axis.vertical,
                  //     itemCount: _datum== null ? 0 : _datum.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //      return _listItem(index);
                  //     },
                  //     separatorBuilder: (BuildContext context, int index) =>
                  //         const Divider(
                  //       color: Colors.transparent,
                  //     ),
                  //   ),
                  // ),

                  Container(
                    height: screenHeight,
                    //color: Colors.blueAccent,
                    child: FutureBuilder(
                      future: AllDocRefacApi(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.cyanAccent,
                          ));
                        }
                        if (snapshot.hasError) {
                          return Text("Waiting for internet Connection...");
                        }

                        if (snapshot.hasData) {
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) =>
                                InkWell(
                              splashColor: Colors.green,
                              onTap: () {
                                //Navigator.push(context,MaterialPageRoute(builder: (context) =>DoctorDetails(encId:snapshot.data[index].encDoctorId)));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DocDetailsRefactorPage(snapshot
                                                .data[index].encDoctorId)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: blockSizeHorizontal * 40,
                                margin: EdgeInsets.all(10),
                                child: Stack(children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          //====================images
                                          padding: const EdgeInsets.all(5.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                            child: Image(
                                              image: NetworkImage(
                                                snapshot
                                                    .data[index].doctorImage,
                                              ),
                                              fit: BoxFit.cover,
                                              height: blockSizeVertical * 10,
                                              width: blockSizeHorizontal * 20,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height: blockSizeVertical * 0.5),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${snapshot.data[index].doctorName}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: blockSizeHorizontal * 3.5,
                                              fontFamily: 'Poppins',
                                              color:
                                                  Theme.of(context).primaryColor,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                            height: blockSizeVertical * 0.8),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Specialisation : ${snapshot.data[index].specialisation}', //put email
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                // fontWeight: FontWeight.bold,
                                                fontSize:
                                                    blockSizeHorizontal * 2.5,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ]),
                                  // Positioned(
                                  //   bottom: 5,
                                  //   left: 2,
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.only(
                                  //         left: 15.0, bottom: 5),
                                  //     child: InkWell(
                                  //       onTap: () {
                                  //          //Navigator.push(context,MaterialPageRoute(builder: (context) =>DoctorDetails(encId:snapshot.data[index].encDoctorId)));
                                  //         Navigator.push(context,MaterialPageRoute(builder: (context) =>DocDetailsRefactorPage(snapshot.data[index].encDoctorId)));
                                  //       },
                                  //       child: Container(
                                  //         alignment: Alignment.center,
                                  //         height: blockSizeVertical * 5,
                                  //         width: blockSizeHorizontal * 30,
                                  //         decoration: BoxDecoration(
                                  //           shape: BoxShape.rectangle,
                                  //           borderRadius:
                                  //               BorderRadius.circular(10),
                                  //           gradient: LinearGradient(
                                  //             begin: Alignment.topLeft,
                                  //             end: Alignment.topRight,
                                  //             colors: [
                                  //               Theme.of(context).primaryColor,
                                  //               Theme.of(context).accentColor
                                  //             ],
                                  //           ),
                                  //         ),
                                  //         child: Text(
                                  //           'Show Details',
                                  //           style: TextStyle(
                                  //             color: Colors.white,
                                  //             fontSize: blockSizeHorizontal * 2.7,
                                  //             fontWeight: FontWeight.bold,
                                  //             fontFamily: 'Poppins',
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ]),
                              ),
                            ),
                          );
                        }
                        return Text("Error while calling");
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // _searchBar() {
  //   return Container(
  //     margin: EdgeInsets.all(10),
  //     height: 60,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     child: Padding(
  //       padding: EdgeInsets.all(10),
  //       child: TextField(
  //         style: TextStyle(color: Theme.of(context).primaryColor),
  //         decoration: InputDecoration(
  //             icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
  //             hintText: 'type doctor name',
  //             hintStyle: Theme.of(context).textTheme.caption!.copyWith(
  //                   fontSize: 15,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.grey,
  //                 )),
  //         onChanged: (text) {
  //           text = text.toLowerCase();
  //           setState(() {
  //             _datum = finalDatum.where((element) {
  //               // if (searchText= element.specialisation) {
  //               var searchText = element.doctorName.toLowerCase();
  //               // } else {
  //               //   var searchText = ;
  //               // }
  //               return searchText.contains(text);
  //             }).toList();
  //           });
  //         },
  //       ),
  //     ),
  //   );
  // }

  // _listItem(index) {
  //   return InkWell(
  //     onTap: () {
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) =>
  //                   DoctorDetails(encId: _datum[index].encDoctorId)));
  //     },
  //     child: Container(
  //       // color: Colors.green,
  //       height: 120,
  //       child: Row(
  //         children: [
  //           Stack(children: [
  //             Container(
  //               // padding: EdgeInsets.only(top: 5,bottom: 5),
  //               height: 100,
  //               width: 100,
  //               // color: Colors.grey[800],
  //               decoration: BoxDecoration(
  //                 color: Colors.lightBlue[50],
  //                 shape: BoxShape.rectangle,
  //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //               ),
  //             ),
  //             Container(
  //               // margin: EdgeInsets.all(10),
  //               padding: EdgeInsets.only(top: 2, bottom: 2),
  //               height: 100,
  //               width: 100,
  //               // margin: EdgeInsets.all(10),
  //               decoration: BoxDecoration(
  //                 shape: BoxShape.rectangle,
  //               ),
  //               child: Image.network(
  //                 _datum[index].doctorImage,
  //                 fit: BoxFit.contain,
  //               ),
  //             ),
  //           ]),
  //           Expanded(
  //             child: Container(
  //               height: 100,
  //               // width: 300,
  //               margin: EdgeInsets.only(
  //                   left: 15.0, top: 0.0, right: 0.0, bottom: 0.0),
  //               // color: Colors.blue,
  //               decoration: BoxDecoration(
  //                 shape: BoxShape.rectangle,
  //                 borderRadius: BorderRadius.circular(15),
  //                 gradient: LinearGradient(
  //                   begin: Alignment.topLeft,
  //                   end: Alignment.center,
  //                   colors: [
  //                     Theme.of(context).primaryColor,
  //                     Theme.of(context).accentColor
  //                   ],
  //                 ),
  //               ),
  //               child: Container(
  //                 padding: EdgeInsets.all(10),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       '${_datum[index].doctorName}',
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 18,
  //                         color: Colors.white,
  //                         fontFamily: 'Roboto_Condensed',
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: EdgeInsets.only(top: 5),
  //                       // padding: EdgeInsets.symmetric(vertical: 3),
  //                       child: Text(
  //                         '${_datum[index].qualification}',
  //                         style: TextStyle(
  //                           // fontWeight: FontWeight.bold,
  //                           fontSize: 14,
  //                           color: Colors.white,
  //                           fontFamily: 'Roboto_Condensed',
  //                         ),
  //                       ),
  //                     ),
  //                     Container(
  //                       // color: Colors.green,
  //                       // height: MediaQuery.of(context).size.height,
  //                       padding: EdgeInsets.symmetric(vertical: 5),
  //                       width: 220,
  //                       child: Text(
  //                         (() {
  //                           var str = _datum[index].specialisation.toString();
  //                           if (str.length > 3) {
  //                             return '${_datum[index].specialisation.toString().substring(0, 7)} ' +
  //                                 '...';
  //                           }

  //                           return "${_datum[index].specialisation}";
  //                         })(),
  //                         style: TextStyle(
  //                             fontFamily: 'Roboto_Condensed',
  //                             // fontWeight: FontWeight.bold,
  //                             fontSize: 12,
  //                             color: Colors.white),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Future<List<DocInfoList>> AllDocRefacApi() async {
    var jsonResponse;

    var response = await http
        .post(Uri.parse("https://medbo.in/api/medboapi/alldoctor"), body: ({}));
    if (response.statusCode == 200) {
      print("Correct");
      print(response.body);
      jsonResponse = json.decode(response.body.toString());
      print(jsonResponse);
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>AfterSearchPage(rresponse: SearchApiResponse.fromJson(jsonResponse))));
      AllDocRefactorModel dataModel =
          allDocRefactorModelFromJson(response.body); //Model file
      print(dataModel.data.length);
      for (final item in dataModel.data) print(item.doctorName);

      List<DocInfoList> arrData =
          dataModel.data; // this data is actuall json array of data[]
      return arrData;
    } else {
      print("Wrong Url");
      print(response.body);
      throw Exception("Faild to fetch");
    }
  }
}
