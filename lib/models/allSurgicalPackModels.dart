// To parse this JSON data, do
//
//     final surgicalPackageList = surgicalPackageListFromJson(jsonString);

import 'dart:convert';

SurgicalPackageList surgicalPackageListFromJson(String str) => SurgicalPackageList.fromJson(json.decode(str));

String surgicalPackageListToJson(SurgicalPackageList data) => json.encode(data.toJson());

class SurgicalPackageList {
  SurgicalPackageList({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<Data> data;

  factory SurgicalPackageList.fromJson(Map<String, dynamic> json) => SurgicalPackageList(
    status: json["Status"],
    message: json["Message"],
    data: List<Data>.from(json["Data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    required this.packageId,
    required this.encPackageId,
    required this.packageName,
    required this.note,
    required this.createBy,
    required this.createDate,
    required this.modBy,
    required this.modDate,
    required this.activeStatus,
    required this.permission,
    required this.fee,
    required this.discountedFee,
    required this.bookingFee,
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
