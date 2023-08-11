// To parse this JSON data, do
//
//     final propertiesDetails = propertiesDetailsFromJson(jsonString);

import 'dart:convert';

PropertiesDetails propertiesDetailsFromJson(String str) => PropertiesDetails.fromJson(json.decode(str));

String propertiesDetailsToJson(PropertiesDetails data) => json.encode(data.toJson());

class PropertiesDetails {
  int? id;
  int? userId;
  int? viewPlanId;
  int? propertyId;
  int? monthlyRent;
  int? maxDuration;
  int? visibility;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? posttype;
  Property? property;

  PropertiesDetails({
    this.id,
    this.userId,
    this.viewPlanId,
    this.propertyId,
    this.monthlyRent,
    this.maxDuration,
    this.visibility,
    this.createdAt,
    this.updatedAt,
    this.posttype,
    this.property,
  });

  factory PropertiesDetails.fromJson(Map<String, dynamic> json) => PropertiesDetails(
    id: json["id"],
    userId: json["user_id"],
    viewPlanId: json["view_plan_id"],
    propertyId: json["property_id"],
    monthlyRent: json["monthly_rent"],
    maxDuration: json["max_duration"],
    visibility: json["visibility"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    posttype: json["posttype"],
    property: json["property"] == null ? null : Property.fromJson(json["property"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "view_plan_id": viewPlanId,
    "property_id": propertyId,
    "monthly_rent": monthlyRent,
    "max_duration": maxDuration,
    "visibility": visibility,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "posttype": posttype,
    "property": property?.toJson(),
  };
}

class Property {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  String? name;
  double? latitude;
  double? longitude;
  String? address;
  String? about;
  dynamic the360View;
  int? area;
  String? categoryType;
  int? categoryId;
  int? imageCount;
  int? roomCount;
  int? bathroomCount;
  int? kitchenCount;
  int? storey;
  int? balkony;
  int? parking;
  int? securityCameras;
  dynamic elevator;
  int? wiFi;
  int? securityGard;

  Property({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.name,
    this.latitude,
    this.longitude,
    this.address,
    this.about,
    this.the360View,
    this.area,
    this.categoryType,
    this.categoryId,
    this.imageCount,
    this.roomCount,
    this.bathroomCount,
    this.kitchenCount,
    this.storey,
    this.balkony,
    this.parking,
    this.securityCameras,
    this.elevator,
    this.wiFi,
    this.securityGard,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
    name: json["name"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    address: json["address"],
    about: json["about"],
    the360View: json["360_view"],
    area: json["area"],
    categoryType: json["category_type"],
    categoryId: json["category_id"],
    imageCount: json["image_count"],
    roomCount: json["room_count"],
    bathroomCount: json["bathroom_count"],
    kitchenCount: json["kitchen_count"],
    storey: json["storey"],
    balkony: json["balkony"],
    parking: json["parking"],
    securityCameras: json["security_cameras"],
    elevator: json["elevator"],
    wiFi: json["Wi-Fi"],
    securityGard: json["security_gard"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "user_id": userId,
    "name": name,
    "latitude": latitude,
    "longitude": longitude,
    "address": address,
    "about": about,
    "360_view": the360View,
    "area": area,
    "category_type": categoryType,
    "category_id": categoryId,
    "image_count": imageCount,
    "room_count": roomCount,
    "bathroom_count": bathroomCount,
    "kitchen_count": kitchenCount,
    "storey": storey,
    "balkony": balkony,
    "parking": parking,
    "security_cameras": securityCameras,
    "elevator": elevator,
    "Wi-Fi": wiFi,
    "security_gard": securityGard,
  };
}
