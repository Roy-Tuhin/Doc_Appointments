// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    required this.status,
    required this.message,
    required this.partner,
  });

  String status;
  String message;
  List<Partner> partner;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        status: json["Status"],
        message: json["Message"],
        partner:
            List<Partner>.from(json["Partner"].map((x) => Partner.fromJson(x))),
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

