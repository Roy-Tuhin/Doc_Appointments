// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:medbo/onTapScreens/doctorDetails.dart';
// import 'package:medbo/onTapScreens/healthchkupDetails.dart';
// import 'package:medbo/onTapScreens/lastVisit.dart';
// import 'package:medbo/onTapScreens/pathLabDetails.dart';
// import 'package:medbo/onTapScreens/surgicalPackageDetails.dart';
// import 'package:medbo/parsing/allDoctors.dart';
// import 'package:medbo/parsing/allHelalthchkups.dart';
// import 'package:medbo/parsing/allPathTests.dart';
// import 'package:medbo/parsing/allSurgicalPack.dart';
// import 'package:medbo/screen_helper/clip_path.dart';
// import 'package:medbo/screen_helper/side_drawer.dart';
// import 'package:carousel_pro/carousel_pro.dart';
// import 'package:medbo/API/Doctors/allDoc.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
  
//   late List docList = [];
//   List finaldocList = [];
//   late bool _loadDocList = true;

//   late List surglist = [];
//   List finalsurglist = [];
//   late bool _loadSurgList = true;

//   late List pathList = [];
//   List finalPathList = [];
//   late bool _loadPathList = true;

//   late List chkUpList = [];
//   List finalchkUpList = [];
//   late bool _loadChkUpList = true;

//   AllDoctorsList doctorList = AllDoctorsList(); // doctorList obj
//   Future<void> getDocs() async {
//     finaldocList = await doctorList.getDocs(); // getDocs() is our function // calling function with the class obj ==> doctorList
//     setState(() {
//       docList = finaldocList;
//     });
//     // print(_datum[0].doctorId);
//     // print('doclist length:  ${finaldocList.length}');
//   }

//   AllSurgPackList sList = AllSurgPackList();
//   Future<void> getSPlist() async {
//     finalsurglist = await sList.getSPList();
//     setState(() {
//       surglist = finalsurglist;
//     });
//     // print(_datum[0].doctorId);
//     // print('surgListLength: ${finalsurglist.length}');
//   }

//   PathTestList PList = PathTestList();
//   Future<void> getPathTest() async {
//     finalPathList = await PList.getPathTest();
//     setState(() {
//       pathList = finalPathList;
//     });
//     // print(_datum[0].doctorId);
//     // print(finalDatum.length);
//   }

//   HlthChkUpList HList = HlthChkUpList();
//   Future<void> getHList() async {
//     finalchkUpList = await HList.getHlthChkUps();
//     setState(() {
//       chkUpList = finalchkUpList;
//     });
//     // print(chkUpList[0].testName);
//     // print(finalchkUpList.length);
//   }

//   void initState() {
//     super.initState();
//     getDocs();
//     getSPlist();
//     getPathTest();
//     getHList();
//     // print(_datum[0].doctorId);
//     // _initUser();
//     if (docList != null ||
//         surglist != null ||
//         pathList != null ||
//         chkUpList != null) {
//       setState(() {
//         _loadDocList = false;
//         _loadSurgList = false;
//         _loadPathList = false;
//         _loadChkUpList = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget image_carousel = new Container(
//       margin: EdgeInsets.all(10.0),
//       // padding: EdgeInsets.all(10),
//       height: 180,
//       width: MediaQuery.of(context).size.width,
//       // color: Colors.green,
//       decoration: BoxDecoration(
//         color: Theme.of(context).primaryColor,
//         shape: BoxShape.rectangle,
//         borderRadius: BorderRadius.circular(10),
//       ),

//       child: Carousel(
//         boxFit: BoxFit.contain,
//         images: [
//           AssetImage('assets/images/medbo-doctors.png'),
//           AssetImage('assets/images/medbo-pathological-tests.png'),
//           AssetImage('assets/images/medbo-home-banner.png'),
//           AssetImage('assets/images/medbo-surgical-packages.png'),
//         ],
//         dotSize: 0.0,
//         indicatorBgPadding: 0.0,
//         autoplay: true,
//       ),
//     );

