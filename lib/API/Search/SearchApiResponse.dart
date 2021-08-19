// class SearchApiResponse {
//     SearchApiResponse({
//         required this.status,
//         required this.message,
//        //required this.data,
//     });

//     String status;
//     String message;
//    // UserData userData;
//    // UserData? userData; 

//     factory SearchApiResponse.fromJson(Map<String, dynamic> json) => SearchApiResponse(
//         status: json["Status"],
//         message: json["Message"],
//         //userData: UserData.fromJson(json["UserData"]),
//          //userData: json["UserData"] == null? null:UserData.fromJson(json["UserData"] as Map<String, dynamic>),
//     );


// }

//======================================================================================

//class UserData {
//     UserData({
//         required this.name,
//         required this.encUserId,
//     });

//     String name;
//     String encUserId;

//     factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//         name: json["Name"],
//         encUserId: json["EncUserId"],
//     );

// }
//======================================================================================


// To parse this JSON data, do
//
//     final searchApiResponse = searchApiResponseFromJson(jsonString);

import 'dart:convert';

SearchApiResponse searchApiResponseFromJson(String str) => SearchApiResponse.fromJson(json.decode(str));

String searchApiResponseToJson(SearchApiResponse data) => json.encode(data.toJson());

class SearchApiResponse {
    SearchApiResponse({
        required this.status,
        required this.message,
        required this.data,
    });

    String status;
    String message;
    List<SearchData> data;

    factory SearchApiResponse.fromJson(Map<String, dynamic> json) => SearchApiResponse(
        status: json["Status"],
        message: json["Message"],
        data: List<SearchData>.from(json["Data"].map((x) => SearchData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class SearchData {
    SearchData({
        required this.name,
        required this.encId,
        required this.image,
        required this.extra1,
        required this.extra2,
        required this.resultFor,
    });

    String name;
    String encId;
    String image;
    String extra1;
    String extra2;
    String resultFor;

    factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
        name: json["Name"],
        encId: json["EncId"],
        image: json["Image"],
        extra1: json["Extra1"],
        extra2: json["Extra2"],
        resultFor: json["ResultFor"],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "EncId": encId,
        "Image": image,
        "Extra1": extra1,
        "Extra2": extra2,
        "ResultFor": resultFor,
    };
}
