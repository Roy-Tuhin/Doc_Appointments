import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:medbo/main.dart';
import 'package:medbo/onTapScreens/Dietcian_Details_Page/Dietcian_Details_RefPage.dart';
import 'package:medbo/onTapScreens/Doc_Details_Page/DocDetailsRefactorPage.dart';
import 'package:medbo/onTapScreens/Health_Details_Page/HealthDetailsPageRef.dart';
import 'package:medbo/onTapScreens/Path_Details_Page/PathTestDetailsPage.dart';
import 'package:medbo/onTapScreens/Surgical_Details_Page/SurgicalDetailsRefacPage.dart';
import 'package:medbo/onTapScreens/surgicalPackageDetails.dart';
import 'package:medbo/onTapScreens/doctorDetails.dart';
import 'package:medbo/onTapScreens/healthchkupDetails.dart';
import 'package:medbo/onTapScreens/pathLabDetails.dart';
import 'package:medbo/screens/home.dart';
import 'package:medbo/screens2.dart/home2.dart';

import 'SearchApiResponse.dart';

// import 'ApiResponse.dart';

class AfterSearchPage extends StatefulWidget {
  final SearchApiResponse rresponse;
  const AfterSearchPage({required this.rresponse});
  @override
  _AfterSearchPageState createState() => _AfterSearchPageState();
}

class _AfterSearchPageState extends State<AfterSearchPage> {
   //late List pathList = [];
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
  // var responseRef;
  //  _SecondState(this.responseRef);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlue[50],
      backgroundColor: Colors.white,
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
          'Search Result',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final item in widget.rresponse.data)
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      // color: Color(0xFF3E64FF),
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.all(Radius.circular(12)),
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
                    children: [
                      ListTile(
                        title: Text(item.name),
                        trailing: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor),
                            onPressed: () {



                              //======================================patha search redirect===============================
                              if(item.resultFor=='T'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                 PathTestDetailsPageRef( item.encId)));  
                              }//new test
                              // else if(item.resultFor=='T'&& item.encId=='U4exk+vfMGrn7cjNUa/PBw=='){
                              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              //    PathTestDetailsPageRef('U4exk+vfMGrn7cjNUa/PBw==')));  

                              // }else if(item.resultFor=='T'&& item.encId=='I3uXyzcuDZf21SSe5fHnSQ=='){
                              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              //    PathTestDetailsPageRef('I3uXyzcuDZf21SSe5fHnSQ==')));  

                              // }else if(item.resultFor=='T'&& item.encId=='B909+U0FIAHIs+sl3IYTvQ=='){
                              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              //    PathTestDetailsPageRef('B909+U0FIAHIs+sl3IYTvQ==')));  

                              // }else if(item.resultFor=='T'&& item.encId=='7Ch2aVnhokZtRWyJtuDA/A=='){
                              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              //    PathTestDetailsPageRef('7Ch2aVnhokZtRWyJtuDA/A==')));  
                              // }


                              //================================Doctor search redirect====================================================================





                              else if(item.resultFor=='D'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                 DocDetailsRefactorPage(item.encId)));  

                              }
                              // else if( item.resultFor=='D'){
                              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              //    DocDetailsRefactorPage(item.encId))); 

                              // }else if( item.resultFor=='D'){
                              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              //    DocDetailsRefactorPage(item.encId))); 

                              // }else if(item.encId=='I3uXyzcuDZf21SSe5fHnSQ=='&& item.resultFor=='D'){
                              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              //    DocDetailsRefactorPage('I3uXyzcuDZf21SSe5fHnSQ==')));

                              // }else if( item.encId=='7Ch2aVnhokZtRWyJtuDA/A=='&& item.resultFor=='D'){
                              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              //    DocDetailsRefactorPage('7Ch2aVnhokZtRWyJtuDA/A==')));  
                              // }




                            //=============================Health Checkups search redirect=======================================================================




                            else if( item.resultFor=='H'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                HealthDetailsPageRef(item.encId)));  

                              }
                              // else if( item.encId=='VKo7nNHPtalBOZv4YpBZFg=='&&item.resultFor=='H'){
                              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              //   HealthDetailsPageRef('VKo7nNHPtalBOZv4YpBZFg==')));

                              // }else if( item.encId=='7Ch2aVnhokZtRWyJtuDA/A=='&&item.resultFor=='H'){
                              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              //   HealthDetailsPageRef('7Ch2aVnhokZtRWyJtuDA/A=='))); 

                              // }else if( item.encId=='eYwtNBXR6P/JDtsIwr+Bvw=='&&item.resultFor=='H'){
                              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              //   HealthDetailsPageRef('eYwtNBXR6P/JDtsIwr+Bvw==')));  
                              // }






                            //=============================Surgical search redirect=======================================================================


                              else if( item.resultFor=='S'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                               SurgicalDetailsRefacPage(item.encId))); 

                              }
                              // else if( item.encId=='B909+U0FIAHIs+sl3IYTvQ=='&&item.resultFor=='S'){
                              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              //  SurgicalDetailsRefacPage('B909+U0FIAHIs+sl3IYTvQ==')));  

                              // }else if( item.encId=='I3uXyzcuDZf21SSe5fHnSQ=='&&item.resultFor=='S'){
                              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              //  SurgicalDetailsRefacPage('I3uXyzcuDZf21SSe5fHnSQ=='))); 

                              // }else if( item.encId=='7Ch2aVnhokZtRWyJtuDA/A=='&&item.resultFor=='S'){
                              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              //  SurgicalDetailsRefacPage('7Ch2aVnhokZtRWyJtuDA/A==')));  
                              // }



                               else if( item.resultFor=='DT'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                               DietDetailsRefPage(item.encId))); 

                              }








                            },
                            child: Text("Show details")),
                        leading: CircleAvatar(
                          backgroundColor: Colors.lightBlue[50],
                          radius: 30,
                          backgroundImage: NetworkImage(item.image),
                        ),
                      ),
                      // Text(item.name),
                      Text(item.extra1),
                      Text(item.extra2),
                      //Image.network(item.image,height: 200,),
                    ],
                  ),
                ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
