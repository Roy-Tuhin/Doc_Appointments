import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medbo/Booking/PathologicalMultipleBooking/MultipleTestBooking.dart';
import 'package:medbo/Booking/PathologicalMultipleBooking/SingleTestBooking.dart';
import 'package:medbo/models/allPathTestModel.dart';
import 'package:medbo/models/pathTestDetailsModel.dart';
import 'package:medbo/onTapScreens/pathLabDetails.dart';
import 'package:medbo/parsing/allPathTests.dart';

import '../screen_helper/clip_path.dart';
class PathologicalLabDetails extends StatefulWidget {

  @override
  _PathologicalLabDetailsState createState() => _PathologicalLabDetailsState();
}

class _PathologicalLabDetailsState extends State<PathologicalLabDetails> {
  late List<Datum> pathList = [];
  List<Datum> finalPathList=[];
  late bool _loadPathList = true;

  PathTestList PList = PathTestList();
  Future<void> getPathTest() async {
    finalPathList = await PList.getPathTest();
    setState(() {

      pathList=finalPathList;
    });
    // print(_datum[0].doctorId);
    // print(finalDatum.length);
  }

  void initState() {
    super.initState();
    getPathTest();
    // print(_datum[0].doctorId);
    // _initUser();
    if (pathList != null) {
      setState(() {
        _loadPathList = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text('Pathological Lab',style: TextStyle(fontFamily: 'Roboto_Condensed',),),
      ),
      body: Container(
        color: Colors.lightBlue[50],
        child: Stack(
          children: [
            // ClipPath(
            //   clipper: MyClipper(),
            //   child: Container(
            //     height: 400,
            //     width: MediaQuery.of(context).size.height,
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         begin: Alignment.topLeft,
            //         end: Alignment.center,
            //         colors: [
            //           Theme.of(context).primaryColor,
            //           Theme.of(context).accentColor
            //         ] ,
            //       ),
            //     ),
            //   ),
            // ),

            Stack(
              children: [
                Container(
                  // color: Colors.green,
                  // height: 500,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      _searchBar(),

                      ElevatedButton(
                        onPressed: (){
                           Navigator.push(context,MaterialPageRoute(builder: (context) => PathologicalSingleTestBookingPage()));//=========== single Test
                        }, 
                        child: 
                        Text("Make your Own Test and Book")
                        ),
                      
                        ElevatedButton(
                          onPressed: (){
                             Navigator.push(context,MaterialPageRoute(builder: (context) => MultipleTestBooking ()));//=========== Pathological Multiple Test
                          }, 
                          child: 
                          Text("Book more than one Test")
                        ),

                      Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.all(15),
                          scrollDirection: Axis.vertical,
                          itemCount: pathList== null ? 0 : pathList.length,
                          itemBuilder: (BuildContext context,int index){
                            maxline:1;
                            return _listItem(index);

                          },
                          separatorBuilder: (BuildContext context, int index)=>const Divider(
                            color: Colors.transparent,
                          ),
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
    );
  }

  _searchBar(){
    return Container(
      margin: EdgeInsets.all(10),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: TextField(
          style: TextStyle(color: Theme.of(context).primaryColor),
          decoration: InputDecoration(
              icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
              hintText: 'type test name',
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              )
          ),
          onChanged: (text){
            text=text.toLowerCase();
            setState(() {
              pathList=finalPathList.where((element){
                var searchText=element.testName.toLowerCase();
                return searchText.contains(text);
              }).toList();
            });
          },

        ),
      ),
    );
  }

  _listItem(index){
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PathTestDetails(encId: pathList[index].encTestId)));},
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        // margin: EdgeInsets.only(left:15.0,),
        // color: Colors.blue,
        decoration: BoxDecoration(

          shape:BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15),
          gradient:LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.center,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor
            ] ,
          ),
        ),
        child: Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${pathList[index].testName}',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold,fontSize: 17,color: Colors.white),),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
