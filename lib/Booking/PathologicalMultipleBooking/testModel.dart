// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<Datum> data;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        status: json["Status"],
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data":
            data == null ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.testId,
    this.encTestId,
    required this.testName,
    this.noOfPartner,
    this.testFee,
    this.discountedFee,
    this.bookingFee,
    this.reportTime,
    this.note,
    this.createBy,
    this.createDate,
    this.modBy,
    this.modDate,
    this.activeStatus,
    this.permission,
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
