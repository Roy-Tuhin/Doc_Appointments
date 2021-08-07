// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.status,
    required this.message,
    required this.userData,
  });

  String status;
  String message;
  UserData userData;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    status: json["Status"],
    message: json["Message"],
    userData: UserData.fromJson(json["UserData"]),
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "UserData": userData.toJson(),
  };
}

class UserData {
  UserData({
    required this.name,
    required this.encUserId,
  });

  String name;
  String encUserId;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    name: json["Name"],
    encUserId: json["EncUserId"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "EncUserId": encUserId,
  };
}
