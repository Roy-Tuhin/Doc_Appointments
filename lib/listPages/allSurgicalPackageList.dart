import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medbo/models/SurgPackRefactor/AllSurgPackModel.dart';
// import 'package:medbo/models/allSurgicalPackModels.dart';
import 'package:medbo/onTapScreens/Surgical_Details_Page/SurgicalDetailsRefacPage.dart';
import 'package:medbo/onTapScreens/surgicalPackageDetails.dart';
// import 'package:medbo/parsing/allSurgicalPack.dart';
import 'package:http/http.dart' as http;

import '../screen_helper/clip_path.dart';
class SurgicalPackageDetails extends StatefulWidget {

  // final List<String> amount=<String>['300','500','300','500','300','500','300','500','300','500','300','500',];
  // final List<String> packageName=<String>['Knee joint','Elbow joint','Knee joint','Elbow joint','Knee joint','Elbow joint','Knee joint','Elbow joint','Knee joint','Elbow joint','Knee joint','Elbow joint'];
  @override
  _SurgicalPackageDetailsState createState() => _SurgicalPackageDetailsState();
}

class _SurgicalPackageDetailsState extends State<SurgicalPackageDetails> {
  // late List<Data> surglist=[];
  // List<Data> finalsurglist=[];

  // late bool _loading = true;
  // AllSurgPackList doctorList = AllSurgPackList();
  // Future<void> getSPlist() async {
  //   finalsurglist = await doctorList.getSPList();
  //   setState(() {
  //     surglist=finalsurglist;
  //   });
  //   // print(_datum[0].doctorId);
  //   print(finalsurglist.length);
  // }

  // void initState() {
  //   super.initState();
  //   getSPlist();
  //   // print(_datum[0].doctorId);
  //   // _initUser();
  //   if (surglist != null) {
  //     setState(() {
  //       _loading = false;
  //     });
  //   }
  //   // else{
  //   //   getDocs();
  //   // }
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
              ] ,
            ),
          ),
        ),
        title: Text('Surgical Packages',style: TextStyle(fontFamily: 'Roboto_Condensed',),),
      ),
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
                      ] ,
                    ),
                  ),
                ),
              ),
      
              Stack(
                children: [
                  Container(
                    // color: Colors.green,
                    // height: 500,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
      
                       // _searchBar(),
      
                        // Expanded(
                        //   child: ListView.separated(
                        //     padding: EdgeInsets.all(15),
                        //     scrollDirection: Axis.vertical,
                        //     itemCount: surglist== null ? 0 : surglist.length,
                        //     itemBuilder: (BuildContext context,int index){
                        //      return _listItems(index);
                        //     },
                        //     separatorBuilder: (BuildContext context, int index)=>const Divider(
                        //       color: Colors.transparent,
                        //     ),
                        //   ),
                        // ),
      
      
                              
                          Container(
                        height: screenHeight,
                        //color: Colors.blueAccent,
                        child: FutureBuilder(
                          future: AllSurgPackRefacApi(),
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
                                                SurgicalDetailsRefacPage(snapshot
                                                    .data[index].encPackageId)));
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
                                                '${snapshot.data[index].packageName}',
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
                                              child: 
                                              Text(
                                                'Description : ${snapshot.data[index].description}', //put email
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    // fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        blockSizeHorizontal * 2.5,
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

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
  //             hintText: 'type package name',
  //             hintStyle: Theme.of(context).textTheme.caption!.copyWith(
  //               fontSize: 15,
  //               fontWeight: FontWeight.bold,
  //               color: Colors.grey,
  //             )
  //         ),
  //         onChanged: (text){
  //           text=text.toLowerCase();
  //           setState(() {
  //             surglist=finalsurglist.where((element){
  //               var searchText=element.packageName.toLowerCase();
  //               return searchText.contains(text);
  //             }).toList();
  //           });
  //         },

  //       ),
  //     ),
  //   );
  // }

  // _listItems(index){
  //   return InkWell(
  //     onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SurgPackDetails(encId: surglist[index].encPackageId)));},
  //     child: Container(
  //       height: 100,
  //       width: MediaQuery.of(context).size.width,
  //       // margin: EdgeInsets.only(left:15.0,),
  //       // color: Colors.blue,
  //       decoration: BoxDecoration(

  //         shape:BoxShape.rectangle,
  //         borderRadius: BorderRadius.circular(15),
  //         gradient:LinearGradient(
  //           begin: Alignment.topLeft,
  //           end: Alignment.center,
  //           colors: [
  //             Theme.of(context).primaryColor,
  //             Theme.of(context).accentColor
  //           ] ,
  //         ),
  //       ),
  //       child: Container(
  //         padding:EdgeInsets.all(15),
  //         child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Padding(
  //                 padding: EdgeInsets.symmetric(vertical: 5),
  //                 child: Text('${surglist[index].packageName}',style: TextStyle(fontFamily: 'Roboto_Condensed',fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
  //               ),

  //               Container(
  //                 // color: Colors.green,
  //                 // height: MediaQuery.of(context).size.height,
  //                 padding: EdgeInsets.symmetric(vertical: 5),
  //                 width: 300,
  //                 child: Text('${surglist[index].description}',style: TextStyle(fontFamily: 'Roboto_Condensed',
  //                     // fontWeight: FontWeight.bold,
  //                     fontSize: 12,color: Colors.white),),
  //               ),
  //             ]
  //         ),
  //       ),
  //     ),
  //   );
  // }



          Future<List<SurgPackInfoList>> AllSurgPackRefacApi() async {
    var jsonResponse;

    var response = await http.post(
        Uri.parse("https://medbo.in/api/medboapi/allsurgicalpackage"),
        body: ({
        }));
    if (response.statusCode == 200) {
      print("Correct");
      print(response.body);
      jsonResponse = json.decode(response.body.toString());
      print(jsonResponse);
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>AfterSearchPage(rresponse: SearchApiResponse.fromJson(jsonResponse))));
      AllSurgPackModel dataModel = allSurgPackModelFromJson(response.body); //Model file
      print(dataModel.data.length);
      for (final item in dataModel.data) print(item.packageName);

      List<SurgPackInfoList> arrData =
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
