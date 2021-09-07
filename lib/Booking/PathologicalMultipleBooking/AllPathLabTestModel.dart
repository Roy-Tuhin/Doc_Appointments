// To parse this JSON data, do
//
//     final allPathLabTestModel = allPathLabTestModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AllPathLabTestModel allPathLabTestModelFromJson(String str) => AllPathLabTestModel.fromJson(json.decode(str));

String allPathLabTestModelToJson(AllPathLabTestModel data) => json.encode(data.toJson());

class AllPathLabTestModel {
    AllPathLabTestModel({
        required this.status,
        required this.message,
        required this.partner,
    });

    String status;
    String message;
    List<Partner> partner;

    factory AllPathLabTestModel.fromJson(Map<String, dynamic> json) => AllPathLabTestModel(
        status: json["Status"],
        message: json["Message"],
        partner: List<Partner>.from(json["Partner"].map((x) => Partner.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Partner": List<dynamic>.from(partner.map((x) => x.toJson())),
    };
}

class Partner {
    Partner({
        required this.encPartnerId,
        required this.partnerName,
    });

    String encPartnerId;
    String partnerName;

    factory Partner.fromJson(Map<String, dynamic> json) => Partner(
        encPartnerId: json["EncPartnerId"],
        partnerName: json["PartnerName"] == null ? null : json["PartnerName"],
    );

    Map<String, dynamic> toJson() => {
        "EncPartnerId": encPartnerId,
        "PartnerName": partnerName == null ? null : partnerName,
    };
}