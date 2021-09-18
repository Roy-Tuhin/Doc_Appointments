import 'dart:convert';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:medbo/Booking/DieticianAfterDateSelect/DieticianAfterDateSelectPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../DieticianEncBookingIdModel.dart';

import 'package:path/path.dart' as Path;
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:http_parser/http_parser.dart';

class PathologicalSingleTestBookingPage extends StatefulWidget {
  PathologicalSingleTestBookingPage() : super();

  @override
  _PathologicalSingleTestBookingPageState createState() =>
      _PathologicalSingleTestBookingPageState();
}

class _PathologicalSingleTestBookingPageState
    extends State<PathologicalSingleTestBookingPage> {
  var _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? image;

  var testTextController = TextEditingController();

  //=====================================================================================S H O W   USER  DETIALS IN APP DRAWER WITH SHARED PREFERENCES====================================================

  String Name = "";
  String EncUserId = "";

  void initState() {
    super.initState();
    getCred();
  }

  void getCred() async {
    //HERE WE FETCH OUR CREDENTIALS FROM SHARED PREF
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      Name = pref.getString("userEmail");
      EncUserId = pref.getString("encId");
    });
  }
//=====================================================================================S H O W   USER  DETIALS IN APP DRAWER WITH SHARED PREFERENCES====================================================

  // late Future<File> imageFile;

  //  pickImageFromGallery(ImageSource  source){
  //    setState(() {
  //      imageFile = ImagePicker.pickImage(source: source);
  //    });
  // }

  // Widget? showImage(){
  //   return FutureBuilder<File>(
  //     future: imageFile,
  //     builder: (BuildContext context, AsyncSnapshot<File> snapshot){
  //       if(snapshot.connectionState == ConnectionState.done && snapshot.data !=null){

  //         return Image.file(
  //           snapshot.data,
  //           width: 300,
  //           height: 300,
  //         );
  //       } else if (snapshot.error != null){
  //         return const Text('Error picking Image');
  //       }else{
  //          return const Text('No image selected');
  //       }
  //     },
  //   );
  // }

//=============================================================================================
  String _selectedDate = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    // final List<Widget> children = <Widget>[];//////

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidth / 100);
    var blockSizeVertical = (screenHeight / 100);

    return Scaffold(
            backgroundColor: Color(0XFFF3F1F5),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
         preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Own Test ',
                        style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF09948e),
              fontWeight: FontWeight.w700,
              fontSize: 20,
                        ),),
              
              
                Text('Request',style: TextStyle(
              fontFamily: 'Poppins',
                color: Color(0xFFf1c57d),
              fontWeight: FontWeight.w700,
               fontSize: 20,
                        ),),
              ],
                        ),
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.topLeft,
              //     end: Alignment.topCenter,
              //     colors: [
              //       Color(0xffFAF3F3).withOpacity(0.3),
              //       Color(0xffFAF3F3).withOpacity(0.3),
              //      // Theme.of(context).accentColor
              //     ],
              //   ),
              // ),
            ),
          ),
          // title: Text(
          //   'Own Test Request',
          //   style: TextStyle(
          //     fontFamily: 'Poppins',
          //      color: Color(0xFF02475E),
          //     fontWeight: FontWeight.w700
          //   ),
          // ),
          centerTitle: true,
          leading: BackButton(onPressed: (){
            Navigator.of(context).pop(true);
          },
          color: Color(0xFF02475E),),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text("Booking Information",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: blockSizeHorizontal * 5,
                            fontFamily: 'Poppins',
                            color: Theme.of(context).primaryColor,
                          )),
                      subtitle: Text("Preferred Visit Date"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    padding: EdgeInsets.only(left: 0, right: 150),
                    decoration: BoxDecoration(
                      // color: Color(0xFF3E64FF),
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      // boxShadow: [
                      //   BoxShadow(
                      //     //color: Color(0xFF3E64FF).withOpacity(0.3),
                      //     color: Colors.grey.withOpacity(0.9),
                      //     offset: const Offset(
                      //       0.0,
                      //       5.0,
                      //     ),
                      //     blurRadius: 3.0,
                      //     spreadRadius: 0.5,
                      //   ),
                      // ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DateTimePicker(
                        initialValue: DateTime.now().toString(),
                        //initialValue:'', // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
                        type: DateTimePickerType.date,
                        dateLabelText: 'Select Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: blockSizeHorizontal * 3.5,
                          fontFamily: 'Poppins',
                          color: Colors.green,
                          letterSpacing: 2.0,
                        ),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(
                            days:
                                30)), // This will add one year from current date
                        validator: (value) {
                          return null;
                        },
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              _selectedDate = value;
                            });
                          }
                        },
                        onSaved: (value) {
                          if (value!.isNotEmpty) {
                            _selectedDate = value;
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.amber,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                            title: Text(
                          "Required Tests",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: blockSizeHorizontal * 5,
                            fontFamily: 'Poppins',
                            color: Theme.of(context).primaryColor,
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(left: 13, right: 13),
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: testTextController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Test name";
                                }
                              },
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ),
                              //controller: searchController,
                              onChanged: (text) {
                                setState(
                                  () {
                                    // textLength = text.length;
                                  },
                                );
                              },
      
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
      
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
      
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
      
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
      
                                // suffixIcon: IconButton(
                                // icon: Icon(Icons.search, color: Colors.white,size: 34,),
                                // onPressed: (){
                                //   //searchByUser();
                                //   },//=============================================================
                                // ),
      
                                // suffixIcon: Icon(textLength <= 5 ? Icons.cancel : Icons.check,
                                //     color: textLength >= 6 ? Colors.green : Colors.redAccent),
      
                                labelText: 'Test Name',
                                labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.blueGrey, //Color(0xFF425c5a),
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 2.0,
                                  fontSize: 11.0,
                                ),
                                //hintText: 'Ex : Dental or Sugar Check up etc',
                                hintStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white38, //Color(0xFF425c5a),
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 2.0,
                                  fontSize: 9.0,
                                ),
                                //filled: true,
                                //fillColor: Colors.grey[200],
                                prefixIcon: Icon(
                                  Icons.edit,
                                  color: Colors.blueGrey,
                                ),
                              ),
      
                              //keyboardType: TextInputType.number,
                              // inputFormatters: [
                              //   //only numeric keyboard.
                              //  // LengthLimitingTextInputFormatter(6), //only 6 digit
                              //  // WhitelistingTextInputFormatter.digitsOnly,
                              // ],
      
                              // validator: (String value) {
                              //   if (value.length < 6) {
                              //     return 'Enter your vaild 6 digit User ID';
                              //   }
                              //   return null;
                              // },                                                                              // Active button validation
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text("Prescription",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: blockSizeHorizontal * 5,
                                  fontFamily: 'Poppins',
                                  color: Theme.of(context).primaryColor,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: OutlinedButton(
                            child: Text("Choose File"),
                            onPressed: () {
                              //pickImageFromGallery(ImageSource.gallery);
                              filePicker();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: image == null
                              ? Text("No file chosen")
                              : Image.file(
                                  File(image!.path),
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Center(
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (_formKey.currentState!.validate()) {
                                    SaveCustomTestBooking();
                                  }
                                });
                                //SaveCustomTestBooking();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Color(0xFF79a0be)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.only(left: 50, right: 50)),
                              ),
                              child: Text("Next")),
                        ),
                      ],
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

  void filePicker() async {
    final File? selectedImage =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    print(selectedImage!.path);
    setState(() {
      image = selectedImage;
    });
  }

  //=================================================================================================
  // http.MultipartRequest('POST', Uri.parse(url));

  Future<void> SaveCustomTestBooking() async {
    var jsonResponse;
    if (EncUserId.isNotEmpty) {
      var response = await http.post(
          Uri.parse(
              "http://medbo.digitalicon.in/api/medboapi/SaveCustomTestBooking"),
          body: ({
            'VisitDate': _selectedDate,
            'EncUserId': EncUserId,
            //'UserFile':  image as String,
            'Description': testTextController.text
          }));
      if (response.statusCode == 200) {
        print("Correct");
        print(response.body);
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DieticianAfterDateSelectPage(
                      rresponse:
                          DieticianEncBookingIdModel.fromJson(jsonResponse),
                    )));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Somthing went wrong")));
        throw Exception("Faild to fetch");
      }
    }
  }
}






