// To parse this JSON data, do
//
//     final docBookingModel = docBookingModelFromJson(jsonString);

import 'dart:convert';

DocBookingModel docBookingModelFromJson(String str) => DocBookingModel.fromJson(json.decode(str));

String docBookingModelToJson(DocBookingModel data) => json.encode(data.toJson());

class DocBookingModel {
    DocBookingModel({
        required this.status,
        required this.message,
        required this.encBookingId,
    });

    String status;
    String message;
    String encBookingId;

    factory DocBookingModel.fromJson(Map<String, dynamic> json) => DocBookingModel(
        status: json["Status"],
        message: json["Message"],
        encBookingId: json["EncBookingId"],
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "EncBookingId": encBookingId,
    };
}
