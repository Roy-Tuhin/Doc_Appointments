// To parse this JSON data, do
//
//     final docBookingAcknowledgement = docBookingAcknowledgementFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DocBookingAcknowledgement docBookingAcknowledgementFromJson(String str) => DocBookingAcknowledgement.fromJson(json.decode(str));

String docBookingAcknowledgementToJson(DocBookingAcknowledgement data) => json.encode(data.toJson());

class DocBookingAcknowledgement {
    DocBookingAcknowledgement({
        required this.status,
        required this.message,
        required this.bookingNo,
        required this.bookingDate,
        required this.visitDate,
        required this.visitLocation,
        required this.doctorName,
        required this.paidAmt,
        required this.transactionNo,
        required this.refNo,
        required this.timing,
    });

    String status;
    String message;
    String bookingNo;
    String bookingDate;
    String visitDate;
    String visitLocation;
    String doctorName;
    String paidAmt;
    String transactionNo;
    String refNo;
    dynamic timing;

    factory DocBookingAcknowledgement.fromJson(Map<String, dynamic> json) => DocBookingAcknowledgement(
        status: json["Status"],
        message: json["Message"],
        bookingNo: json["BookingNo"],
        bookingDate: json["BookingDate"],
        visitDate: json["VisitDate"],
        visitLocation: json["VisitLocation"],
        doctorName: json["DoctorName"],
        paidAmt: json["PaidAmt"],
        transactionNo: json["TransactionNo"],
        refNo: json["RefNo"],
        timing: json["Timing"],
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "BookingNo": bookingNo,
        "BookingDate": bookingDate,
        "VisitDate": visitDate,
        "VisitLocation": visitLocation,
        "DoctorName": doctorName,
        "PaidAmt": paidAmt,
        "TransactionNo": transactionNo,
        "RefNo": refNo,
        "Timing": timing,
    };
}