import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:medbo/API/Search/SearchApiResponse.dart';
import 'package:medbo/API/Search/afterSearchPage.dart';
import 'package:medbo/onTapScreens/doctorDetails.dart';
import 'package:medbo/onTapScreens/healthchkupDetails.dart';
import 'package:medbo/onTapScreens/lastVisit.dart';
import 'package:medbo/onTapScreens/pathLabDetails.dart';
import 'package:medbo/onTapScreens/surgicalPackageDetails.dart';
import 'package:medbo/parsing/allDoctors.dart';
import 'package:medbo/parsing/allHelalthchkups.dart';
import 'package:medbo/parsing/allPathTests.dart';
import 'package:medbo/parsing/allSurgicalPack.dart';
import 'package:medbo/screen_helper/clip_path.dart';
import 'package:medbo/screen_helper/side_drawer.dart';
import 'package:carousel_pro/carousel_pro.dart';
// import 'package:medbo/API/Doctors/allDoc.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {

   var searchController = TextEditingController();
//======================================================================================================================================================================
  late List docList = [];
  List finaldocList = [];
  late bool _loadDocList = true;

  late List surglist = [];
  List finalsurglist = [];
  late bool _loadSurgList = true;

  late List pathList = [];
  List finalPathList = [];
  late bool _loadPathList = true;

  late List chkUpList = [];
  List finalchkUpList = [];
  late bool _loadChkUpList = true;

//======================================================================================================================================================================

  AllDoctorsList doctorList = AllDoctorsList(); // doctorList obj
  Future<void> getDocs() async {
    finaldocList = await doctorList
        .getDocs(); // getDocs() is our function // calling function with the class obj ==> doctorList
    setState(() {
      docList = finaldocList;
    });
    // print(_datum[0].doctorId);
    // print('doclist length:  ${finaldocList.length}');
  }

  AllSurgPackList sList = AllSurgPackList();
  Future<void> getSPlist() async {
    finalsurglist = await sList.getSPList();
    setState(() {
      surglist = finalsurglist;
    });
    // print(_datum[0].doctorId);
    // print('surgListLength: ${finalsurglist.length}');
  }

  PathTestList PList = PathTestList();
  Future<void> getPathTest() async {
    finalPathList = await PList.getPathTest();
    setState(() {
      pathList = finalPathList;
    });
    // print(_datum[0].doctorId);
    // print(finalDatum.length);
  }

  HlthChkUpList HList = HlthChkUpList();
  Future<void> getHList() async {
    finalchkUpList = await HList.getHlthChkUps();
    setState(() {
      chkUpList = finalchkUpList;
    });
    // print(chkUpList[0].testName);
    // print(finalchkUpList.length);
  }

  void initState() {
    //=====================================================init State
    super.initState();

    getDocs();
    getSPlist();
    getPathTest();
    getHList();
    // print(_datum[0].doctorId);
    // _initUser();
    if (docList != null ||
        surglist != null ||
        pathList != null ||
        chkUpList != null) {
      setState(() {
        _loadDocList = false;
        _loadSurgList = false;
        _loadPathList = false;
        _loadChkUpList = false;
      });
    }
  }

