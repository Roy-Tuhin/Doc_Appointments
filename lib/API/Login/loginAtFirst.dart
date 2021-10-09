import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:medbo/API/Login/ApiResponse.dart';
import 'package:medbo/API/Login/afterLoginResPage.dart';
import 'package:medbo/login_n_registration/registration.dart';
import 'package:medbo/models/loginModel.dart';
import 'package:http/http.dart' as http;
import 'package:medbo/screen_helper/side_drawer.dart';
import 'package:medbo/screens/home.dart';
import 'package:medbo/screens2.dart/home2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ProgressHUD.dart';

class LoginAtFirst extends StatefulWidget {
  @override
  _LoginAtFirstState createState() => _LoginAtFirstState();
}

class _LoginAtFirstState extends State<LoginAtFirst> {
  bool isApiCallProcess = false;
  bool hidepassword = true;
  var emailController = TextEditingController();
  var passwordontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    //HERE WE CHECK IF USER ALREADY LOGIN OR CREDENTIAL ALREADY AVAOLABLE OR NOT
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString("userEmail"); //userEmail is the key: And the value will be `Name` in APIabc@gmail.com
    String? encVal = pref.getString("encId");
    if (val != null && encVal!=null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home2()), (route) => false);
    }
  }

  late TextEditingController _userid;
  late TextEditingController _password;

  // static String url = "http://medbo.digitalicon.in/api/medboapi/login";
  // Dio dio = Dio();

  // late GlobalKey<FormState> formkey;
  // dynamic userData = UserData(name: '', encUserId: '');

  // void initState() {
  //   formkey = GlobalKey<FormState>();
  //   _userid = TextEditingController();
  //   _password = TextEditingController();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _userid.dispose();
  //   _password.dispose();
  //   super.dispose();
  // }

  // void validate() {
  //   if (formkey.currentState!.validate()) {
  //     print("Validated");
  //     loginUser();
  //     setState(() {
  //       _password.clear();
  //       _userid.clear();
  //     });
  //   } else {
  //     print('Not Validated');
  //   }
  // }

  Future loginUser() async {
    Map mapData = {
      'LoginId': _userid.text,
      "Password": _password.text,
    };
    print("Json Data: $mapData");

    // Response response = await dio.post(url, data: mapData);
    // ignore: unrelated_type_equality_checks
    // if (response.statusCode == 200) {
    //   // print("logged in");
    //   print(response.data);

    // UserData loginuserdata = UserData(
    //     name: response.data['UserData']['Name'],
    //     encUserId: response.data['UserData']['EncUserId']);

    // setState(() {
    //   userData = loginuserdata;
    // });
    // } else {
    //   print(response.statusMessage);
    // }
    // // print(userData.name);
    // print(response.data['Status']);
    // dynamic status = response.data['Status'];
    // if (status == 1) {
    //   return 'User Logged in';
    // }
  }

  bool isEmail(input) =>
      RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(input);
  bool isPhone(input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidth/100);
    var blockSizeVertical= (screenHeight/100);
    return Scaffold(
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.topCenter,
      //         colors: [
      //           Theme.of(context).primaryColor,
      //           Theme.of(context).accentColor
      //         ],
      //       ),
      //     ),
      //   ),
      //   title: Text(
      //     'LOGIN',
      //     style: TextStyle(
      //       fontFamily: 'Roboto_Condensed',
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Container(
          color: Colors.lightBlue[50],
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          //height: blockSizeVertical*100,
          child: Padding(
            //padding: EdgeInsets.all(25),
            padding: EdgeInsets.only(left: 25, right: 25, top: 10),
            child: SingleChildScrollView(
              child: Form(
                // key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      // padding: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Container(
                        //width: MediaQuery.of(context).size.width,
                         height: blockSizeVertical*35,
                        width: blockSizeHorizontal*100,
                        //color: Colors.white,
                        child: 
                        // Image(
                        //   image:
                        //       AssetImage('assets/images/medbo-home-banner-removebg.png'),
                        //   fit: BoxFit.contain,
                        // ),
                         Image.network('https://i.postimg.cc/Bnfh4268/medbo-home-banner-removebg.png'),
                      ),
                    ),
                    Container(
                      //color: Colors.blue,
                     height: blockSizeVertical*8,
                      alignment: Alignment.center,
                      // color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WELCOME TO MEDBO",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            "Medbo(Care close to you) ",
                            style: TextStyle(
                                fontFamily: 'Roboto_Condensed',
                                fontSize: 15,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
      
                        ////////////////////////Enter email//////////////////////////////
      
                        child: TextFormField(
                          controller: emailController,
                          // controller: _userid,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.mail,
                                size: 13.0,
                              ),
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              //hintText: 'Enter your Email | Phone no.',
                              //hintStyle: TextStyle(color: Colors.grey),
                              labelText: 'Enter your Email | Phone no.',
                              labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontFamily: 'Jost')),
                          validator: (value) {
                            if (!isEmail(value) && !isPhone(value)) {
                              return 'Please enter a valid email or phone number.';
                            }
                            return null;
                          },
                          onSaved: (name) {
                            _userid = name as TextEditingController;
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
      
                        ////////////////////////////Password//////////////////////////////
      
                        child: TextFormField(
                          controller: passwordontroller, //================
                          // controller: _password,
                          obscureText: hidepassword,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                size: 13.0,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidepassword = !hidepassword;
                                  });
                                },
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.4),
                                icon: Icon(
                                  hidepassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 17,
                                ),
                              ),
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              // hintText: 'Enter your password',
                              // hintStyle: TextStyle(color: Colors.grey),
                              labelText: 'Enter your password',
                              labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontFamily: 'Jost')),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter password';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (pass) {
                            _password = pass as TextEditingController;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        alignment: Alignment.centerRight,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.green,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    InkWell(
                      // onTap: validate,
                      onTap: () {
                        setState(() {
                          isApiCallProcess = true;
                        });
                        login(); ////////////////////////////////////////////////////////=========================login() API F U N C T I O N==============================================
                        // validate();
                        // Navigator.of(context).pushNamed('/');
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                         height: blockSizeVertical*7.5,
                         width: blockSizeHorizontal*60,
                        // margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    Container(
                      // color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // margin: const EdgeInsets.all(5.0),
                            alignment: Alignment.center,
                            height: blockSizeVertical*7.5,
                            width: blockSizeHorizontal*38.5,
                            // margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            child: Text(
                              'G login',
                              style: TextStyle(color: Colors.white, fontSize: 17,fontFamily: 'Poppins'),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5.0),
                            alignment: Alignment.center,
                           height: blockSizeVertical*7.5,
                            width: blockSizeHorizontal*38.5,
                            // margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.lightBlue[900],
                            ),
                            child: Text(
                              'F login',
                              style: TextStyle(color: Colors.white, fontSize: 17,fontFamily: 'Poppins'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.green,
                        child: Text(
                          'Do not have an account ?',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          //=============================================================================Registration=====================================================
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registration()));
                        }, //=============================================================================Registration=====================================================
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          // color: Colors.green,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

