import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medbo/models/allHealthchkupModel.dart';
import 'package:medbo/onTapScreens/healthchkupDetails.dart';
import 'package:medbo/parsing/allHelalthchkups.dart';

import '../screen_helper/clip_path.dart';
class HealthCheckupDetails extends StatefulWidget {

  // final List<String> amount=<String>['1200','1600','1200','1600','1200','1600','1200','1600','1200','1600','1200','1600',];
  // final List<String> packageName=<String>['Checkup Package X','Checkup Package Y','Checkup Package X','Checkup Package Y','Checkup Package X','Checkup Package Y','Checkup Package X','Checkup Package Y','Checkup Package X','Checkup Package Y','Checkup Package X','Checkup Package Y',];

  @override
  _HealthCheckupDetailsState createState() => _HealthCheckupDetailsState();
}

class _HealthCheckupDetailsState extends State<HealthCheckupDetails> {

  late List<Datum> chkUpList = [];
  List<Datum> finalchkUpList=[];
  late bool _loadChkUpList = true;

  HlthChkUpList HList = HlthChkUpList();
  Future<void> getHList() async {
    finalchkUpList = await HList.getHlthChkUps();
    setState(() {

      chkUpList=finalchkUpList;
    });
    // print(chkUpList[0].testName);
    print(finalchkUpList.length);
  }

  void initState() {
    super.initState();
    getHList();
    // print(_datum[0].doctorId);
    // _initUser();
    if (chkUpList != null) {
      setState(() {
        _loadChkUpList = false;
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
        title: Text('Health Checkups',style: TextStyle(fontFamily: 'Roboto_Condensed',),),
      ),
      body: Container(
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

                      _searchBar(),

                      Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.all(15),
                          scrollDirection: Axis.vertical,
                          itemCount: chkUpList== null ? 0 : chkUpList.length,
                          itemBuilder: (BuildContext context,int index){
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
              hintText: 'type check_up name',
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              )
          ),
          onChanged: (text){
            text=text.toLowerCase();
            setState(() {
              chkUpList=finalchkUpList.where((element){
                var searchText=element.healthName.toLowerCase();
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
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HlthChkUpDetails(encId: chkUpList[index].encHealthPartnerId)));},
      child: Container(
        // color: Colors.green,
        height: 100,
        child: Container(
          height: 80,
          width: 300,
          // margin: EdgeInsets.only(left:15.0,top: 0.0,right: 0.0,bottom: 0.0),
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
          child: Container(
            padding:EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text('${chkUpList[index].healthName}',style: TextStyle(fontFamily: 'Roboto_Condensed',fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                  ),
                  Container(
                    // color: Colors.green,
                    // height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    width: 300,
                    child: Text('${chkUpList[index].testName}',style: TextStyle(fontFamily: 'Roboto_Condensed',
                        // fontWeight: FontWeight.bold,
                        fontSize: 12,color: Colors.white),),
                  ),

                ]
            ),
          ),
        ),
      ),
    );
  }

}