//     return Scaffold(
//       appBar: AppBar(
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.topRight,
//                 colors: [
//                   Theme.of(context).primaryColor,
//                   Theme.of(context).accentColor
//                 ],
//               ),
//             ),
//           ),
//           title: Text(
//             'HOME',
//             style: TextStyle(fontFamily: 'Roboto_Condensed'),
//           )),
//       drawer: SideDrawer(),
//       body: SingleChildScrollView(
//         child: Container(
//           color: Colors.lightBlue[50],
//           child: Stack(
//             alignment: Alignment.topCenter,
//             children: [
//               ClipPath(
//                 clipper: MyClipper(),
//                 child: Container(
//                   height: 400,
//                   width: MediaQuery.of(context).size.height,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.center,
//                       colors: [
//                         Theme.of(context).primaryColor,
//                         Theme.of(context).accentColor
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Column(children: [
//                 image_carousel,
//                 Container(
//                   height: 200,
//                   // color: Colors.blue,
//                   child: ListView.separated(
//                     itemCount: 5,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) => Container(
//                         // color: Colors.green,
//                         height: 100,
//                         width: 300,
//                         margin: EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.circular(5),
//                           gradient: LinearGradient(
//                             begin: Alignment.topLeft,
//                             end: Alignment.center,
//                             colors: [
//                               Theme.of(context).primaryColor,
//                               Theme.of(context).accentColor
//                             ],
//                           ),
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               height: 50,
//                               width: 150,
//                               // color: Colors.green,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'Your Last Visit',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 20,
//                                         fontFamily: 'Roboto_Condensed',
//                                         color: Colors.white),
//                                   ),
//                                   Text('Date and Time:',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 15,
//                                           color: Colors.white,
//                                           fontFamily: 'Roboto_Condensed')),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 40,
//                             ),
//                             //=============================================================1st row===========================================================================
//                             Container(
//                               height: 70,
//                               // color: Colors.green,
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     padding: EdgeInsets.all(10),
//                                     width: 145,
//                                     // color: Colors.black,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Doctors Name',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 20,
//                                               fontFamily: 'Roboto_Condensed',
//                                               color: Colors.white),
//                                         ),
//                                         Text('Doctor_speciality',
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'Roboto_Condensed',
//                                                 fontSize: 15,
//                                                 color: Colors.white)),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Container(
//                                     width: 145,
//                                     // color: Colors.black,
//                                     child: InkWell(
//                                       onTap: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   LastVisit()),
//                                         );
//                                         // print("tapped on container");
//                                       },
//                                       child: Container(
//                                         margin: EdgeInsets.all(10),
//                                         // padding: EdgeInsets.only(
//                                         //     top: 10.0,
//                                         //     bottom: 10.0,
//                                         //     right: 32.0,
//                                         //     left: 35.0),
//                                         height: 38,
//                                         // color: Colors.green,
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             shape: BoxShape.rectangle,
//                                             borderRadius:
//                                                 BorderRadius.circular(5)),
//                                         child: Text(
//                                           'Details:',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 15,
//                                               color: Theme.of(context)
//                                                   .primaryColor),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         )),
//                     separatorBuilder: (BuildContext context, int index) =>
//                         const Divider(
//                       color: Colors.transparent,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 35,
//                   child: Container(//=============================================================2nd row  All doc coming==========================================================================
//                     padding: EdgeInsets.all(5),
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       'Doctors',
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Roboto_Condensed',
//                           color: Theme.of(context).primaryColor),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   //onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDetails()));},
//                   height: 250,
//                   child: ListView.builder(
//                     itemCount: docList == null ? 0 : docList.length, ///////
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) => Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       width: 125,
//                       margin: EdgeInsets.all(10),
//                       child: Stack(children: [
//                         Column(
//                           //=================================================================================================doc image horizonal============================================
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: Image(
//                                 image: NetworkImage(
//                                   docList[index].doctorImage,
//                                 ),
//                                 fit: BoxFit.contain,
//                                 height: 100,
//                                 width: 100,
//                               ),
//                             ),
//                             // SizedBox(height: 5),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Center(
//                                 child: Text(
//                                   '${docList[index].doctorName}',
//                                   style: TextStyle(
//                                       fontFamily: 'Roboto_Condensed',
//                                       color: Theme.of(context).primaryColor,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ),
//                             // SizedBox(height: 10),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 5.0),
//                               child: Text(
//                                 (() {
//                                   var str =
//                                       docList[index].specialisation.toString();
//                                   if (str.length > 3) {
//                                     return '${docList[index].specialisation.toString().substring(0, 20)} ' +
//                                         '...';
//                                   }

//                                   return "${docList[index].specialisation}";
//                                 })(),
//                                 // '${docList[index].specialisation.toString().substring(0,3)} '+ '...',

//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontFamily: 'Roboto_Condensed',
//                                   color: Theme.of(context).primaryColor,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Positioned(
//                           bottom: 5,
//                           left: 2,
//                           child: Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child: InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => DoctorDetails(
//                                             encId:
//                                                 docList[index].encDoctorId)));
//                               },
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 height: 30,
//                                 width: 110,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.rectangle,
//                                   borderRadius: BorderRadius.circular(10),
//                                   gradient: LinearGradient(
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.topRight,
//                                     colors: [
//                                       Theme.of(context).primaryColor,
//                                       Theme.of(context).accentColor
//                                     ],
//                                   ),
//                                 ),
//                                 child: Text(
//                                   'Show Details',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                     fontFamily: 'Roboto_Condensed',
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ]),
//                     ),
//                   ),
//                 ),
//                 //=============================================================Doc list end===========================================================================
//                 SizedBox(
//                   height: 35,
//                   child: Container(
//                     padding: EdgeInsets.all(5),
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       'Surgical Package',
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontFamily: 'Roboto_Condensed',
//                           fontWeight: FontWeight.bold,
//                           color: Theme.of(context).primaryColor),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 220,
//                   child: ListView.builder(
//                     itemCount: surglist == null ? 0 : surglist.length,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) => Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       width: 125,
//                       margin: EdgeInsets.all(10),
//                       child: Stack(children: [
//                         Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 '${surglist[index].packageName}',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                   fontFamily: 'Roboto_Condensed',
//                                   color: Theme.of(context).primaryColor,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             Container(
//                               padding: EdgeInsets.symmetric(horizontal: 10),
//                               // color: Colors.green,
//                               child: Text(
//                                 '${surglist[index].description}',
//                                 style: TextStyle(
//                                     fontFamily: 'Roboto_Condensed',
//                                     // fontWeight: FontWeight.bold,
//                                     fontSize: 12,
//                                     color: Theme.of(context).primaryColor),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ],
//                         ),

