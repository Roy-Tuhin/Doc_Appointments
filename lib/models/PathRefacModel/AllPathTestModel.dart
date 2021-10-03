// To parse this JSON data, do
//
//     final allPathTestModel = allPathTestModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AllPathTestModel allPathTestModelFromJson(String str) => AllPathTestModel.fromJson(json.decode(str));

String allPathTestModelToJson(AllPathTestModel data) => json.encode(data.toJson());

class AllPathTestModel {
    AllPathTestModel({
        required this.status,
        required this.message,
        required this.data,
    });

    String status;
    String message;
    List<PathTestListRefac> data;

    factory AllPathTestModel.fromJson(Map<String, dynamic> json) => AllPathTestModel(
        status: json["Status"],
        message: json["Message"],
        data: List<PathTestListRefac>.from(json["Data"].map((x) => PathTestListRefac.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class PathTestListRefac {
    PathTestListRefac({
        required this.testId,
        required this.encTestId,
        required this.testName,
        @required this.noOfPartner,
        @required this.testFee,
        @required this.discountedFee,
        @required this.bookingFee,
        @required this.reportTime,
        @required this.note,
        @required this.createBy,
        @required this.createDate,
        @required this.modBy,
        @required this.modDate,
        @required this.activeStatus,
        @required this.permission,
    });

    String testId;
    String encTestId;
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

    factory PathTestListRefac.fromJson(Map<String, dynamic> json) => PathTestListRefac(
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
