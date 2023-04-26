// To parse this JSON data, do
//
//     final gymListModel = gymListModelFromJson(jsonString);

import 'dart:convert';

GymListModel gymListModelFromJson(String str) => GymListModel.fromJson(json.decode(str));
String gymListModelToJson(GymListModel data) => json.encode(data.toJson());
class GymListModel {
  GymListModel({
    this.status,
    this.message,
    this.limit,
    this.page,
    this.data,
  });

  int? status;
  String? message;
  int? limit;
  int? page;
  List<Datumgym>? data;

  factory GymListModel.fromJson(Map<String, dynamic> json) => GymListModel(
    status: json["status"],
    message: json["message"],
    limit: json["limit"],
    page: json["page"],
    data: List<Datumgym>.from(json["Data"].map((x) => Datumgym.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "limit": limit,
    "page": page,
    "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datumgym {
  Datumgym({
    this.id,
    this.adminMasterId,
    this.name,
    this.zymName,
    this.email,
    this.mobile,
    this.password,
    this.type,
    this.profile,
    this.stateId,
    this.cityId,
    this.zipCode,
    this.address,
    this.description,
    this.latitude,
    this.longitude,
    this.walletAmount,
    this.status,
    this.addDate,
    this.stateTitle,
    this.cityName,
    this.noUserOnline,
    this.noUserOffline,
  });

  String? id;
  String? adminMasterId;
  String? name;
  String? zymName;
  String? email;
  String? mobile;
  String? password;
  String? type;
  String? profile;
  String? stateId;
  String? cityId;
  String? zipCode;
  String? address;
  String? description;
  String? latitude;
  String? longitude;
  String? walletAmount;
  String? status;
  DateTime? addDate;
  String? stateTitle;
  String? cityName;
  String? noUserOnline;
  String? noUserOffline;

  factory Datumgym.fromJson(Map<String, dynamic> json) => Datumgym(
    id: json["id"],
    adminMasterId: json["admin_master_id"],
    name: json["name"],
    zymName: json["zym_name"],
    email: json["email"],
    mobile: json["mobile"],
    password: json["password"],
    type: json["type"],
    profile: json["profile"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    zipCode: json["zip_code"],
    address: json["address"],
    description: json["description"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    walletAmount: json["wallet_amount"],
    status: json["status"],
    addDate: DateTime.parse(json["add_date"]),
    stateTitle: json["state_title"],
    cityName: json["city_Name"],
    noUserOnline: json["noUserOnline"],
    noUserOffline: json["noUserOffline"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_master_id": adminMasterId,
    "name": name,
    "zym_name": zymName,
    "email": email,
    "mobile": mobile,
    "password": password,
    "type": type,
    "profile": profile,
    "state_id": stateId,
    "city_id": cityId,
    "zip_code": zipCode,
    "address": address,
    "description": description,
    "latitude": latitude,
    "longitude": longitude,
    "wallet_amount": walletAmount,
    "status": status,
    "add_date": addDate!.toIso8601String(),
    "state_title": stateTitle,
    "city_Name": cityName,
    "noUserOnline": noUserOnline,
    "noUserOffline": noUserOffline,
  };
}
