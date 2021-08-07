import 'package:flutter/material.dart';
import 'package:medbo/models/allSurgicalPackModels.dart';
import 'package:medbo/onTapScreens/surgicalPackageDetails.dart';
import 'package:medbo/parsing/allSurgicalPack.dart';

import '../screen_helper/clip_path.dart';
class SurgicalPackageDetails extends StatefulWidget {

  // final List<String> amount=<String>['300','500','300','500','300','500','300','500','300','500','300','500',];
  // final List<String> packageName=<String>['Knee joint','Elbow joint','Knee joint','Elbow joint','Knee joint','Elbow joint','Knee joint','Elbow joint','Knee joint','Elbow joint','Knee joint','Elbow joint'];
  @override
  _SurgicalPackageDetailsState createState() => _SurgicalPackageDetailsState();
}

class _SurgicalPackageDetailsState extends State<SurgicalPackageDetails> {
  late List<Data> surglist=[];
  List<Data> finalsurglist=[];

  late bool _loading = true;
  AllSurgPackList doctorList = AllSurgPackList();
  Future<void> getSPlist() async {
    finalsurglist = await doctorList.getSPList();
    setState(() {
      surglist=finalsurglist;
    });
    // print(_datum[0].doctorId);
    print(finalsurglist.length);
  }

  void initState() {
    super.initState();
    getSPlist();
    // print(_datum[0].doctorId);
    // _initUser();
    if (surglist != null) {
      setState(() {
        _loading = false;
      });
    }
    // else{
    //   getDocs();
    // }
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
        title: Text('Surgical Packages',style: TextStyle(fontFamily: 'Roboto_Condensed',),),
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
                          itemCount: surglist== null ? 0 : surglist.length,
                          itemBuilder: (BuildContext context,int index){
                           return _listItems(index);
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
              hintText: 'type package name',
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              )
          ),
          onChanged: (text){
            text=text.toLowerCase();
            setState(() {
              surglist=finalsurglist.where((element){
                var searchText=element.packageName.toLowerCase();
                return searchText.contains(text);
              }).toList();
            });
          },

        ),
      ),
    );
  }

  _listItems(index){
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SurgPackDetails(encId: surglist[index].encPackageId)));},
      child: Container(
        height: 100,
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
        child: Container(
          padding:EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('${surglist[index].packageName}',style: TextStyle(fontFamily: 'Roboto_Condensed',fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                ),

                Container(
                  // color: Colors.green,
                  // height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  width: 300,
                  child: Text('${surglist[index].description}',style: TextStyle(fontFamily: 'Roboto_Condensed',
                      // fontWeight: FontWeight.bold,
                      fontSize: 12,color: Colors.white),),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
