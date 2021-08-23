import 'package:flutter/material.dart';
import 'package:medbo/API/Login/loginAtFirst.dart';
import 'package:medbo/login_n_registration/login.dart';
import 'package:medbo/screen_helper/side_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidth/100);
    var blockSizeVertical= (screenHeight/100);
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
          title: Text(
            'SETTINGS',
            style: TextStyle(fontFamily: 'Poppins'),
          )),
     
     
     
     
     
     
     
      drawer:SideDrawer(),





      
      body: SingleChildScrollView(
        child: Container(
          height: blockSizeVertical*100,
          width: MediaQuery.of(context).size.width,
          color: Colors.lightBlue[50],
          //color: Colors.black,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: blockSizeVertical*50,
                  //color: Colors.white,
                  child: Image(
                    image: AssetImage('assets/images/medbo-home-banner-removebg.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: blockSizeVertical*0.5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 250,
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
                    'PROFILE',//========================================================================
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jost',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 250,
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
                    'BOOKING',//========================================================================
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jost',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 250,
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
                    'CUSTOMER SERVICES',//========================================================================
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto_Condensed',
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async{
                  SharedPreferences pref = await SharedPreferences.getInstance();//////////////////////////////////////////LOGOUT AND CLEAR MEMORY
                      await pref.clear();
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> LoginAtFirst()), (route) => false);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Logout()));//============================= Login material page// here have to implement logout
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 250,
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
                      'LOGOUT',//========================================================================
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto_Condensed',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
