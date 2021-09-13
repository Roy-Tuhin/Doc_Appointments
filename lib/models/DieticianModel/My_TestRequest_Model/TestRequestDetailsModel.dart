// To parse this JSON data, do
//
//     final testRequestDetailsModel = testRequestDetailsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TestRequestDetailsModel testRequestDetailsModelFromJson(String str) => TestRequestDetailsModel.fromJson(json.decode(str));

String testRequestDetailsModelToJson(TestRequestDetailsModel data) => json.encode(data.toJson());

class TestRequestDetailsModel {
    TestRequestDetailsModel({
        required this.status,
        required this.message,
        required this.data,
    });

    String status;
    String message;
    List<TRequestDetails> data;

    factory TestRequestDetailsModel.fromJson(Map<String, dynamic> json) => TestRequestDetailsModel(
        status: json["Status"],
        message: json["Message"],
        data: List<TRequestDetails>.from(json["Data"].map((x) => TRequestDetails.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class TRequestDetails {
    TRequestDetails({
        required this.encBookingId,
        required this.referenceNo,
        required this.bookingFor,
        required this.bookingNo,
        required this.bookingDate,
        required this.visitDate,
        required this.visitLocation,
        required this.patientName,
        required this.patientAddress,
        required this.patientPhone,
        required this.patientGender,
        required this.patientAge,
        required this.totalFee,
        required this.totalDiscountedFee,
        required this.totalBookingFee,
        required this.paymentMode,
        required this.transactionNo,
        required this.paidAmt,
        required this.dueAmt,
        required this.cancelDate,
        required this.paymentStatus,
        required this.appontmentType,
        required this.proposalDate,
        required this.proposalStatus,
        required this.acceptStatus,
        required this.acceptDate,
        required this.extra1,
        required this.extra2,
        required this.extra3,
        required this.extra4,
        required this.extra5,
        required this.extra6,
    });

    String encBookingId;
    String referenceNo;
    String bookingFor;
    String bookingNo;
    String bookingDate;
    String visitDate;
    String visitLocation;
    String patientName;
    String patientAddress;
    String patientPhone;
    String patientGender;
    String patientAge;
    String totalFee;
    String totalDiscountedFee;
    String totalBookingFee;
    dynamic paymentMode;
    dynamic transactionNo;
    String paidAmt;
    String dueAmt;
    dynamic cancelDate;
    String paymentStatus;
    dynamic appontmentType;
    String proposalDate;
    String proposalStatus;
    String acceptStatus;
    String acceptDate;
    dynamic extra1;
    String extra2;
    dynamic extra3;
    dynamic extra4;
    String extra5;
    dynamic extra6;

    factory TRequestDetails.fromJson(Map<String, dynamic> json) => TRequestDetails(
        encBookingId: json["EncBookingId"],
        referenceNo: json["ReferenceNo"],
        bookingFor: json["BookingFor"],
        bookingNo: json["BookingNo"],
        bookingDate: json["BookingDate"],
        visitDate: json["VisitDate"],
        visitLocation: json["VisitLocation"],
        patientName: json["PatientName"],
        patientAddress: json["PatientAddress"],
        patientPhone: json["PatientPhone"],
        patientGender: json["PatientGender"],
        patientAge: json["PatientAge"],
        totalFee: json["TotalFee"],
        totalDiscountedFee: json["TotalDiscountedFee"],
        totalBookingFee: json["TotalBookingFee"],
        paymentMode: json["PaymentMode"],
        transactionNo: json["TransactionNo"],
        paidAmt: json["PaidAmt"],
        dueAmt: json["DueAmt"],
        cancelDate: json["CancelDate"],
        paymentStatus: json["PaymentStatus"],
        appontmentType: json["AppontmentType"],
        proposalDate: json["ProposalDate"],
        proposalStatus: json["ProposalStatus"],
        acceptStatus: json["AcceptStatus"],
        acceptDate: json["AcceptDate"],
        extra1: json["Extra1"],
        extra2: json["Extra2"],
        extra3: json["Extra3"],
        extra4: json["Extra4"],
        extra5: json["Extra5"],
        extra6: json["Extra6"],
    );

    Map<String, dynamic> toJson() => {
        "EncBookingId": encBookingId,
        "ReferenceNo": referenceNo,
        "BookingFor": bookingFor,
        "BookingNo": bookingNo,
        "BookingDate": bookingDate,
        "VisitDate": visitDate,
        "VisitLocation": visitLocation,
        "PatientName": patientName,
        "PatientAddress": patientAddress,
        "PatientPhone": patientPhone,
        "PatientGender": patientGender,
        "PatientAge": patientAge,
        "TotalFee": totalFee,
        "TotalDiscountedFee": totalDiscountedFee,
        "TotalBookingFee": totalBookingFee,
        "PaymentMode": paymentMode,
        "TransactionNo": transactionNo,
        "PaidAmt": paidAmt,
        "DueAmt": dueAmt,
        "CancelDate": cancelDate,
        "PaymentStatus": paymentStatus,
        "AppontmentType": appontmentType,
        "ProposalDate": proposalDate,
        "ProposalStatus": proposalStatus,
        "AcceptStatus": acceptStatus,
        "AcceptDate": acceptDate,
        "Extra1": extra1,
        "Extra2": extra2,
        "Extra3": extra3,
        "Extra4": extra4,
        "Extra5": extra5,
        "Extra6": extra6,
    };
}
