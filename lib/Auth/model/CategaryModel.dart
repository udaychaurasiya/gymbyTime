// To parse this JSON data, do
//
//     final categryModel = categryModelFromJson(jsonString);

import 'dart:convert';

CategryModel categryModelFromJson(String str) => CategryModel.fromJson(json.decode(str));

String categryModelToJson(CategryModel data) => json.encode(data.toJson());

class CategryModel {
  CategryModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory CategryModel.fromJson(Map<String, dynamic> json) => CategryModel(
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
    this.description,
    this.image,
    this.status,
    this.addDate,
  });

  String? id;
  String? title;
  String? amount;
  String? description;
  String? image;
  String? status;
  DateTime? addDate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    amount: json["amount"],
    description: json["description"],
    image: json["image"],
    status: json["status"],
    addDate: DateTime.parse(json["add_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "amount": amount,
    "description": description,
    "image": image,
    "status": status,
    "add_date": addDate!.toIso8601String(),
  };
}
