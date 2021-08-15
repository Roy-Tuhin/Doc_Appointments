import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
// import 'package:medbo/screens/home.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medbo/API/Login/ApiResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medbo/login_n_registration/login.dart';



class SideDrawer extends StatefulWidget {
  
  const SideDrawer({Key? key}) : super(key: key);



  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {



//=====================================================================================S H O W   USER  DETIALS IN APP DRAWER WITH SHARED PREFERENCES====================================================

String Name="";

void initState(){
  super.initState();
  getCred();
}

void getCred() async{
  //HERE WE FETCH OUR CREDENTIALS FROM SHARED PREF 
  SharedPreferences pref = await SharedPreferences.getInstance();
  setState(() {
    Name = pref.getString("userEmail");
  });

}
//=====================================================================================S H O W   USER  DETIALS IN APP DRAWER WITH SHARED PREFERENCES====================================================













  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(//==================================================Drawer
        // child: Text('drawer'),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              // color: Theme.of(context).primaryColor,
              decoration: BoxDecoration(
                gradient:LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.center,
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).accentColor
                  ] ,
                ),
              ),
              child: Center(
                // mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.start,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // direction: Axis.vertical,
                  // spacing: 5.0,
                  // runSpacing: 2.0,
                  children: [
                    Container(
                      width: 100,
                      height: 100,

                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/medbo-doctors.png"),
                          fit: BoxFit.contain,
                        ),
                        border: Border.all(color: Colors.white,width: 4),
                      ),
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'Roboto_Condensed'),
                        ),
                        // Text(
                        //   'android.studio@android.com',
                        //   style: TextStyle(color: Colors.white),
                        // ),




                       Text(
                         " ${Name}",
                          style: TextStyle(color: Colors.white),
                         ),


                  

                      ],
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Theme.of(context).accentColor),
              title: Text(
                'Home',
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/');
              },
            ),
            ListTile(
              leading: Icon(Icons.design_services,
                  color: Theme.of(context).accentColor),
              title: Text(
                'Services',
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/services');
                
              }
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'About',
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/about');
              },
            ),
            // ListTile(
            //   leading:
            //       Icon(TablerIcons.text_wrap, color: Theme.of(context).accentColor),
            //   title: Text(
            //     'Blogs',
            //     style: TextStyle(color: Theme.of(context).accentColor),
            //   ),
            //   onTap: () {
            //     Navigator.of(context).pop();
            //     Navigator.of(context).pushNamed('/blogs');
            //   },
            // ),
            ListTile(
              leading:
                  Icon(Icons.settings, color: Theme.of(context).accentColor),
              title: Text(
                'Setting',
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/settings');
              },
            ),
          ],
        ),
      ),
    );
  }
}
