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
  int? approval;
  String? rejectionPurpose;
  DateTime? createdAt;
  DateTime? updatedAt;
  Property? property;
  String? posttype;
  int? price;

  PropertiesDetails({
    this.id,
    this.userId,
    this.viewPlanId,
    this.propertyId,
    this.monthlyRent,
    this.maxDuration,
    this.visibility,
    this.approval,
    this.rejectionPurpose,
    this.createdAt,
    this.updatedAt,
    this.property,
    this.posttype,
    this.price,

  });

  factory PropertiesDetails.fromJson(Map<String, dynamic> json) => PropertiesDetails(
    id: json["id"],
    userId: json["user_id"],
    viewPlanId: json["view_plan_id"],
    propertyId: json["property_id"],
    monthlyRent: json["monthly_rent"],
    maxDuration: json["max_duration"],
    visibility: json["visibility"],
    approval: json["approval"],
    rejectionPurpose: json["rejection_purpose"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    property: json["property"] == null ? null : Property.fromJson(json["property"]),
    posttype: json["posttype"],
    price: json["price"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "view_plan_id": viewPlanId,
    "property_id": propertyId,
    "monthly_rent": monthlyRent,
    "max_duration": maxDuration,
    "visibility": visibility,
    "approval": approval,
    "rejection_purpose": rejectionPurpose,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "property": property?.toJson(),
    "posttype": posttype,
    "price": price,

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
  List<dynamic>? imageUrls;
  int? roomCount;
  int? bathroomCount;
  int? kitchenCount;
  int? storey;
  int? balkony;
  int? pool;
  int? parking;
  int? securityCameras;
  int? wiFi;
  int? garden;

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
    this.imageUrls,
    this.roomCount,
    this.bathroomCount,
    this.kitchenCount,
    this.storey,
    this.balkony,
    this.pool,
    this.parking,
    this.securityCameras,
    this.wiFi,
    this.garden,
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
    imageUrls: json["image_urls"] == null ? [] : List<dynamic>.from(json["image_urls"]!.map((x) => x)),
    roomCount: json["room_count"],
    bathroomCount: json["bathroom_count"],
    kitchenCount: json["kitchen_count"],
    storey: json["storey"],
    balkony: json["balkony"],
    pool: json["pool"],
    parking: json["parking"],
    securityCameras: json["security_cameras"],
    wiFi: json["Wi-Fi"],
    garden: json["garden"],
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
    "image_urls": imageUrls == null ? [] : List<dynamic>.from(imageUrls!.map((x) => x)),
    "room_count": roomCount,
    "bathroom_count": bathroomCount,
    "kitchen_count": kitchenCount,
    "storey": storey,
    "balkony": balkony,
    "pool": pool,
    "parking": parking,
    "security_cameras": securityCameras,
    "Wi-Fi": wiFi,
    "garden": garden,
  };
}