/////////////////////////////////////////After login Response//////////////////////
  Future<void> login() async {
    var jsonResponse;
    if (passwordontroller.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse("https://medbo.in/api/medboapi/login"),
          body: ({
            'LoginId': emailController.text,
            'Password': passwordontroller.text
          }));
      if (response.statusCode == 200) {
        setState(() {
          isApiCallProcess = false;//progress bar hide
        });
        print("Correct");
        print(response.body);
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>AfterLoginResPage(rresponse: ApiResponse.fromJson(jsonResponse))));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(" ${jsonResponse['Message']}"),
          backgroundColor: Color(0xFF152A38),
        ));
        pageRoute(
          jsonResponse['UserData']['Name'],
          jsonResponse['UserData']['EncUserId'],
        ); // WANT TO SHOW USER NAME IN APP DRAWER AFTER LOGIN WITH CORRECT CREDENTIALS
      } else {
        print("Wronggooooooooooooooooooooooooooo");
        print(response.body);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid credentials")));
      }
    } else {
      setState(() {
          isApiCallProcess = false;//progress bar hide
        });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Blank field is not allowed"),
        backgroundColor: Color(0xFFAF0404),
      ));
    }
  }

  void pageRoute(
    String Name, String EncUserId,
  ) async {
    //HERE WE STORE VALUE OR TOKEN INSIDE SHARED PREFERENCE

    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("userEmail", Name,);
    await pref.setString( "encId", EncUserId); // KEY : VALUE
    //Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Home2()), (route) => false);
  }
}
