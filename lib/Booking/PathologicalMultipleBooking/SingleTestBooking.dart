import 'dart:convert';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:medbo/Booking/DieticianAfterDateSelect/DieticianAfterDateSelectPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../DieticianEncBookingIdModel.dart';

class PathologicalSingleTestBookingPage extends StatefulWidget {
  PathologicalSingleTestBookingPage() : super();

  @override
  _PathologicalSingleTestBookingPageState createState() =>
      _PathologicalSingleTestBookingPageState();
}

class _PathologicalSingleTestBookingPageState
    extends State<PathologicalSingleTestBookingPage> {
  final ImagePicker _picker = ImagePicker();
  File? image;

  //=====================================================================================S H O W   USER  DETIALS IN APP DRAWER WITH SHARED PREFERENCES====================================================

  String Name = "";
  String EncUserId = "";

void initState(){
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
      body: SingleChildScrollView(
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
                      image == null? Text("No image  found"): Image.file(File(image!.path),width: 150,fit: BoxFit.cover,),

                                       ElevatedButton(
                   onPressed: (){
                     SaveCustomTestBooking();

                 }, 
                 child: Text("Save")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void filePicker() async {
    final File? selectedImage =await ImagePicker.pickImage(source: ImageSource.gallery);
    print(selectedImage!.path);
    setState(() {
      image = selectedImage;
    });
  }

  //=================================================================================================

  Future<void> SaveCustomTestBooking() async {
    var jsonResponse;
    if (EncUserId.isNotEmpty) {
      var response = await http.post(
          Uri.parse(
              "http://medbo.digitalicon.in/api/medboapi/SaveCustomTestBooking"),
          body: ({
            'VisitDate': _selectedDate,
            'EncUserId': EncUserId,
            'UserFile':  image != null ? 'data:image/png;base64,' + base64Encode(image!.readAsBytesSync()) : '',
          }));
      if (response.statusCode == 200) {
        print("Correct");
        print(response.body);
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
        Navigator.push(context, MaterialPageRoute(builder: (context) => DieticianAfterDateSelectPage(rresponse:DieticianEncBookingIdModel.fromJson(jsonResponse),)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Somthing went wrong")));
        throw Exception("Faild to fetch");
      }
    } else {
      throw Exception("Check Your body parameter");
    }
  }
}
