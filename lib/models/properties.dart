// To parse this JSON data, do
//
//     final allProperties = allPropertiesFromJson(jsonString);

import 'dart:convert';

List<AllProperties> allPropertiesFromJson(String str) => List<AllProperties>.from(json.decode(str).map((x) => AllProperties.fromJson(x)));

String allPropertiesToJson(List<AllProperties> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllProperties {
  int id;
  int userId;
  int viewPlanId;
  int propertyId;
  int? monthlyRent;
  int? maxDuration;
  int visibility;
  DateTime createdAt;
  DateTime updatedAt;
  String postType;
  Property property;
  int? price;

  AllProperties({
    required this.id,
    required this.userId,
    required this.viewPlanId,
    required this.propertyId,
    this.monthlyRent,
    this.maxDuration,
    required this.visibility,
    required this.createdAt,
    required this.updatedAt,
    required this.postType,
    required this.property,
    this.price,
  });

  factory AllProperties.fromJson(Map<String, dynamic> json) => AllProperties(
    id: json["id"],
    userId: json["user_id"],
    viewPlanId: json["view_plan_id"],
    propertyId: json["property_id"],
    monthlyRent: json["monthly_rent"],
    maxDuration: json["max_duration"],
    visibility: json["visibility"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    postType: json["post_type"],
    property: Property.fromJson(json["property"]),
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "post_type": postType,
    "property": property.toJson(),
    "price": price,
  };
}

class Property {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int userId;
  String name;
  double latitude;
  double longitude;
  String address;
  String about;
  dynamic the360View;
  int area;
  int categoryId;
  int imageCount;
  String category;
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
  dynamic elevator;
  int? securityGard;

  Property({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.about,
    this.the360View,
    required this.area,
    required this.categoryId,
    required this.imageCount,
    required this.category,
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
    this.elevator,
    this.securityGard,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
    name: json["name"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    address: json["address"],
    about: json["about"],
    the360View: json["360_view"],
    area: json["area"],
    categoryId: json["category_id"],
    imageCount: json["image_count"],
    category: json["category"],
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
    elevator: json["elevator"],
    securityGard: json["security_gard"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user_id": userId,
    "name": name,
    "latitude": latitude,
    "longitude": longitude,
    "address": address,
    "about": about,
    "360_view": the360View,
    "area": area,
    "category_id": categoryId,
    "image_count": imageCount,
    "category": category,
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
    "elevator": elevator,
    "security_gard": securityGard,
  };
}
