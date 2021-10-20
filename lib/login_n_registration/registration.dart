import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medbo/API/Login/ProgressHUD.dart';
import 'package:medbo/API/Login/loginAtFirst.dart';
import 'package:medbo/API/Registration/AfterRegistrationResPage.dart';
import 'package:medbo/API/Registration/RegistrationApiResponse.dart';
import 'package:medbo/login_n_registration/login.dart';
import 'package:medbo/login_n_registration/registrationDecoration.dart';
import 'package:http/http.dart' as http;

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
   bool isApiCallProcess = false;
  TextEditingController emailControler = TextEditingController();
  TextEditingController contactControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController conpasswordControler = TextEditingController();



  // var emailController = TextEditingController();
  // var passwordController = TextEditingController();
  // var phoneController = TextEditingController();
  // var rePasswordController = TextEditingController();

  // final TextEditingController email = new TextEditingController();
  // final TextEditingController contact = new TextEditingController();
  // final TextEditingController password = new TextEditingController();
  // final TextEditingController conpassword = new TextEditingController();






  // dynamic Status;
  // static String url = "http://medbo.digitalicon.in/api/medboapi/userreg";
  // Dio dio=Dio();


  // late TextEditingController _email;
  // late TextEditingController _phone;
  // late TextEditingController _password;
  // late TextEditingController _confirmpassword;
   late GlobalKey<FormState> _regformkey;

  @override
  void initState() {
    // TODO: implement initState
    _regformkey = GlobalKey<FormState>();
    emailControler=TextEditingController();
    contactControler=TextEditingController();
    passwordControler=TextEditingController();
    conpasswordControler=TextEditingController();
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
   emailControler.dispose();
     passwordControler.dispose();
    contactControler.dispose();
    conpasswordControler.dispose();
    super.dispose();
  }

  void validate(){
    if(_regformkey.currentState!.validate()){
      print("Validated");
      registrationOfuser(emailControler.text, contactControler.text, passwordControler.text, conpasswordControler.text) ;//==============registrationOfuser() API CALLr();
      setState(() {
       emailControler.clear();
       contactControler.clear();
       passwordControler.clear();
        conpasswordControler.clear();
      });
    }
    else if(_regformkey.currentState==null){
    
    }
    else{
      print('Not Validated');
    }
  }

  // Future registerUser() async{
  //   Map mapRegData={

  //       "Email": _email.text,
  //       "Mobile": _phone.text,
  //       "Password": _password.text,
  //       "RetypePassword":_confirmpassword.text,
  //   };
  //   print('RegData: $mapRegData');
  //   Response response=await dio.post(url,data: mapRegData);
  //   if(response.statusCode==200){
  //     print(response.data);
  //     print(response.data['Status']);
  //     Status=response.data['Status'];
  //     // return 'Registered';
  //   }
  // }
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
      // appBar:AppBar(
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.topCenter,
      //         colors: [
      //           Theme.of(context).primaryColor,
      //           Theme.of(context).accentColor
      //         ] ,
      //       ),
      //     ),
      //   ),
      //   title: Text('Register',style: TextStyle(fontFamily: 'Roboto_Condensed',),),
      // ),

      body: Container(
          color: Colors.lightBlue[50],
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            // padding: EdgeInsets.all(25),
              padding: EdgeInsets.only(left: 25, right: 25,top: 10),
            child: SingleChildScrollView(
              child: Form(
                key: _regformkey,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                         //width: MediaQuery.of(context).size.width,
                        height: blockSizeVertical*30,
                        width: blockSizeHorizontal*100,
                        child:
                         Image.network('https://i.postimg.cc/Bnfh4268/medbo-home-banner-removebg.png'),
                      ),
                    ),

                    Container(
                      height: blockSizeVertical*4.5,
                      alignment: Alignment.center,
                      // color: Colors.green,
                      child: Text("REGISTRATION",style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold,fontSize: 22,color: Theme.of(context).primaryColor),),
                    ),



                    //======================================================================E m a i l c o n t r o l l e r===================================================

                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          controller:emailControler,
                          //controller: _email,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail,size: 13.0,),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          // hintText: 'Enter your Email',
                          //hintStyle: TextStyle(color: Colors.grey),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.grey, fontSize: 14.5,fontFamily: 'Jost'),
                          
                        ),
                          validator: (value){
                            if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value!)){
                              return 'Please enter a valid Email';
                            }
                            else if(value==null){
                              emailControler='' as TextEditingController;
                            }
                            return null;
                          
                          },
                          onSaved: (value){
                           emailControler = value as TextEditingController;
                          },
                        ),
                      ),
                    ),




                    //===========================================================contact  c o n t r o l l e r=========================================================================================







                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          controller:contactControler,
                          //controller: _phone,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                          LengthLimitingTextInputFormatter(10),], //only 10 digit mobile number
                          decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone_android, size: 13.0,),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          // hintText: 'Enter your phone no',
                          // hintStyle: TextStyle(color: Colors.grey),
                          labelText: 'Enter your phone no',
                          labelStyle: TextStyle(color: Colors.grey, fontSize: 14.5,fontFamily: 'Jost'),
                        ),
                          validator: (value){
                            if(!RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$').hasMatch(value!)){
                              return "Please enter a valid phone number";
                            }
                            else if(value==null){
                              contactControler="" as TextEditingController ;
                            }
                            return null;
                          },
                          onSaved: (value){
                            contactControler = value as TextEditingController;
                          },
                        ),
                      ),
                    ),



                     //===========================================================Password c o n t r o l l e r=========================================================================================



                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                         controller: passwordControler,
                          //controller: _password,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          //decoration:buildInputDecoration("Password"),
                          decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, size: 13.0,),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          // hintText: 'Enter your password',
                          // hintStyle: TextStyle(color: Colors.grey),
                          labelText: 'Enter your password',
                          labelStyle: TextStyle(color: Colors.grey, fontSize: 14.5,fontFamily: 'Jost'),
                        ),
                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return 'Please a Enter Password';
                            }
                            return null;
                          },
                          onSaved: (value){
                            passwordControler = value ! as TextEditingController;
                          },

                        ),
                      ),
                    ),


                     //=========================================================== confirmation password  c o n t r o l l e r=========================================================================================



                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                           controller: conpasswordControler,
                          //controller: _confirmpassword,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          //decoration:buildInputDecoration("Confirm Password"),
                          decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock,size: 13.0,),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          // hintText: 'Re-type your password',
                          // hintStyle: TextStyle(color: Colors.grey),
                          labelText: 'Confirm your password',
                          labelStyle: TextStyle(color: Colors.grey, fontSize: 14.5,fontFamily: 'Jost'),
                        ),
                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return 'Please re-enter password';
                            }
                           print(passwordControler.text);

                            print(conpasswordControler.text);

                           if(passwordControler.text!=conpasswordControler.text){
                              return "Password does not match";
                            }
                           return null;
                         },
                          onSaved: (value){
                            conpasswordControler = value ! as TextEditingController;
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: blockSizeVertical*0.5,),

                    SizedBox(
                         height: blockSizeVertical*7.5,
                         width: blockSizeHorizontal*58,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: (){
                          setState(() {
                        isApiCallProcess = false;
                      });
                          //registrationOfuser(emailControler.text, contactControler.text, passwordControler.text, conpasswordControler.text) ;//==============registrationOfuser() API CALL
                          validate();
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginAtFirst()
                          //   ),);

                        },

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),

                        ),
                        textColor:Colors.white,child: Text("Submit"), //===================Registration Submit button


                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.green,
                        child: Text('Already have an account ?',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 15),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginAtFirst()));},// =================== L O G I N   P A G E  if user want to login insted of registration
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          // color: Colors.green,
                          child: Text('Login',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 22,fontWeight: FontWeight.bold,),),
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





  //===============================================================================

    registrationOfuser(String  email, contact, pass,conpass) async{
    var jsonResponse ;
    Map data = {
      
      'Email': email,
      'Mobile': contact,
      'Password': pass,
      'RetypePassword': conpass,
    };
    print(data);

     String body = json.encode(data);
    var url = 'https://medbo.in/api/medboapi/userreg';
    var response = await http.post(
     Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      setState(() {
          isApiCallProcess = false;//progress bar hide
        });
       jsonResponse = json.decode(response.body.toString());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(" ${jsonResponse['Message']}"),backgroundColor: Color(0xFF152A38),)) ;
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> LoginAtFirst()), (route) => false); 

        
      print('success');
    } else {
      setState(() {
          isApiCallProcess = false;//progress bar hide
        });
      print('error');
    }


    // var jsonResponse ;
    // if (emailController.text.isNotEmpty && phoneController.text.isNotEmpty && passwordController.text.isNotEmpty && rePasswordController.text.isNotEmpty){
    //   var response=await http.post(Uri.parse("http://medbo.digitalicon.in/api/medboapi/userreg"),
    //   body:({
    //     'Email':emailController.text,
    //     'Mobile':phoneController,
    //     'Password':passwordController,
    //     'RetypePassword':rePasswordController,
    //   }));

    //   if (response.statusCode == 200) {
    //     print("Correct");
    //     print(response.body);
    //     jsonResponse = json.decode(response.body.toString());
    //     print(jsonResponse);
    //     //Navigator.push(context, MaterialPageRoute(builder: (context)=>AfterRegistrationResPage(response: RegistrationApiResponse.fromJson(jsonResponse)))); 

    //      ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content:Text(" ${jsonResponse['Message']}"))) ;      
    //      }




    //      else {
    //     print("Noooooo Response from API  404");
    //     print(response.body);
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(SnackBar(content: Text("Invalid credentials")));
    //   }
    // } else {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text("Blank field is not allowed")));
    // }



   // }
  }

}