// To parse this JSON data, do
//
//     final myProperties = myPropertiesFromJson(jsonString);

import 'dart:convert';

List<MyProperties> myPropertiesFromJson(String str) => List<MyProperties>.from(
    json.decode(str).map((x) => MyProperties.fromJson(x)));

String myPropertiesToJson(List<MyProperties> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyProperties {
  int id;
  int userId;
  int? viewPlanId;
  String propertyType;
  int propertyId;
  int? price;
  int? monthlyRent;
  int? maxDuration;
  int visibility;
  DateTime createdAt;
  DateTime updatedAt;
  Property property;

  MyProperties({
    required this.id,
    required this.userId,
    this.viewPlanId,
    required this.propertyType,
    required this.propertyId,
    this.price,
    this.monthlyRent,
    this.maxDuration,
    required this.visibility,
    required this.createdAt,
    required this.updatedAt,
    required this.property,
  });

  factory MyProperties.fromJson(Map<String, dynamic> json) => MyProperties(
        id: json["id"],
        userId: json["user_id"],
        viewPlanId: json["view_plan_id"],
        propertyType: json["property_type"],
        propertyId: json["property_id"],
        price: json["price"],
        monthlyRent: json["monthly_rent"],
        maxDuration: json["max_duration"],
        visibility: json["visibility"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        property: Property.fromJson(json["property"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "view_plan_id": viewPlanId,
        "property_type": propertyType,
        "property_id": propertyId,
        "price": price,
        "monthly_rent": monthlyRent,
        "max_duration": maxDuration,
        "visibility": visibility,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "property": property.toJson(),
      };
}

class Property {
  int id;
  int userId;
  String name;
  String address;
  String about;
  String ?the360View;
  String? imageLibrary;
  int? roomCount;
  int? bathroomCount;
  int? kitchenCount;
  int? storey;
  int area;
  int? balkony;
  int? gym;
  int? pool;
  int? parking;
  int? securityCameras;
  int? elevator;
  int? wiFi;
  int? securityGard;
  DateTime createdAt;
  DateTime updatedAt;
  int? garden;

  Property({
    required this.id,
    required this.userId,
    required this.name,
    required this.address,
    required this.about,
     this.the360View,
     this.imageLibrary,
    this.roomCount,
    this.bathroomCount,
    this.kitchenCount,
    this.storey,
    required this.area,
    this.balkony,
    this.gym,
    this.pool,
    this.parking,
    this.securityCameras,
    this.elevator,
    this.wiFi,
    this.securityGard,
     required this.createdAt,
    required this.updatedAt,
    this.garden,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        address: json["address"],
        about: json["about"],
        the360View: json["360_view"],
        imageLibrary: json["image_library"],
        roomCount: json["room_count"],
        bathroomCount: json["bathroom_count"],
        kitchenCount: json["kitchen_count"],
        storey: json["storey"],
        area: json["area"],
        balkony: json["balkony"],
        gym: json["gym"],
        pool: json["pool"],
        parking: json["parking"],
        securityCameras: json["security_cameras"],
        elevator: json["elevator"],
        wiFi: json["Wi-Fi"],
        securityGard: json["security_gard"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        garden: json["garden"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "address": address,
        "about": about,
        "360_view": the360View,
        "image_library": imageLibrary,
        "room_count": roomCount,
        "bathroom_count": bathroomCount,
        "kitchen_count": kitchenCount,
        "storey": storey,
        "area": area,
        "balkony": balkony,
        "gym": gym,
        "pool": pool,
        "parking": parking,
        "security_cameras": securityCameras,
        "elevator": elevator,
        "Wi-Fi": wiFi,
        "security_gard": securityGard,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "garden": garden,
      };
}
