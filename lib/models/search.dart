// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

List<Search> searchFromJson(String str) =>
    List<Search>.from(json.decode(str).map((x) => Search.fromJson(x)));

String searchToJson(List<Search> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Search {
  int? id;
  int? userId;
  int? viewPlanId;
  int? propertyId;
  int? monthlyRent;
  int? maxDuration;
  int? visibility;
  DateTime? createdAt;
  DateTime? updatedAt;
  Property? property;
  String? posttype;

  Search({
    this.id,
    this.userId,
    this.viewPlanId,
    this.propertyId,
    this.monthlyRent,
    this.maxDuration,
    this.visibility,
    this.createdAt,
    this.updatedAt,
    this.property,
    this.posttype,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        id: json["id"],
        userId: json["user_id"],
        viewPlanId: json["view_plan_id"],
        propertyId: json["property_id"],
        monthlyRent: json["monthly_rent"],
        maxDuration: json["max_duration"],
        visibility: json["visibility"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        property: json["property"] == null
            ? null
            : Property.fromJson(json["property"]),
        posttype: json["posttype"],
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
        "property": property?.toJson(),
        "posttype": posttype,
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
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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
      };
}
