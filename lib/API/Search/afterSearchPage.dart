import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:medbo/main.dart';
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
                              if(item.resultFor=='T'&& item.encId=='IujyQXg8KZg8asLvK/FS7g=='){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                 PathTestDetails(encId:'IujyQXg8KZg8asLvK/FS7g==')));  
                              }//new test
                              else if(item.resultFor=='T'&& item.encId=='U4exk+vfMGrn7cjNUa/PBw=='){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                 PathTestDetails(encId:'U4exk+vfMGrn7cjNUa/PBw==')));  

                              }else if(item.resultFor=='T'&& item.encId=='I3uXyzcuDZf21SSe5fHnSQ=='){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                 PathTestDetails(encId:'I3uXyzcuDZf21SSe5fHnSQ==')));  

                              }else if(item.resultFor=='T'&& item.encId=='B909+U0FIAHIs+sl3IYTvQ=='){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                 PathTestDetails(encId:'B909+U0FIAHIs+sl3IYTvQ==')));  

                              }else if(item.resultFor=='T'&& item.encId=='7Ch2aVnhokZtRWyJtuDA/A=='){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                 PathTestDetails(encId:'7Ch2aVnhokZtRWyJtuDA/A==')));  
                              }


                              //================================Doctor search redirect====================================================================





                              else if( item.encId=='fXVmzecGStqrhx1PmIgwlQ=='&&item.resultFor=='D'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                 DoctorDetails(encId:'fXVmzecGStqrhx1PmIgwlQ==')));  

                              }else if( item.encId=='pEl2B9kuumKRxIxLJO76eQ=='&&item.resultFor=='D'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                 DoctorDetails(encId:'pEl2B9kuumKRxIxLJO76eQ=='))); 

                              }else if( item.encId=='kFgorcFF0G6RQD4W+LwWnQ=='&&item.resultFor=='D'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                 DoctorDetails(encId:'kFgorcFF0G6RQD4W+LwWnQ=='))); 

                              }else if(item.encId=='I3uXyzcuDZf21SSe5fHnSQ=='&& item.resultFor=='D'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                 DoctorDetails(encId:'I3uXyzcuDZf21SSe5fHnSQ==')));

                              }else if( item.encId=='7Ch2aVnhokZtRWyJtuDA/A=='&& item.resultFor=='D'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                 DoctorDetails(encId:'7Ch2aVnhokZtRWyJtuDA/A==')));  
                              }




                            //=============================Health Checkups search redirect=======================================================================




                            else if( item.encId=='q8O8YMzYKXSB4RtkX4k7Lw=='&&item.resultFor=='H'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                HlthChkUpDetails(encId:'q8O8YMzYKXSB4RtkX4k7Lw==')));  

                              }else if( item.encId=='VKo7nNHPtalBOZv4YpBZFg=='&&item.resultFor=='H'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                HlthChkUpDetails(encId:'VKo7nNHPtalBOZv4YpBZFg==')));

                              }else if( item.encId=='7Ch2aVnhokZtRWyJtuDA/A=='&&item.resultFor=='H'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                HlthChkUpDetails(encId:'7Ch2aVnhokZtRWyJtuDA/A=='))); 

                              }else if( item.encId=='eYwtNBXR6P/JDtsIwr+Bvw=='&&item.resultFor=='H'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                HlthChkUpDetails(encId:'eYwtNBXR6P/JDtsIwr+Bvw==')));  
                              }






                            //=============================Surgical search redirect=======================================================================


                              else if( item.encId=='IujyQXg8KZg8asLvK/FS7g=='&&item.resultFor=='S'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                               SurgPackDetails(encId:'IujyQXg8KZg8asLvK/FS7g=='))); 

                              }else if( item.encId=='B909+U0FIAHIs+sl3IYTvQ=='&&item.resultFor=='S'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                               SurgPackDetails(encId:'B909+U0FIAHIs+sl3IYTvQ==')));  

                              }else if( item.encId=='I3uXyzcuDZf21SSe5fHnSQ=='&&item.resultFor=='S'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                               SurgPackDetails(encId:'I3uXyzcuDZf21SSe5fHnSQ=='))); 

                              }else if( item.encId=='7Ch2aVnhokZtRWyJtuDA/A=='&&item.resultFor=='S'){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                               SurgPackDetails(encId:'7Ch2aVnhokZtRWyJtuDA/A==')));  
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
