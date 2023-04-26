// To parse this JSON data, do
//
//     final scanerData = scanerDataFromJson(jsonString);

import 'dart:convert';

ScanerData scanerDataFromJson(String str) => ScanerData.fromJson(json.decode(str));

String scanerDataToJson(ScanerData data) => json.encode(data.toJson());

class ScanerData
{
  ScanerData({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory ScanerData.fromJson(Map<String, dynamic> json) => ScanerData(
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
    this.userName,
    this.age,
    this.height,
    this.weight,
    this.gender,
    this.walletAmount,
    this.zymName,
    this.gymWallet,
  });

  String? id;
  String?bookingNo;
  String? adminMasterId;
  String? usersId;
  String? couponId;
  String? couponCode;
  String? date;
  String? time;
  String? checkIn;
  String?checkOut;
  String? checkStatus;
  String? checkInBy;
  String? checkOutBy;
  String?status;
  String?addDate;
  String? modifyDate;
  String? userName;
  String? age;
  String? height;
  String? weight;
  String? gender;
  String? walletAmount;
  String? zymName;
  String? gymWallet;

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
    userName: json["userName"],
    age: json["age"],
    height: json["height"],
    weight: json["weight"],
    gender: json["gender"],
    walletAmount: json["wallet_amount"],
    zymName: json["zym_name"],
    gymWallet: json["gymWallet"],
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
    "userName": userName,
    "age": age,
    "height": height,
    "weight": weight,
    "gender": gender,
    "wallet_amount": walletAmount,
    "zym_name": zymName,
    "gymWallet": gymWallet,
  };
}
