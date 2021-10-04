// To parse this JSON data, do
//
//     final pathTestDetailsRefactorModel = pathTestDetailsRefactorModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PathTestDetailsRefactorModel pathTestDetailsRefactorModelFromJson(String str) => PathTestDetailsRefactorModel.fromJson(json.decode(str));

String pathTestDetailsRefactorModelToJson(PathTestDetailsRefactorModel data) => json.encode(data.toJson());

class PathTestDetailsRefactorModel {
    PathTestDetailsRefactorModel({
        required this.status,
        required this.message,
        required this.testData,
        required this.partnerData,
    });

    String status;
    String message;
    TestData testData;
    List<PathPartnerDataList> partnerData;

    factory PathTestDetailsRefactorModel.fromJson(Map<String, dynamic> json) => PathTestDetailsRefactorModel(
        status: json["Status"],
        message: json["Message"],
        testData: TestData.fromJson(json["TestData"]),
        partnerData: List<PathPartnerDataList>.from(json["PartnerData"].map((x) => PathPartnerDataList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "TestData": testData.toJson(),
        "PartnerData": List<dynamic>.from(partnerData.map((x) => x.toJson())),
    };
}

class PathPartnerDataList {
    PathPartnerDataList({
        required this.partnerId,
        required this.encPartnerId,
        required this.partnerName,
        required this.partnerAddress,
        required this.fee,
        required this.discountedFee,
        required this.bookingFee,
        @required this.dayList,
    });

    String partnerId;
    String encPartnerId;
    String partnerName;
    String partnerAddress;
    String fee;
    String discountedFee;
    String bookingFee;
    dynamic dayList;

    factory PathPartnerDataList.fromJson(Map<String, dynamic> json) => PathPartnerDataList(
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

class TestData {
    TestData({
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

    factory TestData.fromJson(Map<String, dynamic> json) => TestData(
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
