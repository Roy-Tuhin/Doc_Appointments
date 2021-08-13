import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medbo/API/Login/ApiResponse.dart';
import 'package:medbo/API/Login/afterLoginResPage.dart';
import 'package:medbo/login_n_registration/registration.dart';
import 'package:medbo/models/loginModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final box = GetStorage(); 
  var emailController = TextEditingController();
  var passwordontroller = TextEditingController();









  late TextEditingController _userid;
  late TextEditingController _password;

  static String url = "http://medbo.digitalicon.in/api/medboapi/login";
  Dio dio = Dio();

  late GlobalKey<FormState> formkey;
  // dynamic userData = UserData(name: '', encUserId: '');

  void initState() {
    formkey = GlobalKey<FormState>();
    _userid = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userid.dispose();
    _password.dispose();
    super.dispose();
  }

  void validate() {
    if (formkey.currentState!.validate()) {
      print("Validated");
      loginUser();
      setState(() {
        _password.clear();
        _userid.clear();
      });
    } else {
      print('Not Validated');
    }
  }

  Future loginUser() async {
    Map mapData = {
      'LoginId': _userid.text,
      "Password": _password.text,
    };
    print("Json Data: $mapData");

    Response response = await dio.post(url, data: mapData);
    // ignore: unrelated_type_equality_checks
    if (response.statusCode == 200) {
      // print("logged in");
      print(response.data);

      // UserData loginuserdata = UserData(
      //     name: response.data['UserData']['Name'],
      //     encUserId: response.data['UserData']['EncUserId']);

      // setState(() {
      //   userData = loginuserdata;
      // });
    } else {
      print(response.statusMessage);
    }
    // print(userData.name);
    print(response.data['Status']);
    dynamic status = response.data['Status'];
    if (status == 1) {
      return 'User Logged in';
    }
  }

  bool isEmail(input) =>
      RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(input);
  bool isPhone(input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

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
          'LOGIN',
          style: TextStyle(
            fontFamily: 'Roboto_Condensed',
          ),
        ),
      ),
      body: Container(
        color: Colors.lightBlue[50],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // width: MediaQuery.of(context).size.width,
                      height: 250,
                      width: 250,
                      color: Colors.white,
                      child: Image(
                        image:
                            AssetImage('assets/images/medbo-home-banner.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    // color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WELCOME TO MEDBO",
                          style: TextStyle(
                              fontFamily: 'Roboto_Condensed',
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
                        controller:emailController,//=================
                        // controller: _userid,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: 'Enter your Email | Phone no.',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
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
                        controller:passwordontroller, //================
                        // controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
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
                        'forgot password?',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  InkWell(
                    // onTap: validate,
                    onTap: () {
                      login() ;////////////////////////////////////////////////////////=========================login() F U N C T I O N==============================================
                      // validate();
                      // Navigator.of(context).pushNamed('/');
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      height: 50,
                      width: 250,
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
                          height: 50,
                          width: 150,
                          // margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                          ),
                          child: Text(
                            'G login',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          alignment: Alignment.center,
                          height: 50,
                          width: 150,
                          // margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lightBlue[900],
                          ),
                          child: Text(
                            'F login',
                            style: TextStyle(color: Colors.white, fontSize: 18),
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
                        'do not have an account ?',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: () {//=============================================================================Registration=====================================================
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Registration()));
                      },//=============================================================================Registration=====================================================
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.green,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
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
    );
  }





/////////////////////////////////////////After login Response//////////////////////
  Future<void> login() async{
    var jsonResponse;
    if (passwordontroller.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await http.post(Uri.parse("http://medbo.digitalicon.in/api/medboapi/login"),
          body: ({
            'LoginId': emailController.text,
            'Password': passwordontroller.text
          }));
      if (response.statusCode == 200) {
         print("Correct");
         print(response.body);
         jsonResponse = json.decode(response.body.toString());
         print(jsonResponse);
       // Navigator.push(context, MaterialPageRoute(builder: (context)=>AfterLoginResPage(rresponse: ApiResponse.fromJson(jsonResponse))));
      

         ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content:Text(" ${jsonResponse['Message']}")));   

          pageRoute(jsonResponse['UserData']['Name'],); // WANT TO SHOW USER NAME IN APP DRAWER
      }
      
      
      
      
      
      
       else {
        print("Wronggooooooooooooooooooooooooooo");
        print(response.body);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid credentials")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank field is not allowed")));
    }

  }


  void pageRoute(String Name,) async {
    //HERE WE STORE VALUE OR TOKEN INSIDE SHARED PREFERENCE

    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("login", Name);// KEY : VALUE
  }


}



