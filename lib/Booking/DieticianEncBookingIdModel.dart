// To parse this JSON data, do
//
//     final dieticianEncBookingIdModel = dieticianEncBookingIdModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DieticianEncBookingIdModel dieticianEncBookingIdModelFromJson(String str) => DieticianEncBookingIdModel.fromJson(json.decode(str));

String dieticianEncBookingIdModelToJson(DieticianEncBookingIdModel data) => json.encode(data.toJson());

class DieticianEncBookingIdModel {
    DieticianEncBookingIdModel({
        required this.status,
        required this.message,
        required this.encBookingId,
    });

    String status;
    String message;
    String encBookingId;

    factory DieticianEncBookingIdModel.fromJson(Map<String, dynamic> json) => DieticianEncBookingIdModel(
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