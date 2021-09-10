// To parse this JSON data, do
//
//     final getTestFeeModel = getTestFeeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetTestFeeModel getTestFeeModelFromJson(String str) => GetTestFeeModel.fromJson(json.decode(str));

String getTestFeeModelToJson(GetTestFeeModel data) => json.encode(data.toJson());

class GetTestFeeModel {
    GetTestFeeModel({
        required this.encPartnerId,
        required this.encTestId,
        required this.fee,
        required this.discountedFee,
        required this.bookingFee,
    });

    String encPartnerId;
    String encTestId;
    String fee;
    String discountedFee;
    String bookingFee;

    factory GetTestFeeModel.fromJson(Map<String, dynamic> json) => GetTestFeeModel(
        encPartnerId: json["EncPartnerId"],
        encTestId: json["EncTestId"],
        fee: json["Fee"],
        discountedFee: json["DiscountedFee"],
        bookingFee: json["BookingFee"],
    );

    Map<String, dynamic> toJson() => {
        "EncPartnerId": encPartnerId,
        "EncTestId": encTestId,
        "Fee": fee,
        "DiscountedFee": discountedFee,
        "BookingFee": bookingFee,
    };
}
