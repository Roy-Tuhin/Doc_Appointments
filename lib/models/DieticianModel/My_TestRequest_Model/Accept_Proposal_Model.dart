// To parse this JSON data, do
//
//     final acceptProposalModel = acceptProposalModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AcceptProposalModel acceptProposalModelFromJson(String str) => AcceptProposalModel.fromJson(json.decode(str));

String acceptProposalModelToJson(AcceptProposalModel data) => json.encode(data.toJson());

class AcceptProposalModel {
    AcceptProposalModel({
        required this.status,
        required this.message,
        required this.encBookingId,
    });

    String status;
    String message;
    dynamic encBookingId;

    factory AcceptProposalModel.fromJson(Map<String, dynamic> json) => AcceptProposalModel(
        status: json["Status"],
        message: json["Message"],
        encBookingId: json["EncBookingId"],
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "EncBookingId": encBookingId,
    };
}
