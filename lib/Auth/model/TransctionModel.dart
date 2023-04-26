// To parse this JSON data, do
//
//     final transctionModel = transctionModelFromJson(jsonString);

import 'dart:convert';

TransctionModel transctionModelFromJson(String str) => TransctionModel.fromJson(json.decode(str));

String transctionModelToJson(TransctionModel data) => json.encode(data.toJson());

class TransctionModel {
  TransctionModel({
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

  factory TransctionModel.fromJson(Map<String, dynamic> json) => TransctionModel(
    status: json["status"],
    message: json["message"],
    limit: json["limit"],
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
    this.amount,
    this.description,
    this.status,
    this.txnId,
    this.addDate,
  });

  String? id;
  String? amount;
  String? description;
  String? status;
  String? txnId;
  String? addDate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    amount: json["amount"],
    description: json["description"],
    status: json["status"],
    txnId: json["txn_id"],
    addDate: json["add_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "amount": amount,
    "description": description,
    "status": status,
    "txn_id": txnId,
    "add_date": addDate,
  };
}