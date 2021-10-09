import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medbo/Booking/PathologicalMultipleBooking/MultipleTestBooking.dart';
import 'package:medbo/Booking/PathologicalMultipleBooking/SingleTestBooking.dart';
import 'package:medbo/models/PathRefacModel/AllPathTestModel.dart';

import 'package:medbo/models/pathTestDetailsModel.dart';
import 'package:medbo/onTapScreens/Path_Details_Page/PathTestDetailsPage.dart';
import 'package:medbo/onTapScreens/pathLabDetails.dart';

import '../screen_helper/clip_path.dart';
import 'package:http/http.dart' as http;

class PathologicalLabDetails extends StatefulWidget {
  const PathologicalLabDetails({Key? key}) : super(key: key);

  @override
  _PathologicalLabDetailsState createState() => _PathologicalLabDetailsState();
}

class _PathologicalLabDetailsState extends State<PathologicalLabDetails> {
  // late List<Datum> pathList = [];
  // List<Datum> finalPathList = [];
  // late bool _loadPathList = true;

  // PathTestList PList = PathTestList();
  // Future<void> getPathTest() async {
  //   finalPathList = await PList.getPathTest();
  //   setState(() {
  //     pathList = finalPathList;
  //   });
  //   // print(_datum[0].doctorId);
  //   // print(finalDatum.length);
  // }

  // void initState() {
  //   super.initState();
  //   getPathTest();
  //   // print(_datum[0].doctorId);
  //   // _initUser();
  //   if (pathList != null) {
  //     setState(() {
  //       _loadPathList = false;
  //     });
  //   }
  // }

  //==============================================================================
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
          'Pathological Lab',
          style: TextStyle(
            fontFamily: 'Roboto_Condensed',
          ),
        ),
      ),
//==================================================================================================

      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.lightBlue[50],
          child: Column(
            children: [
              // _searchBar(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PathologicalSingleTestBookingPage())); //=========== single Test
                  },
                  child: Text("Make your Own Test and Book")),
      
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MultipleTestBooking())); //=========== Pathological Multiple Test
                  },
                  child: Text("Book more than one Test")),
      
              // Expanded(
              //   child: ListView.separated(
              //     padding: EdgeInsets.all(15),
              //     scrollDirection: Axis.vertical,
              //     itemCount: pathList == null ? 0 : pathList.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       maxline:
              //       1;
              //       return _listItem(index);
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
                          future: AllPathTestRefacApi(),
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
                                                PathTestDetailsPageRef(snapshot
                                                    .data[index].encTestId)));
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
                                                // child: Image(
                                                //   image: NetworkImage(
                                                //     snapshot
                                                //         .data[index].doctorImage,
                                                //   ),
                                                //   fit: BoxFit.cover,
                                                //   height: blockSizeVertical * 10,
                                                //   width: blockSizeHorizontal * 20,
                                                // ),
                                              ),
                                            ),
                                            SizedBox(
                                                height: blockSizeVertical * 0.5),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                '${snapshot.data[index].testName}',
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
                                            // Padding(
                                            //   padding: const EdgeInsets.all(8.0),
                                            //   child: 
                                            //   // Text(
                                            //   //   'Test Name : ${snapshot.data[index].testName}', //put email
                                            //   //   style: TextStyle(
                                            //   //       fontFamily: 'Poppins',
                                            //   //       // fontWeight: FontWeight.bold,
                                            //   //       fontSize:
                                            //   //           blockSizeHorizontal * 2.5,
                                            //   //       color: Theme.of(context)
                                            //   //           .primaryColor),
                                            //   //   textAlign: TextAlign.center,
                                            //   //   maxLines: 2,
                                            //   // ),
                                            // ),
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
        ),
      ),
    );
  }










  
// _listItem(index) {
//   return InkWell(
//     onTap: () {
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   PathTestDetails(encId: pathList[index].encTestId)));
//     },
//     child: Container(
//       height: 80,
//       width: MediaQuery.of(context).size.width,
//       // margin: EdgeInsets.only(left:15.0,),
//       // color: Colors.blue,
//       decoration: BoxDecoration(
//         shape: BoxShape.rectangle,
//         borderRadius: BorderRadius.circular(15),
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.center,
//           colors: [
//             Theme.of(context).primaryColor,
//             Theme.of(context).accentColor
//           ],
//         ),
//       ),
//       child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 '${pathList[index].testName}',
//                 style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                     color: Colors.white),
//               ),
//             ),
//           ]),
//     ),
//   );
// }


//====================================================================================



  // _searchBar(){
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
  //             hintText: 'type test name',
  //             hintStyle: Theme.of(context).textTheme.caption!.copyWith(
  //               fontSize: 15,
  //               fontWeight: FontWeight.bold,
  //               color: Colors.grey,
  //             )
  //         ),
  //         onChanged: (text){
  //           text=text.toLowerCase();
  //           setState(() {
  //             pathList=finalPathList.where((element){
  //               var searchText=element.testName.toLowerCase();
  //               return searchText.contains(text);
  //             }).toList();
  //           });
  //         },

  //       ),
  //     ),
  //   );
  // }



          Future<List<PathTestListRefac>> AllPathTestRefacApi() async {
    var jsonResponse;

    var response = await http.post(
        Uri.parse("https://medbo.in/api/medboapi/allpathologicaltest"),
        body: ({
        }));
    if (response.statusCode == 200) {
      print("Correct");
      print(response.body);
      jsonResponse = json.decode(response.body.toString());
      print(jsonResponse);
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>AfterSearchPage(rresponse: SearchApiResponse.fromJson(jsonResponse))));
      AllPathTestModel dataModel = allPathTestModelFromJson(response.body); //Model file
      print(dataModel.data.length);
      for (final item in dataModel.data) print(item.testName);

      List<PathTestListRefac> arrData =
          dataModel.data; // this data is actuall json array of data[]
      //print(arrData[1].dietName);
      return arrData;
    } else {
      print("Wrong Url");
      print(response.body);
      throw Exception("Faild to fetch");
    }
  }




}
