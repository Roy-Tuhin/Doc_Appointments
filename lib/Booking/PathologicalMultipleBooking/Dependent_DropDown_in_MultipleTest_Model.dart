// To parse this JSON data, do
//
//     final dependentDropDownModel = dependentDropDownModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DependentDropDownModel dependentDropDownModelFromJson(String str) => DependentDropDownModel.fromJson(json.decode(str));

String dependentDropDownModelToJson(DependentDropDownModel data) => json.encode(data.toJson());

class DependentDropDownModel {
    DependentDropDownModel({
        required this.status,
        required this.message,
        required this.data,
    });

    String status;
    String message;
    List<Datum> data;

    factory DependentDropDownModel.fromJson(Map<String, dynamic> json) => DependentDropDownModel(
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
        required this.testId,
        required this.encTestId,
        required this.testName,
        required this.noOfPartner,
        required this.testFee,
        required this.discountedFee,
        required this.bookingFee,
        required this.reportTime,
        required this.note,
        required this.createBy,
        required this.createDate,
        required this.modBy,
        required this.modDate,
        required this.activeStatus,
        required this.permission,
    });

    String testId;
    dynamic encTestId;
    String testName;
    dynamic noOfPartner;
    dynamic testFee;
    dynamic discountedFee;
    dynamic bookingFee;
    dynamic reportTime;
    dynamic note;
    dynamic createBy;
    dynamic createDate;
    dynamic modBy;
    dynamic modDate;
    dynamic activeStatus;
    dynamic permission;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        testId: json["TestId"],
        encTestId: json["EncTestId"],
        testName: json["TestName"],
        noOfPartner: json["NoOfPartner"],
        testFee: json["TestFee"],
        discountedFee: json["DiscountedFee"],
        bookingFee: json["BookingFee"],
        reportTime: json["ReportTime"],
        note: json["Note"],
        createBy: json["CreateBy"],
        createDate: json["CreateDate"],
        modBy: json["ModBy"],
        modDate: json["ModDate"],
        activeStatus: json["ActiveStatus"],
        permission: json["Permission"],
    );

    Map<String, dynamic> toJson() => {
        "TestId": testId,
        "EncTestId": encTestId,
        "TestName": testName,
        "NoOfPartner": noOfPartner,
        "TestFee": testFee,
        "DiscountedFee": discountedFee,
        "BookingFee": bookingFee,
        "ReportTime": reportTime,
        "Note": note,
        "CreateBy": createBy,
        "CreateDate": createDate,
        "ModBy": modBy,
        "ModDate": modDate,
        "ActiveStatus": activeStatus,
        "Permission": permission,
    };
}