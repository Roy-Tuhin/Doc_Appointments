// To parse this JSON data, do
//
//     final dieticianVisitModel = dieticianVisitModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DieticianVisitModel dieticianVisitModelFromJson(String str) => DieticianVisitModel.fromJson(json.decode(str));

String dieticianVisitModelToJson(DieticianVisitModel data) => json.encode(data.toJson());

class DieticianVisitModel {
    DieticianVisitModel({
        required this.status,
        required this.message,
        required this.data,
    });

    String status;
    String message;
    List<DieticianVisitData> data;

    factory DieticianVisitModel.fromJson(Map<String, dynamic> json) => DieticianVisitModel(
        status: json["Status"],
        message: json["Message"],
        data: List<DieticianVisitData>.from(json["Data"].map((x) => DieticianVisitData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DieticianVisitData {
    DieticianVisitData({
        required this.encDayId,
        required this.visitDayName,
        required this.visitDate,
        required this.fee,
        required this.discountedFee,
        required this.bookingFee,
        //required this.timing,
    });

    String encDayId;
    String visitDayName;
    String visitDate;
    String fee;
    String discountedFee;
    String bookingFee;
   // Timing timing;

    factory DieticianVisitData.fromJson(Map<String, dynamic> json) => DieticianVisitData(
        encDayId: json["EncDayId"],
        visitDayName: json["VisitDayName"],
        visitDate: json["VisitDate"],
        fee: json["Fee"],
        discountedFee: json["DiscountedFee"],
        bookingFee: json["BookingFee"],
        //timing: timingValues.map[json["Timing"]],
    );

    Map<String, dynamic> toJson() => {
        "EncDayId": encDayId,
        "VisitDayName": visitDayName,
        "VisitDate": visitDate,
        "Fee": fee,
        "DiscountedFee": discountedFee,
        "BookingFee": bookingFee,
        //"Timing": timingValues.reverse[timing],
    };
}

// enum Timing { THE_13001700 }

// final timingValues = EnumValues({
//     "13:00-17:00": Timing.THE_13001700
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     //EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
