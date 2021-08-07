// To parse this JSON data, do
//
//     final docDetails = docDetailsFromJson(jsonString);

import 'dart:convert';

DocDetails docDetailsFromJson(String str) => DocDetails.fromJson(json.decode(str));

String docDetailsToJson(DocDetails data) => json.encode(data.toJson());

class DocDetails {
  DocDetails({
    required this.status,
    required this.message,
    required this.doctorData,
    required this.partnerData,
  });

  String status;
  String message;
  DoctorData doctorData;
  List<PartnerDatum> partnerData;

  factory DocDetails.fromJson(Map<String, dynamic> json) => DocDetails(
    status: json["Status"],
    message: json["Message"],
    doctorData: DoctorData.fromJson(json["DoctorData"]),
    partnerData: List<PartnerDatum>.from(json["PartnerData"].map((x) => PartnerDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "DoctorData": doctorData.toJson(),
    "PartnerData": List<dynamic>.from(partnerData.map((x) => x.toJson())),
  };
}

class DoctorData {
  DoctorData({
    required this.doctorId,
    required this.encDoctorId,
    required this.doctorName,
    required this.doctorImage,
    required this.linkPartner,
    required this.specialisation,
    required this.gender,
    required this.qualification,
    required this.fee,
    required this.discountedFee,
    required this.bookingFee,
    required this.timeFrom,
    required this.timeTo,
    required this.visitDay,
    required this.phone,
    required this.alternatePhone,
    required this.email,
    required this.note,
    required this.createBy,
    required this.createDate,
    required this.modBy,
    required this.modDate,
    required this.activeStatus,
    required this.permission,
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

  factory DoctorData.fromJson(Map<String, dynamic> json) => DoctorData(
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

class PartnerDatum {
  PartnerDatum({
    required this.partnerId,
    required this.encPartnerId,
    required this.partnerName,
    required this.partnerAddress,
    required this.fee,
    required this.discountedFee,
    required this.bookingFee,
    required this.dayList,
  });

  String partnerId;
  String encPartnerId;
  String partnerName;
  String partnerAddress;
  String fee;
  String discountedFee;
  String bookingFee;
  List<DayList> dayList;

  factory PartnerDatum.fromJson(Map<String, dynamic> json) => PartnerDatum(
    partnerId: json["PartnerId"],
    encPartnerId: json["EncPartnerId"],
    partnerName: json["PartnerName"],
    partnerAddress: json["PartnerAddress"],
    fee: json["Fee"],
    discountedFee: json["DiscountedFee"],
    bookingFee: json["BookingFee"],
    dayList: List<DayList>.from(json["DayList"].map((x) => DayList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "PartnerId": partnerId,
    "EncPartnerId": encPartnerId,
    "PartnerName": partnerName,
    "PartnerAddress": partnerAddress,
    "Fee": fee,
    "DiscountedFee": discountedFee,
    "BookingFee": bookingFee,
    "DayList": List<dynamic>.from(dayList.map((x) => x.toJson())),
  };
}

class DayList {
  DayList({
    required this.dayName,
    required this.timeFrom,
    required this.timeTo,
  });

  String dayName;
  String timeFrom;
  String timeTo;

  factory DayList.fromJson(Map<String, dynamic> json) => DayList(
    dayName: json["DayName"],
    timeFrom: json["TimeFrom"],
    timeTo: json["TimeTo"],
  );

  Map<String, dynamic> toJson() => {
    "DayName": dayName,
    "TimeFrom": timeFrom,
    "TimeTo": timeTo,
  };
}
