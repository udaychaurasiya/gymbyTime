// To parse this JSON data, do
//
//     final gymBookModel = gymBookModelFromJson(jsonString);

import 'dart:convert';

GymBookModel gymBookModelFromJson(String str) => GymBookModel.fromJson(json.decode(str));

String gymBookModelToJson(GymBookModel data) => json.encode(data.toJson());

class GymBookModel {
  GymBookModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory GymBookModel.fromJson(Map<String, dynamic> json) => GymBookModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.bookingNo,
    this.adminMasterId,
    this.usersId,
    this.couponId,
    this.couponCode,
    this.date,
    this.time,
    this.checkIn,
    this.checkOut,
    this.checkStatus,
    this.checkInBy,
    this.checkOutBy,
    this.status,
    this.addDate,
    this.modifyDate,
    this.zymName,
    this.qrimage,
  });

  String? id;
  String? bookingNo;
  String? adminMasterId;
  String? usersId;
  String? couponId;
  String? couponCode;
  String? date;
  String? time;
  String? checkIn;
  String? checkOut;
  String? checkStatus;
  String? checkInBy;
  String? checkOutBy;
  String? status;
  String? addDate;
  String? modifyDate;
  String? zymName;
  String? qrimage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    bookingNo: json["booking_no"],
    adminMasterId: json["admin_master_id"],
    usersId: json["users_id"],
    couponId: json["coupon_id"],
    couponCode: json["coupon_code"],
    date: json["date"],
    time: json["time"],
    checkIn: json["check_in"],
    checkOut: json["check_out"],
    checkStatus: json["check_status"],
    checkInBy: json["check_in_by"],
    checkOutBy: json["check_out_by"],
    status: json["status"],
    addDate: json["add_date"],
    modifyDate: json["modify_date"],
    zymName: json["zym_name"],
    qrimage: json["qrimage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "booking_no": bookingNo,
    "admin_master_id": adminMasterId,
    "users_id": usersId,
    "coupon_id": couponId,
    "coupon_code": couponCode,
    "date": date,
    "time": time,
    "check_in": checkIn,
    "check_out": checkOut,
    "check_status": checkStatus,
    "check_in_by": checkInBy,
    "check_out_by": checkOutBy,
    "status": status,
    "add_date": addDate,
    "modify_date": modifyDate,
    "zym_name": zymName,
    "qrimage": qrimage,
  };
}