//=================================================================================================built (BuildContext context)=====================================================================
  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidth/100);
    var blockSizeVertical= (screenHeight/100);



    Widget image_carousel = new Container(
      margin: EdgeInsets.all(10.0),
      // padding: EdgeInsets.all(10),
      height: 180,
      width: MediaQuery.of(context).size.width,
      // color: Colors.green,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Carousel(
        boxFit: BoxFit.contain,
        images: [
          AssetImage('assets/images/medbo-doctors.png'),
          AssetImage('assets/images/medbo-pathological-tests.png'),
          AssetImage('assets/images/medbo-home-banner-removebg.png'),
          AssetImage('assets/images/medbo-pathological-tests.png'),
        ],
        dotSize: 0.0,
        indicatorBgPadding: 0.0,
        autoplay: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor
              ],
            ),
          ),
        ),
        title: Center(
          child: Image.asset(
      "assets/images/medbo.png",
      fit: BoxFit.contain,
      height: 52,),
        ),
        //toolbarHeight: 88,
    actions: [
      IconButton(onPressed: () => {}, icon: Icon(Icons.more_vert,size: 0.1,),),
    ],
      ),
      drawer: SideDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.lightBlue[50],
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  //height: 400,
                  height:blockSizeVertical*50,
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
              Column(children: [

                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: userField(),
                        ),
                        // Expanded(
                        // child: ElevatedButton (
                        //   //style: style,
                        //    onPressed: (){
                        //       searchByUser();
                        //    },
                        //   child: Icon(
                        //    Icons.search),
                        // ),
                        // ),
                    ],
                  ),
                ),

                //  Padding(
                //    padding: const EdgeInsets.all(13.0),
                //    child: userField(),
                //  ),

                 //SizedBox(height: 20,),
                 
                image_carousel,
                Container(//===================================================1st=======================================================
                 height: blockSizeVertical*29,//===============whole horizontal 1st card container height,

                   //color: Colors.blue,
                  child: ListView.separated(//=======================actual scrollble 5 box
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,      
                    itemBuilder: (context, index) => Container(
                        // color: Colors.green,
                       height: blockSizeVertical*10,
                        width:blockSizeHorizontal*70,//=================scrollable box
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.center,
                            colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).accentColor
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                             height: blockSizeVertical*8,
                              width: blockSizeHorizontal*50,
                               //color: Colors.green,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Your Last Visit',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        fontFamily: 'Poppins',
                                        color: Colors.white),
                                  ),
                                  Text('Date and Time:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontFamily: 'Poppins')),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: blockSizeVertical*7,
                            ),
                            //=============================================================1st row===========================================================================
                            Container(
                              height: blockSizeVertical*6.9,
                              width: blockSizeHorizontal*100,//======container which contain 2Row elements
                               //color: Colors.green,
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left:10),
                                    width: blockSizeHorizontal*33,
                                    height: blockSizeVertical*6,
                                    //color: Colors.black,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Doctors Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              fontFamily: 'Poppins',
                                              color: Colors.white),
                                        ),
                                        Text('Doctor_speciality',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Poppins',
                                                fontSize: 13,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: blockSizeHorizontal*5,
                                  ),
                                  Container(
                                    width: blockSizeHorizontal*30,
                                     //color: Colors.black,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LastVisit()),
                                        );
                                        // print("tapped on container");
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(8),
                                        // padding: EdgeInsets.only(
                                        //     top: 10.0,
                                        //     bottom: 10.0,
                                        //     right: 32.0,
                                        //     left: 35.0),
                                        height: blockSizeVertical*10,
                                        // color: Colors.green,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            'Details',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      color: Colors.transparent,
                    ),
                  ),
                ),



                //==========================================End of 1st block=======================








                SizedBox(
                  height: blockSizeVertical*5.2,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        'Doctors',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            //fontFamily: 'Poppins',
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ),

                Container(//=============================================Doc containers==================================================
                  //=============================================================2nd row  All doc coming==========================================================================
                  //onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDetails()));},
                  height: blockSizeVertical*38,
                  //width: double.infinity,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                    itemCount: docList == null ? 0 : docList.length, ///////
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: blockSizeHorizontal*40,//================================== white "container" width
                      margin: EdgeInsets.all(10),
                      child: Stack(children: [
                        Column(
                          //=================================================================================================doc image horizonal============================================
                          children: [
                            Padding(//====================images 
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                 borderRadius: BorderRadius.circular(14.0),
                                child: Image(
                                  image: NetworkImage(
                                    docList[index].doctorImage,
                                  ),
                                  fit: BoxFit.cover,
                                  height: blockSizeVertical*18,
                                  width: blockSizeHorizontal*50,
                                ),
                              ),
                            ),
                            // SizedBox(height: 5),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Center(
                            //     child: Text(
                            //       '${docList[index].doctorName}',
                            //       style: TextStyle(
                            //           fontFamily: 'Roboto_Condensed',
                            //           color: Theme.of(context).primaryColor,
                            //           fontWeight: FontWeight.bold,
                            //           fontSize: 20),
                            //       textAlign: TextAlign.center,
                            //     ),
                            //   ),
                            // ),



                            // SizedBox(height: 10),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 5.0),
                            //   child: Text(
                            //     (() {
                            //       var str =
                            //           docList[index].specialisation.toString();
                            //       if (str.length > 3) {
                            //         return '${docList[index].specialisation.toString().substring(0, 20)} ' +
                            //             '...';
                            //       }

                            //       return "${docList[index].specialisation}";
                            //     })(),
                            //     // '${docList[index].specialisation.toString().substring(0,3)} '+ '...',

                            //     style: TextStyle(
                            //       fontSize: 12,
                            //       fontFamily: 'Roboto_Condensed',
                            //       color: Theme.of(context).primaryColor,
                            //     ),
                            //     textAlign: TextAlign.center,
                            //   ),
                            // ),

                            /////////////////////////////////

                            SizedBox(height: blockSizeVertical*0.5),

                            
                            Text(
                                  '${docList[index].doctorName}',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                  textAlign: TextAlign.center,
                                  maxLines:1
                                ),


                                 SizedBox(height: blockSizeVertical*0.5),


                                Text(
                                  
                                (() {
                                  var str =
                                      docList[index].specialisation.toString();
                                  if (str.length > 3) {
                                    return '${docList[index].specialisation.toString().substring(0, 20)} ' +
                                        '...';
                                  }

                                  return "${docList[index].specialisation}";
                                })(),
                                // '${docList[index].specialisation.toString().substring(0,3)} '+ '...',

                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  color: Theme.of(context).primaryColor,
                                ),
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                              ),



                             SizedBox(height: blockSizeVertical*0.5),



                            
                          ],
                          
                        ),
                        Positioned(
                            bottom: 5,
                          left: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(left:15.0, bottom: 5),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DoctorDetails(
                                            encId:
                                                docList[index].encDoctorId)));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: blockSizeVertical*5,
                                width: blockSizeHorizontal*30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      Theme.of(context).primaryColor,
                                      Theme.of(context).accentColor
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'Show Details',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),





                //=============================================================Doc list end===========================================================================
                
                
                
                
                
                SizedBox(
                  height: blockSizeVertical*6.2,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        'Surgical Package',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ),
                Container(//=============================================================================================Surgical Package whole box=================================================
                  height: blockSizeVertical*30,//38
                  child: ListView.builder(
                    itemCount: surglist == null ? 0 : surglist.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: blockSizeHorizontal*40,
                      margin: EdgeInsets.all(10),
                      child: Stack(children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${surglist[index].packageName}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  fontFamily: 'Poppins',
                                  color: Theme.of(context).primaryColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: blockSizeVertical*0.8),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              // color: Colors.green,
                              child: Text(
                                '${surglist[index].description}',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Theme.of(context).primaryColor),
                                textAlign: TextAlign.center,
                                maxLines: 4,
                              ),
                            ),
                          ],
                        ),

                        // InkWell(
                        //   onTap: (){  },
                        //   child:
                        Positioned(
                          bottom: 5,
                          left: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left:15.0, bottom: 5),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SurgPackDetails(
                                            encId:
                                                surglist[index].encPackageId)));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: blockSizeVertical*5,
                                width: blockSizeHorizontal*30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      Theme.of(context).primaryColor,
                                      Theme.of(context).accentColor
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'Show Details',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),








                //============================================================================Surgical end=================================










                SizedBox(
                  height: blockSizeVertical*6.2,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        'Pathological Tests',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: blockSizeVertical*30,//38
                  child: ListView.builder(
                    itemCount: pathList == null ? 0 : pathList.length,
                    scrollDirection: Axis.horizontal,
                     physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: blockSizeHorizontal*40,
                      margin: EdgeInsets.all(10),
                      child: Stack(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${pathList[index].testName}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    fontFamily: 'Poppins',
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                               SizedBox(height: blockSizeVertical*0.8),

                                Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              // color: Colors.green,
                              child: Center(
                                child: Text(
                                  '${pathList[index].testId}',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Theme.of(context).primaryColor),
                                  textAlign: TextAlign.center,
                                  maxLines: 4,
                                ),
                              ),
                            ),
                            ]
                            
                            ),
                        Positioned(
                          bottom: 5,
                          left: 2,
                          child: Padding(
                           padding: const EdgeInsets.only(left:15.0, bottom: 5),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PathTestDetails(
                                            encId: pathList[index].encTestId)));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: blockSizeVertical*5,
                                width: blockSizeHorizontal*30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      Theme.of(context).primaryColor,
                                      Theme.of(context).accentColor
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'Show Details',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),






               //============================================================================Pathological end=================================








                SizedBox(
                 height: blockSizeVertical*6.2,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        'Health Checkups',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: blockSizeVertical*30,//38
                  child: ListView.builder(
                    itemCount: chkUpList == null ? 0 : chkUpList.length,
                    scrollDirection: Axis.horizontal,
                     physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: blockSizeHorizontal*40,
                      margin: EdgeInsets.all(10),
                      child: Stack(children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${chkUpList[index].healthName}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  fontFamily: 'Poppins',
                                  color: Theme.of(context).primaryColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: blockSizeVertical*0.8),


                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              // color: Colors.green,
                              child: Text(
                                '${chkUpList[index].testName}',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Theme.of(context).primaryColor),
                                textAlign: TextAlign.center,
                                maxLines: 4,
                              ),
                            ),
                          ],
                        ),
                        Positioned(//===========================================================================show details button
                          bottom: 5,
                          left: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(left:15.0, bottom: 5),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HlthChkUpDetails(
                                            encId: chkUpList[index]
                                                .encHealthPartnerId)));
                              },
                              child: Container(
                                alignment: Alignment.center,
                               height: blockSizeVertical*5,
                                width: blockSizeHorizontal*30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      Theme.of(context).primaryColor,
                                      Theme.of(context).accentColor
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'Show Details',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

   Widget userField() {
     
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: searchController,
      onChanged: (text) {
        setState(
          () {
           // textLength = text.length;
          },
        );
      },

      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.blueGrey //greenAccent//Color(0xFF425c5a),
              ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),

        errorBorder: OutlineInputBorder(
        //  borderSide: BorderSide(color: Colors.red[100]),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),

        suffixIcon: IconButton(
        icon: Icon(Icons.search, color: Color(0xFFF4D3AE),size: 34,),
        onPressed: (){
          searchByUser();
          },//=============================================================
        ),

        // suffixIcon: Icon(textLength <= 5 ? Icons.cancel : Icons.check,
        //     color: textLength >= 6 ? Colors.green : Colors.redAccent),

        labelText: 'Search Doctors, Clinics, Hospitals, Etc',
        labelStyle: TextStyle(
          fontFamily: 'Californian FB',
          color: Colors.white38, //Color(0xFF425c5a),
          fontWeight: FontWeight.normal,
          letterSpacing: 2.0,
          fontSize: 11.0,
        ),
        //hintText: 'Ex : Dental or Sugar Check up etc',
        hintStyle: TextStyle(
          fontFamily: 'Californian FB',
          color: Colors.white38, //Color(0xFF425c5a),
          fontWeight: FontWeight.normal,
          letterSpacing: 2.0,
          fontSize: 9.0,
        ),
        //filled: true,
        //fillColor: Colors.grey[200],
        // prefixIcon: Icon(
        //   Icons.search,
        //   color: Color(0xFFF4D3AE),
        // ),
      ),

     //keyboardType: TextInputType.number,
      // inputFormatters: [
      //   //only numeric keyboard.
      //  // LengthLimitingTextInputFormatter(6), //only 6 digit
      //  // WhitelistingTextInputFormatter.digitsOnly,
      // ],

      // validator: (String value) {
      //   if (value.length < 6) {
      //     return 'Enter your vaild 6 digit User ID';
      //   }
      //   return null;
      // },                                                                              // Active button validation
    );
  }







//=================================================================================================






  Future<void> searchByUser() async {
    var jsonResponse;
    if (searchController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://medbo.digitalicon.in/api/medboapi/searchResult"),
          body: ({
            'SearchKey': searchController.text,
          }));
      if (response.statusCode == 200) {
        setState(() {
          //isApiCallProcess = false;//progress bar hide
        });
        print("Correct");
        print(response.body);
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
         Navigator.push(context, MaterialPageRoute(builder: (context)=>AfterSearchPage(rresponse: SearchApiResponse.fromJson(jsonResponse))));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(" ${jsonResponse['Message']}"),
          backgroundColor: Color(0xFF152A38),
        ));
        // pageRoute(
        //   jsonResponse['UserData']['Name'],
        // ); // WANT TO SHOW USER NAME IN APP DRAWER AFTER LOGIN WITH CORRECT CREDENTIALS
      } else {
        print("Wronggooooooooooooooooooooooooooo");
        print(response.body);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid credentials")));
      }
    } else {
      // setState(() {
      //     isApiCallProcess = false;//progress bar hide
      //   });
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text("Blank field is not allowed"),
      //   backgroundColor: Color(0xFFAF0404),
      // ));
    }
  }








}
