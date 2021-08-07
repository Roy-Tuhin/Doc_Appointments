// To parse this JSON data, do
//
//     final healthCheckUptList = healthCheckUptListFromJson(jsonString);

import 'dart:convert';

HealthCheckUptList healthCheckUptListFromJson(String str) => HealthCheckUptList.fromJson(json.decode(str));

String healthCheckUptListToJson(HealthCheckUptList data) => json.encode(data.toJson());

class HealthCheckUptList {
  HealthCheckUptList({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<Datum> data;

  factory HealthCheckUptList.fromJson(Map<String, dynamic> json) => HealthCheckUptList(
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
    required this.healthPartnerId,
    required this.encHealthPartnerId,
    required this.healthName,
    required this.note,
    required this.createBy,
    required this.createDate,
    required this.activeStatus,
    required this.fee,
    required this.discountedFee,
    required this.bookingFee,
    required this.testId,
    required this.testName,
  });

  String healthPartnerId;
  String encHealthPartnerId;
  String healthName;
  dynamic note;
  dynamic createBy;
  dynamic createDate;
  dynamic activeStatus;
  dynamic fee;
  dynamic discountedFee;
  dynamic bookingFee;
  dynamic testId;
  String testName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    healthPartnerId: json["HealthPartnerId"],
    encHealthPartnerId: json["EncHealthPartnerId"],
    healthName: json["HealthName"],
    note: json["Note"],
    createBy: json["CreateBy"],
    createDate: json["CreateDate"],
    activeStatus: json["ActiveStatus"],
    fee: json["Fee"],
    discountedFee: json["DiscountedFee"],
    bookingFee: json["BookingFee"],
    testId: json["TestId"],
    testName: json["TestName"],
  );

  Map<String, dynamic> toJson() => {
    "HealthPartnerId": healthPartnerId,
    "EncHealthPartnerId": encHealthPartnerId,
    "HealthName": healthName,
    "Note": note,
    "CreateBy": createBy,
    "CreateDate": createDate,
    "ActiveStatus": activeStatus,
    "Fee": fee,
    "DiscountedFee": discountedFee,
    "BookingFee": bookingFee,
    "TestId": testId,
    "TestName": testName,
  };
}
