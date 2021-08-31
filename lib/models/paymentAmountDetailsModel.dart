// To parse this JSON data, do
//
//     final paymentAmountDetailsModel = paymentAmountDetailsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PaymentAmountDetailsModel paymentAmountDetailsModelFromJson(String str) => PaymentAmountDetailsModel.fromJson(json.decode(str));

String paymentAmountDetailsModelToJson(PaymentAmountDetailsModel data) => json.encode(data.toJson());

class PaymentAmountDetailsModel {
    PaymentAmountDetailsModel({
        required this.status,
        required this.message,
        required this.encBookingId,
        required this.paymentAmount,
    });

    String status;
    String message;
    String encBookingId;
    String paymentAmount;

    factory PaymentAmountDetailsModel.fromJson(Map<String, dynamic> json) => PaymentAmountDetailsModel(
        status: json["Status"],
        message: json["Message"],
        encBookingId: json["EncBookingId"],
        paymentAmount: json["PaymentAmount"],
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "EncBookingId": encBookingId,
        "PaymentAmount": paymentAmount,
    };
}
