// To parse this JSON data, do
//
//     final dietDetailsModel = dietDetailsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DietDetailsModel dietDetailsModelFromJson(String str) => DietDetailsModel.fromJson(json.decode(str));

String dietDetailsModelToJson(DietDetailsModel data) => json.encode(data.toJson());

class DietDetailsModel {
    DietDetailsModel({
        required this.status,
        required this.message,
        required this.data,
        required this.partnerData,
    });

    String status;
    String message;
    Data data;
    List<PartnerDatum> partnerData;

    factory DietDetailsModel.fromJson(Map<String, dynamic> json) => DietDetailsModel(
        status: json["Status"],
        message: json["Message"],
        data: Data.fromJson(json["Data"]),
        partnerData: List<PartnerDatum>.from(json["PartnerData"].map((x) => PartnerDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": data.toJson(),
        "PartnerData": List<dynamic>.from(partnerData.map((x) => x.toJson())),
    };
}

class Data {
    Data({
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
    dynamic email;
    dynamic phone;
    dynamic alternatePhone;
    String image;
    dynamic description;
    dynamic fee;
    dynamic discountedFee;
    dynamic bookingFee;
    dynamic visitDay;
    dynamic timeFrom;
    dynamic timeTo;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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

class PartnerDatum {
    PartnerDatum({
        required this.partnerId,
        required this.encPartnerId,
        required this.partnerName,
        required this.partnerAddress,
        required this.fee,
        required this.discountedFee,
        required this.bookingFee,
        required this.dayList,
    });

    String partnerId;
    String encPartnerId;
    String partnerName;
    String partnerAddress;
    String fee;
    String discountedFee;
    String bookingFee;
    List<DayList> dayList;

    factory PartnerDatum.fromJson(Map<String, dynamic> json) => PartnerDatum(
        partnerId: json["PartnerId"],
        encPartnerId: json["EncPartnerId"],
        partnerName: json["PartnerName"],
        partnerAddress: json["PartnerAddress"],
        fee: json["Fee"],
        discountedFee: json["DiscountedFee"],
        bookingFee: json["BookingFee"],
        dayList: List<DayList>.from(json["DayList"].map((x) => DayList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "PartnerId": partnerId,
        "EncPartnerId": encPartnerId,
        "PartnerName": partnerName,
        "PartnerAddress": partnerAddress,
        "Fee": fee,
        "DiscountedFee": discountedFee,
        "BookingFee": bookingFee,
        "DayList": List<dynamic>.from(dayList.map((x) => x.toJson())),
    };
}

class DayList {
    DayList({
        required this.dayName,
        required this.timeFrom,
        required this.timeTo,
    });

    String dayName;
    String timeFrom;
    String timeTo;

    factory DayList.fromJson(Map<String, dynamic> json) => DayList(
        dayName: json["DayName"],
        timeFrom: json["TimeFrom"],
        timeTo: json["TimeTo"],
    );

    Map<String, dynamic> toJson() => {
        "DayName": dayName,
        "TimeFrom": timeFrom,
        "TimeTo": timeTo,

    };
}