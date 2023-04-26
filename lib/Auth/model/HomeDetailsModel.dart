// To parse this JSON data, do
//
//     final homeDetailsModel = homeDetailsModelFromJson(jsonString);

import 'dart:convert';

HomeDetailsModel homeDetailsModelFromJson(String str) => HomeDetailsModel.fromJson(json.decode(str));

String homeDetailsModelToJson(HomeDetailsModel data) => json.encode(data.toJson());

class HomeDetailsModel {
  HomeDetailsModel({
     this.status,
     this.message,
     this.data,
  });

  int? status;
  String? message;
  Data? data;

  HomeDetailsModel copyWith({
    int? status,
    String? message,
    Data? data,
  }) =>
      HomeDetailsModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory HomeDetailsModel.fromJson(Map<String, dynamic> json) => HomeDetailsModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["Data"]??""),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Data": data!.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.adminMasterId,
    required this.name,
    required this.zymName,
    required this.email,
    required this.mobile,
    required this.password,
    required this.type,
    required this.profile,
    required this.stateId,
    required this.cityId,
    required this.zipCode,
    required this.address,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.walletAmount,
    required this.status,
    required this.addDate,
    this.stateTitle,
    this.cityName,
    required this.noUserOnline,
    required this.noUserOffline,
    required this.imageList,
    required this.amanities,
  });

  String id;
  String adminMasterId;
  String name;
  String zymName;
  String email;
  String mobile;
  String password;
  String type;
  String profile;
  String stateId;
  String cityId;
  String zipCode;
  String address;
  String description;
  String latitude;
  String longitude;
  String walletAmount;
  String status;
  DateTime addDate;
  dynamic stateTitle;
  dynamic cityName;
  String noUserOnline;
  String noUserOffline;
  List<ImageList> imageList;
  List<Amanity> amanities;

  Data copyWith({
    String? id,
    String? adminMasterId,
    String? name,
    String? zymName,
    String? email,
    String? mobile,
    String? password,
    String? type,
    String? profile,
    String? stateId,
    String? cityId,
    String? zipCode,
    String? address,
    String? description,
    String? latitude,
    String? longitude,
    String? walletAmount,
    String? status,
    DateTime? addDate,
    dynamic stateTitle,
    dynamic cityName,
    String? noUserOnline,
    String? noUserOffline,
    List<ImageList>? imageList,
    List<Amanity>? amanities,
  }) =>
      Data(
        id: id ?? this.id,
        adminMasterId: adminMasterId ?? this.adminMasterId,
        name: name ?? this.name,
        zymName: zymName ?? this.zymName,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        password: password ?? this.password,
        type: type ?? this.type,
        profile: profile ?? this.profile,
        stateId: stateId ?? this.stateId,
        cityId: cityId ?? this.cityId,
        zipCode: zipCode ?? this.zipCode,
        address: address ?? this.address,
        description: description ?? this.description,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        walletAmount: walletAmount ?? this.walletAmount,
        status: status ?? this.status,
        addDate: addDate ?? this.addDate,
        stateTitle: stateTitle ?? this.stateTitle,
        cityName: cityName ?? this.cityName,
        noUserOnline: noUserOnline ?? this.noUserOnline,
        noUserOffline: noUserOffline ?? this.noUserOffline,
        imageList: imageList ?? this.imageList,
        amanities: amanities ?? this.amanities,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    noUserOnline: json["noUserOnline"]??"",
    noUserOffline: json["noUserOffline"]??"",
    imageList: List<ImageList>.from(json["imageList"].map((x) => ImageList.fromJson(x))),
    amanities: List<Amanity>.from(json["amanities"].map((x) => Amanity.fromJson(x))),
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
    "add_date": addDate.toIso8601String(),
    "state_title": stateTitle,
    "city_Name": cityName,
    "noUserOnline": noUserOnline,
    "noUserOffline": noUserOffline,
    "imageList": List<dynamic>.from(imageList.map((x) => x.toJson())),
    "amanities": List<dynamic>.from(amanities.map((x) => x.toJson())),
  };
}

class Amanity {
  Amanity({
    required this.id,
    required this.title,
    required this.image,
  });

  String id;
  String title;
  String image;

  Amanity copyWith({
    String? id,
    String? title,
    String? image,
  }) =>
      Amanity(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
      );

  factory Amanity.fromJson(Map<String, dynamic> json) => Amanity(
    id: json["id"],
    title: json["title"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
  };
}

// enum Image { UPLOADS_AMANITIES_AM1_PNG, UPLOADS_AMANITIES_AM2_PNG }
//
// final imageValues = EnumValues({
//   "uploads/amanities/am1.png": Image.UPLOADS_AMANITIES_AM1_PNG,
//   "uploads/amanities/am2.png": Image.UPLOADS_AMANITIES_AM2_PNG
// });

class ImageList {
  ImageList({
    required this.id,
    required this.image,
  });

  String id;
  String image;

  ImageList copyWith({
    String? id,
    String? image,
  }) =>
      ImageList(
        id: id ?? this.id,
        image: image ?? this.image,
      );

  factory ImageList.fromJson(Map<String, dynamic> json) => ImageList(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
