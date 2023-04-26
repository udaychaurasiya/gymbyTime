// To parse this JSON data, do
//
//     final signUp = signUpFromJson(jsonString);

import 'dart:convert';

SignUp signUpFromJson(String str) => SignUp.fromJson(json.decode(str));

String signUpToJson(SignUp data) => json.encode(data.toJson());

class SignUp {
  SignUp({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
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
    this.otp,
    this.id,
    this.name,
  });

  String? otp;
  String? id;
  String? name;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    otp: json["otp"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp,
    "id": id,
    "name": name,
  };
}
