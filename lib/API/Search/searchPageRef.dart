// import 'package:flutter/material.dart';

// class SearchPageRef extends StatefulWidget {
//   const SearchPageRef({ Key? key }) : super(key: key);

//   @override
//   _SearchPageRefState createState() => _SearchPageRefState();
// }

// class _SearchPageRefState extends State<SearchPageRef> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }

//    Future<void> searchByUser() async {
//     var jsonResponse;
//     if (searchController.text.isNotEmpty) {
//       var response = await http.post(
//           Uri.parse("https://medbo.in/api/medboapi/searchResult"),
//           body: ({
//             'SearchKey': searchController.text,
//           }));
//       if (response.statusCode == 200) {
//         setState(() {
//           //isApiCallProcess = false;//progress bar hide
//         });
//         print("Correct");
//         print(response.body);
//         jsonResponse = json.decode(response.body.toString());
//         print(jsonResponse);
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => AfterSearchPage(
//                     rresponse: SearchApiResponse.fromJson(jsonResponse))));
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text(" ${jsonResponse['Message']}"),
//           backgroundColor: Color(0xFF152A38),
//         ));
//         // pageRoute(
//         //   jsonResponse['UserData']['Name'],
//         // ); // WANT TO SHOW USER NAME IN APP DRAWER AFTER LOGIN WITH CORRECT CREDENTIALS
//       } else {
//         print("Wronggooooooooooooooooooooooooooo");
//         print(response.body);
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text("Invalid credentials")));
//       }
//     } else {
//       // setState(() {
//       //     isApiCallProcess = false;//progress bar hide
//       //   });
//       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       //   content: Text("Blank field is not allowed"),
//       //   backgroundColor: Color(0xFFAF0404),
//       // ));
//     }
//   }
// }