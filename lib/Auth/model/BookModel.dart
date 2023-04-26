// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

BookingModel bookingModelFromJson(String str) => BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
  BookingModel({
    this.status,
    this.message,
    this.limit,
    this.page,
    this.data,
  });

  int? status;
  String? message;
  String? limit;
  int? page;
  List<Datum>? data;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    status: json["status"],
    message: json["message"],
    limit: json["limit"]??"",
    page: json["page"],
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "limit": limit,
    "page": page,
    "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.bookingNo,
    this.adminMasterId,
    this.usersId,
    this.couponId,
    this.couponCode,
    this.date,
    this.time,
    this.status,
    this.addDate,
    this.modifyDate,
    this.zymName,
    this.checkIn,
    this.checkOut,
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
  String? status;
  String? addDate;
  String? modifyDate;
  String? zymName;
  dynamic checkIn;
  dynamic checkOut;
  String? qrimage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    bookingNo: json["booking_no"],
    adminMasterId: json["admin_master_id"],
    usersId: json["users_id"],
    couponId: json["coupon_id"],
    couponCode: json["coupon_code"],
    date: json["date"],
    time: json["time"],
    status: json["status"],
    addDate: json["add_date"],
    modifyDate: json["modify_date"],
    zymName: json["zym_name"],
    checkIn: json["check_in"],
    checkOut: json["check_out"],
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
    "status": status,
    "add_date": addDate,
    "modify_date": modifyDate,
    "zym_name": zymName,
    "check_in": checkIn,
    "check_out": checkOut,
    "qrimage": qrimage,
  };
}
