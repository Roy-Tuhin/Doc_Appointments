// To parse this JSON data, do
//
//     final docVisitDaysModel = docVisitDaysModelFromJson(jsonString);

import 'dart:convert';

DocVisitDaysModel docVisitDaysModelFromJson(String str) => DocVisitDaysModel.fromJson(json.decode(str));

String docVisitDaysModelToJson(DocVisitDaysModel data) => json.encode(data.toJson());

class DocVisitDaysModel {
    DocVisitDaysModel({
        required this.status,
        required this.message,
        required this.data,
    });

    String status;
    String message;
    List<Datum> data;

    factory DocVisitDaysModel.fromJson(Map<String, dynamic> json) => DocVisitDaysModel(
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
        required this.encDayId,
        required this.visitDayName,
        required this.visitDate,
        required this.fee,
        required this.discountedFee,
        required this.bookingFee,
       // required this.timing,
    });

    String encDayId;
    String visitDayName;
    String visitDate;
    String fee;
    String discountedFee;
    String bookingFee;
   // Timing timing;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        encDayId: json["EncDayId"],
        visitDayName: json["VisitDayName"],
        visitDate: json["VisitDate"],
        fee: json["Fee"],
        discountedFee: json["DiscountedFee"],
        bookingFee: json["BookingFee"],
       // timing: timingValues.map[json["Timing"]],
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

// enum Timing { THE_16081808 }

// final timingValues = EnumValues({
//     "16:08-18:08": Timing.THE_16081808
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
