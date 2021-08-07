// To parse this JSON data, do
//
//     final healthchkupDetails = healthchkupDetailsFromJson(jsonString);

import 'dart:convert';

HealthchkupDetails healthchkupDetailsFromJson(String str) => HealthchkupDetails.fromJson(json.decode(str));

String healthchkupDetailsToJson(HealthchkupDetails data) => json.encode(data.toJson());

class HealthchkupDetails {
  HealthchkupDetails({
    required this.status,
    required this.message,
    required this.healthData,
    required this.partnerData,
  });

  String status;
  String message;
  HealthData healthData;
  List<PartnerDatum> partnerData;

  factory HealthchkupDetails.fromJson(Map<String, dynamic> json) => HealthchkupDetails(
    status: json["Status"],
    message: json["Message"],
    healthData: HealthData.fromJson(json["HealthData"]),
    partnerData: List<PartnerDatum>.from(json["PartnerData"].map((x) => PartnerDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "HealthData": healthData.toJson(),
    "PartnerData": List<dynamic>.from(partnerData.map((x) => x.toJson())),
  };
}

class HealthData {
  HealthData({
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

  factory HealthData.fromJson(Map<String, dynamic> json) => HealthData(
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
  dynamic dayList;

  factory PartnerDatum.fromJson(Map<String, dynamic> json) => PartnerDatum(
    partnerId: json["PartnerId"],
    encPartnerId: json["EncPartnerId"],
    partnerName: json["PartnerName"],
    partnerAddress: json["PartnerAddress"],
    fee: json["Fee"],
    discountedFee: json["DiscountedFee"],
    bookingFee: json["BookingFee"],
    dayList: json["DayList"],
  );

  Map<String, dynamic> toJson() => {
    "PartnerId": partnerId,
    "EncPartnerId": encPartnerId,
    "PartnerName": partnerName,
    "PartnerAddress": partnerAddress,
    "Fee": fee,
    "DiscountedFee": discountedFee,
    "BookingFee": bookingFee,
    "DayList": dayList,
  };
}