//  Future<void> SaveCustomTestBooking() async {

//     var stream = new http.ByteStream(new http.ByteStream(image!.openRead()));
//       var length = await image!.length();


//     var jsonResponse;
//     if (EncUserId.isNotEmpty) {
//        var postUri = Uri.parse("http://medbo.digitalicon.in/api/medboapi/SaveCustomTestBooking");
//       var request  = http.MultipartRequest('POST',postUri);
//       request .fields['VisitDate'] = _selectedDate;
//       request .fields['EncUserId'] = EncUserId;
//       request.files.add(new http.MultipartFile.fromBytes('image', await File.fromUri(Uri.parse("<path/to/image>")).readAsBytes(), contentType: new MediaType('image', 'jpeg')));

//        request.send().then((response){
//          if (response.statusCode == 200) {

//            print("Uploaded!");
//             Navigator.push(context, MaterialPageRoute(builder: (context) => DieticianAfterDateSelectPage(rresponse:DieticianEncBookingIdModel.fromJson(jsonResponse),)));
           
//        } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Somthing went wrong")));
//         throw Exception("Faild to fetch");

//        }
//        }
//      // var response = await http.post(Uri.parse("http://medbo.digitalicon.in/api/medboapi/SaveCustomTestBooking"),
//           // body: ({
//           //   'VisitDate':_selectedDate,
//           //   'EncUserId':EncUserId,
//           //   'UserFile':image!.readAsBytesSync().toString(),//!= null ? 'data:image/png;base64,' + base64Encode(image!.readAsBytesSync()) : ''
//           // }));
//       // if (response.statusCode == 200) {
//       //   print("Correct");
//       //   print(response.body);
//       //   jsonResponse = json.decode(response.body.toString());
//       //   print(jsonResponse);
//       //   Navigator.push(context, MaterialPageRoute(builder: (context) => DieticianAfterDateSelectPage(rresponse:DieticianEncBookingIdModel.fromJson(jsonResponse),)));
//       // } else {
//       //   ScaffoldMessenger.of(context).showSnackBar(
//       //       SnackBar(content: Text("Somthing went wrong")));
//       //   throw Exception("Faild to fetch");
//       // }
//     // } else {
//     //   throw Exception("Check Your body parameter");
//     // }
  

//        );}
//   }
  
