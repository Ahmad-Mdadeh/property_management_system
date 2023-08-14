// To parse this JSON data, do
//
//     final infoProfile = infoProfileFromJson(jsonString);

import 'dart:convert';

InfoProfile infoProfileFromJson(String str) => InfoProfile.fromJson(json.decode(str));

String infoProfileToJson(InfoProfile data) => json.encode(data.toJson());

class InfoProfile {
  bool? status;
  User? user;

  InfoProfile({
    this.status,
    this.user,
  });

  factory InfoProfile.fromJson(Map<String, dynamic> json) => InfoProfile(
    status: json["status"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "user": user?.toJson(),
  };
}

class User {
  int? id;
  String? name;
  String? phone;
  dynamic balance;
  int? verified;
  String? profilePhotoUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.phone,
    this.balance,
    this.verified,
    this.profilePhotoUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    balance: json["balance"],
    verified: json["verified"],
    profilePhotoUrl: json["profile_photo_url"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "balance": balance,
    "verified": verified,
    "profile_photo_url": profilePhotoUrl,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
