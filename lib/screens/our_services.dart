import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medbo/listPages/allHealthChkupList.dart';
import 'package:medbo/listPages/allpathologicalLabsList.dart';
import 'package:medbo/listPages/allSurgicalPackageList.dart';
import 'package:medbo/screen_helper/clip_path.dart';
import 'package:medbo/listPages/allDoctorList.dart';
import 'package:medbo/screen_helper/side_drawer.dart';

class Services extends StatefulWidget {
  // const Services({Key? key}) : super(key: key);//##########################################make it normal

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
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
          'OUR SERVICES',
          style: TextStyle(
            fontFamily: 'Roboto_Condensed',
          ),
        ),
      ),
      drawer: SideDrawer(),
      body: Container(
        color: Colors.lightBlue[50],
        child: Stack(
          alignment: Alignment.topCenter,
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
            Column(children: [
              Container(
                  child: SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'MEDBO SERVICES',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto_Condensed'),
                    )),
              )),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    padding: EdgeInsets.all(15),
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoctorServices()));
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/medbo-doctors.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                // SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    "Doctors",
                                    style: TextStyle(
                                        fontFamily: 'Roboto_Condensed',
                                        fontSize: 17,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SurgicalPackageDetails()));
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/medbo-surgical-packages.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                // SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    "Surgerical Package",
                                    style: TextStyle(
                                        fontFamily: 'Roboto_Condensed',
                                        fontSize: 17,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PathologicalLabDetails()));
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/medbo-pathological-tests.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                // SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    "Pathological Tests",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Theme.of(context).primaryColor,
                                        fontFamily: 'Roboto_Condensed'),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HealthCheckupDetails()));
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/medbo-health-checkups.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                // SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    "Health Checkups",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Theme.of(context).primaryColor,
                                        fontFamily: 'Roboto_Condensed'),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
