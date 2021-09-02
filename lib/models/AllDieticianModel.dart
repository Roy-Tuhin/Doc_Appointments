// To parse this JSON data, do
//
//     final allDieticianModel = allDieticianModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AllDieticianModel allDieticianModelFromJson(String str) => AllDieticianModel.fromJson(json.decode(str));

String allDieticianModelToJson(AllDieticianModel data) => json.encode(data.toJson());

class AllDieticianModel {
    AllDieticianModel({
        required this.status,
        required this.message,
        required this.data,
    });

    String status;
    String message;
    List<Datum> data;

    factory AllDieticianModel.fromJson(Map<String, dynamic> json) => AllDieticianModel(
        status: json["Status"],
        message: json["Message"],
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.encDietId,
        required this.dietName,
        required this.email,
        required this.phone,
        required this.alternatePhone,
        required this.image,
        required this.description,
        required this.fee,
        required this.discountedFee,
        required this.bookingFee,
        required this.visitDay,
        required this.timeFrom,
        required this.timeTo,
    });

    String encDietId;
    String dietName;
    String email;
    String phone;
    String alternatePhone;
    String image;
    String description;
    dynamic fee;
    dynamic discountedFee;
    dynamic bookingFee;
    dynamic visitDay;
    dynamic timeFrom;
    dynamic timeTo;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        encDietId: json["EncDietId"],
        dietName: json["DietName"],
        email: json["Email"],
        phone: json["Phone"],
        alternatePhone: json["AlternatePhone"],
        image: json["Image"],
        description: json["Description"],
        fee: json["Fee"],
        discountedFee: json["DiscountedFee"],
        bookingFee: json["BookingFee"],
        visitDay: json["VisitDay"],
        timeFrom: json["TimeFrom"],
        timeTo: json["TimeTo"],
    );

    Map<String, dynamic> toJson() => {
        "EncDietId": encDietId,
        "DietName": dietName,
        "Email": email,
        "Phone": phone,
        "AlternatePhone": alternatePhone,
        "Image": image,
        "Description": description,
        "Fee": fee,
        "DiscountedFee": discountedFee,
        "BookingFee": bookingFee,
        "VisitDay": visitDay,
        "TimeFrom": timeFrom,
        "TimeTo": timeTo,
    };
}
