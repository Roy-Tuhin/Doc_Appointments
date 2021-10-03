// To parse this JSON data, do
//
//     final allDocRefactorModel = allDocRefactorModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AllDocRefactorModel allDocRefactorModelFromJson(String str) => AllDocRefactorModel.fromJson(json.decode(str));

String allDocRefactorModelToJson(AllDocRefactorModel data) => json.encode(data.toJson());

class AllDocRefactorModel {
    AllDocRefactorModel({
        required this.status,
        required this.message,
        required this.data,
    });

    String status;
    String message;
    List<DocInfoList> data;

    factory AllDocRefactorModel.fromJson(Map<String, dynamic> json) => AllDocRefactorModel(
        status: json["Status"],
        message: json["Message"],
        data: List<DocInfoList>.from(json["Data"].map((x) => DocInfoList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DocInfoList {
    DocInfoList({
        required this.doctorId,
        required this.encDoctorId,
        required this.doctorName,
        required this.doctorImage,
        required this.linkPartner,
        required this.specialisation,
        required this.gender,
        required this.qualification,
        @required this.fee,
        @required this.discountedFee,
        @required this.bookingFee,
        @required this.timeFrom,
        @required this.timeTo,
        @required this.visitDay,
        @required this.phone,
        @required this.alternatePhone,
        @required this.email,
        @required this.note,
        @required this.createBy,
        @required this.createDate,
        @required this.modBy,
        @required this.modDate,
        @required this.activeStatus,
        @required this.permission,
    });

    String doctorId;
    String encDoctorId;
    String doctorName;
    String doctorImage;
    dynamic linkPartner;
    String specialisation;
    dynamic gender;
    String qualification;
    dynamic fee;
    dynamic discountedFee;
    dynamic bookingFee;
    dynamic timeFrom;
    dynamic timeTo;
    dynamic visitDay;
    dynamic phone;
    dynamic alternatePhone;
    dynamic email;
    dynamic note;
    dynamic createBy;
    dynamic createDate;
    dynamic modBy;
    dynamic modDate;
    dynamic activeStatus;
    dynamic permission;

    factory DocInfoList.fromJson(Map<String, dynamic> json) => DocInfoList(
        doctorId: json["DoctorId"],
        encDoctorId: json["EncDoctorId"],
        doctorName: json["DoctorName"],
        doctorImage: json["DoctorImage"],
        linkPartner: json["LinkPartner"],
        specialisation: json["Specialisation"],
        gender: json["Gender"],
        qualification: json["Qualification"],
        fee: json["Fee"],
        discountedFee: json["DiscountedFee"],
        bookingFee: json["BookingFee"],
        timeFrom: json["TimeFrom"],
        timeTo: json["TimeTo"],
        visitDay: json["VisitDay"],
        phone: json["Phone"],
        alternatePhone: json["AlternatePhone"],
        email: json["Email"],
        note: json["Note"],
        createBy: json["CreateBy"],
        createDate: json["CreateDate"],
        modBy: json["ModBy"],
        modDate: json["ModDate"],
        activeStatus: json["ActiveStatus"],
        permission: json["Permission"],
    );

    Map<String, dynamic> toJson() => {
        "DoctorId": doctorId,
        "EncDoctorId": encDoctorId,
        "DoctorName": doctorName,
        "DoctorImage": doctorImage,
        "LinkPartner": linkPartner,
        "Specialisation": specialisation,
        "Gender": gender,
        "Qualification": qualification,
        "Fee": fee,
        "DiscountedFee": discountedFee,
        "BookingFee": bookingFee,
        "TimeFrom": timeFrom,
        "TimeTo": timeTo,
        "VisitDay": visitDay,
        "Phone": phone,
        "AlternatePhone": alternatePhone,
        "Email": email,
        "Note": note,
        "CreateBy": createBy,
        "CreateDate": createDate,
        "ModBy": modBy,
        "ModDate": modDate,
        "ActiveStatus": activeStatus,
        "Permission": permission,
    };
}
