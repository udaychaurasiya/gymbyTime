// To parse this JSON data, do
//
//     final offerModel = offerModelFromJson(jsonString);

import 'dart:convert';

OfferModel offerModelFromJson(String str) => OfferModel.fromJson(json.decode(str));

String offerModelToJson(OfferModel data) => json.encode(data.toJson());

class OfferModel {
  OfferModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
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
    this.title,
    this.amount,
    this.couonCode,
    this.description,
    this.status,
    this.addDate,
  });

  String? id;
  String? title;
  String? amount;
  String? couonCode;
  String? description;
  String? status;
  DateTime? addDate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    amount: json["amount"],
    couonCode: json["couon_code"],
    description: json["description"],
    status: json["status"],
    addDate: DateTime.parse(json["add_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "amount": amount,
    "couon_code": couonCode,
    "description": description,
    "status": status,
    "add_date": addDate!.toIso8601String(),
  };
}
