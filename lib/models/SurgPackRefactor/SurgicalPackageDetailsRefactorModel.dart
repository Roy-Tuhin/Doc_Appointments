// To parse this JSON data, do
//
//     final surgicalPackageDetailsRefactorModel = surgicalPackageDetailsRefactorModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SurgicalPackageDetailsRefactorModel surgicalPackageDetailsRefactorModelFromJson(String str) => SurgicalPackageDetailsRefactorModel.fromJson(json.decode(str));

String surgicalPackageDetailsRefactorModelToJson(SurgicalPackageDetailsRefactorModel data) => json.encode(data.toJson());

class SurgicalPackageDetailsRefactorModel {
    SurgicalPackageDetailsRefactorModel({
        required this.status,
        required this.message,
        required this.surgicalData,
        required this.partnerData,
    });

    String status;
    String message;
    SurgicalData surgicalData;
    List<PartnerDataList> partnerData;

    factory SurgicalPackageDetailsRefactorModel.fromJson(Map<String, dynamic> json) => SurgicalPackageDetailsRefactorModel(
        status: json["Status"],
        message: json["Message"],
        surgicalData: SurgicalData.fromJson(json["SurgicalData"]),
        partnerData: List<PartnerDataList>.from(json["PartnerData"].map((x) => PartnerDataList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "SurgicalData": surgicalData.toJson(),
        "PartnerData": List<dynamic>.from(partnerData.map((x) => x.toJson())),
    };
}

class PartnerDataList {
    PartnerDataList({
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

    factory PartnerDataList.fromJson(Map<String, dynamic> json) => PartnerDataList(
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

class SurgicalData {
    SurgicalData({
        required this.packageId,
        required this.encPackageId,
        required this.packageName,
        @required this.note,
        @required this.createBy,
        @required this.createDate,
        @required this.modBy,
        @required this.modDate,
        @required this.activeStatus,
        @required this.permission,
        @required this.fee,
        @required this.discountedFee,
        @required this.bookingFee,
        required this.description,
    });

    String packageId;
    String encPackageId;
    String packageName;
    dynamic note;
    dynamic createBy;
    dynamic createDate;
    dynamic modBy;
    dynamic modDate;
    dynamic activeStatus;
    dynamic permission;
    dynamic fee;
    dynamic discountedFee;
    dynamic bookingFee;
    String description;

    factory SurgicalData.fromJson(Map<String, dynamic> json) => SurgicalData(
        packageId: json["PackageId"],
        encPackageId: json["EncPackageId"],
        packageName: json["PackageName"],
        note: json["Note"],
        createBy: json["CreateBy"],
        createDate: json["CreateDate"],
        modBy: json["ModBy"],
        modDate: json["ModDate"],
        activeStatus: json["ActiveStatus"],
        permission: json["Permission"],
        fee: json["Fee"],
        discountedFee: json["DiscountedFee"],
        bookingFee: json["BookingFee"],
        description: json["Description"],
    );

    Map<String, dynamic> toJson() => {
        "PackageId": packageId,
        "EncPackageId": encPackageId,
        "PackageName": packageName,
        "Note": note,
        "CreateBy": createBy,
        "CreateDate": createDate,
        "ModBy": modBy,
        "ModDate": modDate,
        "ActiveStatus": activeStatus,
        "Permission": permission,
        "Fee": fee,
        "DiscountedFee": discountedFee,
        "BookingFee": bookingFee,
        "Description": description,
    };
}