//                         // InkWell(
//                         //   onTap: (){  },
//                         //   child:
//                         Positioned(
//                           bottom: 5,
//                           left: 2,
//                           child: Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child: InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => SurgPackDetails(
//                                             encId:
//                                                 surglist[index].encPackageId)));
//                               },
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 height: 30,
//                                 width: 110,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.rectangle,
//                                   borderRadius: BorderRadius.circular(10),
//                                   gradient: LinearGradient(
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.topRight,
//                                     colors: [
//                                       Theme.of(context).primaryColor,
//                                       Theme.of(context).accentColor
//                                     ],
//                                   ),
//                                 ),
//                                 child: Text(
//                                   'Show Details',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                     fontFamily: 'Roboto_Condensed',
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ]),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 35,
//                   child: Container(
//                     padding: EdgeInsets.all(5),
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       'Pathological Tests',
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontFamily: 'Roboto_Condensed',
//                           fontWeight: FontWeight.bold,
//                           color: Theme.of(context).primaryColor),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 200,
//                   child: ListView.builder(
//                     itemCount: pathList == null ? 0 : pathList.length,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) => Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       width: 125,
//                       margin: EdgeInsets.all(10),
//                       child: Stack(children: [
//                         Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   '${pathList[index].testName}',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20,
//                                     fontFamily: 'Roboto_Condensed',
//                                     color: Theme.of(context).primaryColor,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                             ]),
//                         Positioned(
//                           bottom: 5,
//                           left: 2,
//                           child: Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child: InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => PathTestDetails(
//                                             encId: pathList[index].encTestId)));
//                               },
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 height: 30,
//                                 width: 110,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.rectangle,
//                                   borderRadius: BorderRadius.circular(10),
//                                   gradient: LinearGradient(
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.topRight,
//                                     colors: [
//                                       Theme.of(context).primaryColor,
//                                       Theme.of(context).accentColor
//                                     ],
//                                   ),
//                                 ),
//                                 child: Text(
//                                   'Show Details',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                     fontFamily: 'Roboto_Condensed',
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ]),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 35,
//                   child: Container(
//                     padding: EdgeInsets.all(5),
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       'Health Checkups',
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontFamily: 'Roboto_Condensed',
//                           fontWeight: FontWeight.bold,
//                           color: Theme.of(context).primaryColor),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 250,
//                   child: ListView.builder(
//                     itemCount: chkUpList == null ? 0 : chkUpList.length,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) => Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       width: 125,
//                       margin: EdgeInsets.all(10),
//                       child: Stack(children: [
//                         Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 '${chkUpList[index].healthName}',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                   fontFamily: 'Roboto_Condensed',
//                                   color: Theme.of(context).primaryColor,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             Container(
//                               padding: EdgeInsets.symmetric(horizontal: 10),
//                               // color: Colors.green,
//                               child: Text(
//                                 '${chkUpList[index].testName}',
//                                 style: TextStyle(
//                                     fontFamily: 'Roboto_Condensed',
//                                     // fontWeight: FontWeight.bold,
//                                     fontSize: 12,
//                                     color: Theme.of(context).primaryColor),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Positioned(
//                           bottom: 5,
//                           left: 2,
//                           child: Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child: InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => HlthChkUpDetails(
//                                             encId: chkUpList[index]
//                                                 .encHealthPartnerId)));
//                               },
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 height: 30,
//                                 width: 110,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.rectangle,
//                                   borderRadius: BorderRadius.circular(10),
//                                   gradient: LinearGradient(
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.topRight,
//                                     colors: [
//                                       Theme.of(context).primaryColor,
//                                       Theme.of(context).accentColor
//                                     ],
//                                   ),
//                                 ),
//                                 child: Text(
//                                   'Show Details',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                     fontFamily: 'Roboto_Condensed',
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ]),
//                     ),
//                   ),
//                 ),
//               ]),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
