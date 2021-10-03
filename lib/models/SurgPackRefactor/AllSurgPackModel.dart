// To parse this JSON data, do
//
//     final allSurgPackModel = allSurgPackModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AllSurgPackModel allSurgPackModelFromJson(String str) => AllSurgPackModel.fromJson(json.decode(str));

String allSurgPackModelToJson(AllSurgPackModel data) => json.encode(data.toJson());

class AllSurgPackModel {
    AllSurgPackModel({
        required this.status,
        required this.message,
        required this.data,
    });

    String status;
    String message;
    List<SurgPackInfoList> data;

    factory AllSurgPackModel.fromJson(Map<String, dynamic> json) => AllSurgPackModel(
        status: json["Status"],
        message: json["Message"],
        data: List<SurgPackInfoList>.from(json["Data"].map((x) => SurgPackInfoList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class SurgPackInfoList {
    SurgPackInfoList({
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

    factory SurgPackInfoList.fromJson(Map<String, dynamic> json) => SurgPackInfoList(
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