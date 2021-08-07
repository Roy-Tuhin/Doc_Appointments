import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medbo/models/allDoctorsModel.dart';
import 'package:medbo/onTapScreens/doctorDetails.dart';
import 'package:medbo/parsing/allDoctors.dart';

import '../screen_helper/clip_path.dart';

class DoctorServices extends StatefulWidget {
  @override
  _DoctorServicesState createState() => _DoctorServicesState();
}

class _DoctorServicesState extends State<DoctorServices> {
  late List<Datum> _datum = [];
  List<Datum> finalDatum=[];
  // List<Datum> finalDatum=[];

  late bool _loading = true;
  AllDoctorsList doctorList = AllDoctorsList();
  Future<void> getDocs() async {
    finalDatum = await doctorList.getDocs();
    setState(() {
      _datum=finalDatum;
    });
    // print(_datum[0].doctorId);
    // print(_datum.length);
  }

  void initState() {
    super.initState();
    getDocs();
    // print(_datum[0].doctorId);
    // _initUser();
    if (_datum != null) {
      setState(() {
        _loading = false;
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
              ],
            ),
          ),
        ),
        title: Text(
          'DOCTORS',
          style: TextStyle(
            fontFamily: 'Roboto_Condensed',
          ),
        ),
      ),
      // drawer: SideDrawer,
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
                    ],
                  ),
                ),
              ),
            ),

            Column(
              children: [

                _searchBar(),

                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(15),
                    scrollDirection: Axis.vertical,
                    itemCount: _datum== null ? 0 : _datum.length,
                    itemBuilder: (BuildContext context, int index) {
                     return _listItem(index);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      color: Colors.transparent,
                    ),
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
            hintText: 'type doctor name',
            hintStyle: Theme.of(context).textTheme.caption!.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )
          ),
          onChanged: (text){
            text=text.toLowerCase();
            setState(() {
              _datum=finalDatum.where((element){
                // if (searchText= element.specialisation) {
                  var searchText = element.specialisation.toLowerCase();
                // } else {
                //   var searchText = ;
                // }
                return searchText.contains(text);
              }).toList();
            });
          },

        ),
      ),
    );
  }

  _listItem(index) {
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDetails(encId: _datum[index].encDoctorId)));},
      child: Container(
        // color: Colors.green,
        height: 120,
        child: Row(
          children: [
            Stack(children: [
              Container(
                // padding: EdgeInsets.only(top: 5,bottom: 5),
                height: 100,
                width: 100,
                // color: Colors.grey[800],
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  shape: BoxShape.rectangle,
                  borderRadius:
                  BorderRadius.all(Radius.circular(10.0)),
                ),
              ),

              Container(
                // margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(top: 2,bottom: 2),
                height: 100,
                width: 100,
                // margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Image.network(_datum[index].doctorImage,fit: BoxFit.contain,),
              ),
            ]),
            Expanded(
              child: Container(
                height: 100,
                // width: 300,
                margin: EdgeInsets.only(
                    left: 15.0,
                    top: 0.0,
                    right: 0.0,
                    bottom: 0.0),
                // color: Colors.blue,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.center,
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor
                    ],
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_datum[index].doctorName}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Roboto_Condensed',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        // padding: EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          '${_datum[index].qualification}',
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'Roboto_Condensed',
                          ),
                        ),
                      ),
                      Container(
                        // color: Colors.green,
                        // height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        width: 220,
                        child: Text((() {
                                  var str=_datum[index].specialisation.toString();
                                  if(str.length>3){
                                  return '${_datum[index].specialisation.toString().substring(0,7)} '+ '...';}

                                  return "${_datum[index].specialisation}";
                                  })(),style: TextStyle(fontFamily: 'Roboto_Condensed',
                            // fontWeight: FontWeight.bold,
                            fontSize: 12,color: Colors.white),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


