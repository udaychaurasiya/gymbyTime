// To parse this JSON data, do
//
//     final scanerModelData = scanerModelDataFromJson(jsonString?);

import 'dart:convert';

ScanerModelData scanerModelDataFromJson(String str) => ScanerModelData.fromJson(json.decode(str));

String scanerModelDataToJson(ScanerModelData data) => json.encode(data.toJson());

class ScanerModelData {
  ScanerModelData({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory ScanerModelData.fromJson(Map<String, dynamic> json) => ScanerModelData(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.bookingNo,
    this.date,
    this.checkIn,
    this.checkOut,
    this.checkStatus,
    this.checkInBy,
    this.checkOutBy,
    this.username,
    this.mobile,
    this.checkInByName,
    this.checkOutByName,
  });

  String? id;
  String? bookingNo;
  String? date;
  String? checkIn;
  String? checkOut;
  String? checkStatus;
  String? checkInBy;
  String? checkOutBy;
  String? username;
  String? mobile;
  String? checkInByName;
  String? checkOutByName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    bookingNo: json["booking_no"],
    date: json["date"],
    checkIn: json["check_in"],
    checkOut: json["check_out"],
    checkStatus: json["check_status"],
    checkInBy: json["check_in_by"],
    checkOutBy: json["check_out_by"],
    username: json["username"],
    mobile: json["mobile"],
    checkInByName: json["check_in_by_name"],
    checkOutByName: json["check_out_by_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "booking_no": bookingNo,
    "date": date,
    "check_in": checkIn,
    "check_out": checkOut,
    "check_status": checkStatus,
    "check_in_by": checkInBy,
    "check_out_by": checkOutBy,
    "username": username,
    "mobile": mobile,
    "check_in_by_name": checkInByName,
    "check_out_by_name": checkOutByName,
  };
}
