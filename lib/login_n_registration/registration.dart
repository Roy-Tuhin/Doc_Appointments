import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medbo/login_n_registration/login.dart';
import 'package:medbo/login_n_registration/registrationDecoration.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  dynamic Status;
  static String url = "http://medbo.digitalicon.in/api/medboapi/userreg";
  Dio dio=Dio();


  late TextEditingController _email;
  late TextEditingController _phone;
  late TextEditingController _password;
  late TextEditingController _confirmpassword;
  late GlobalKey<FormState> _regformkey;

  @override
  void initState() {
    // TODO: implement initState
    _regformkey = GlobalKey<FormState>();
    _email=TextEditingController();
    _phone=TextEditingController();
    _password=TextEditingController();
    _confirmpassword=TextEditingController();
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    _phone.dispose();
    _confirmpassword.dispose();
    super.dispose();
  }

  void validate(){
    if(_regformkey.currentState!.validate()){
      print("Validated");
      registerUser();
      setState(() {
        _email.clear();
        _phone.clear();
        _password.clear();
        _confirmpassword.clear();
      });
    }
    // else if(_regformkey.currentState==null){
    //
    // }
    else{
      print('Not Validated');
    }
  }

  Future registerUser() async{
    Map mapRegData={

        "Email": _email.text,
        "Mobile": _phone.text,
        "Password": _password.text,
        "RetypePassword":_confirmpassword.text,
    };
    print('RegData: $mapRegData');
    Response response=await dio.post(url,data: mapRegData);
    if(response.statusCode==200){
      print(response.data);
      print(response.data['Status']);
      Status=response.data['Status'];
      // return 'Registered';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
        title: Text('Register',style: TextStyle(fontFamily: 'Roboto_Condensed',),),
      ),

      body: Container(
          color: Colors.lightBlue[50],
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Form(
                key: _regformkey,
                child:
                Column(
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
                        child:
                        Image(image: AssetImage('assets/images/medbo-home-banner.png'),fit: BoxFit.contain,),
                      ),
                    ),

                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      // color: Colors.green,
                      child: Text("REGISTRATION",style: TextStyle(fontFamily: 'Roboto_Condensed',fontWeight: FontWeight.bold,fontSize: 22,color: Theme.of(context).primaryColor),),
                    ),

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
                          controller: _email,
                          keyboardType: TextInputType.text,
                          decoration:buildInputDecoration("Email"),
                          // validator: (value){
                          //   if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value!)){
                          //     return 'Please a valid Email';
                          //   }
                          //   // else if(value==null){
                          //   //   _email='' as TextEditingController;
                          //   // }
                          //   return null;
                          //
                          // },
                          onSaved: (value){
                            _email = value as TextEditingController;
                          },
                        ),
                      ),
                    ),

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
                          controller: _phone,
                          keyboardType: TextInputType.number,
                          decoration:buildInputDecoration("Phone No"),
                          // validator: (value){
                          //   if(!RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$').hasMatch(value!)){
                          //     return "Please enter a valid phone number";
                          //   }
                          //   // else if(value==null){
                          //   //   _phone="" as TextEditingController ;
                          //   // }
                          //   return null;
                          // },
                          onSaved: (value){
                            _phone = value as TextEditingController;
                          },
                        ),
                      ),
                    ),

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
                          controller: _password,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration:buildInputDecoration("Password"),
                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return 'Please a Enter Password';
                            }
                            return null;
                          },
                          onSaved: (value){
                            _password = value ! as TextEditingController;
                          },

                        ),
                      ),
                    ),

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
                          controller: _confirmpassword,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration:buildInputDecoration("Confirm Password"),
                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return 'Please re-enter password';
                            }
                            print(_password.text);

                            print(_confirmpassword.text);

                            if(_password.text!=_confirmpassword.text){
                              return "Password does not match";
                            }
                            return null;
                          },
                          onSaved: (value){
                            _confirmpassword = value ! as TextEditingController;
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 5,),

                    SizedBox(
                      width: 200,
                      height: 50,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: (){
                          validate();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()
                            ),);

                        },

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),

                        ),
                        textColor:Colors.white,child: Text("Submit"),


                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.green,
                        child: Text('already have an account ?',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 15),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));},
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          // color: Colors.green,
                          child: Text('Login',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20),),
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
}
