import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medbo/models/DocRefactor/DocDetailsRefactorModel.dart';
import 'package:http/http.dart' as http;

class DocDetailsRefactorPage extends StatefulWidget {

var docEncId;
DocDetailsRefactorPage(this.docEncId);

  @override
  _DocDetailsRefactorPageState createState() => _DocDetailsRefactorPageState(this.docEncId);
}

class _DocDetailsRefactorPageState extends State<DocDetailsRefactorPage> {
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


      body: SingleChildScrollView(
        child: Container(
                    height: blockSizeVertical * 30, //38
                    //color: Colors.blueAccent,
                    child: FutureBuilder(
                      future: DocDetailsApi(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState !=ConnectionState.done) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Text("Error...");
                        }

                        if (snapshot.hasData) {

                          //for (var partnerInfo in snapshot.data.partnerData)
                          return Container(
                            child: Column(
                              children: [
                                CircleAvatar(
                                backgroundImage: NetworkImage(snapshot.data.doctorData.doctorImage),),
                                Text(snapshot.data.doctorData.doctorName),
                                Text(snapshot.data.doctorData.specialisation),

                                Expanded(
                                  child: ListView.builder(
                                    itemCount: snapshot.data.partnerData.length ,
                                     itemBuilder: (BuildContext context, int index)=>
                                     Card(
                                       child: Column(children: [
                                        //for (var partnerInfo in snapshot.data.partnerData)
                                         Text(snapshot.data.partnerData[index].partnerName),
                                        //  Text(snapshot.data.partnerData[index].dayList[0].dayName),


                                        
                                         for (var dayInfo in snapshot.data.partnerData[index].dayList)
                                         Container(child: Row(
                                           children: [
                                             Text(dayInfo.dayName),
                                             Text(dayInfo.timeFrom),
                                         
                                           ],
                                         )),
                                       ],),
                                     ),
                                  ),
                                ),
                              ],
                            ),
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
        body: ({
          "EncId" :docEncIdRef
        }));
    if (response.statusCode == 200) {
      print("Correct");
      print(response.body);
      jsonResponse = json.decode(response.body.toString());
      print(jsonResponse);

      DocDetailsRefactorModel dataModel = docDetailsRefactorModelFromJson(response.body); 
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