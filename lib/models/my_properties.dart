// To parse this JSON data, do
//
//     final myProperties = myPropertiesFromJson(jsonString);

import 'dart:convert';

MyProperties myPropertiesFromJson(String str) =>
    MyProperties.fromJson(json.decode(str));

String myPropertiesToJson(MyProperties data) => json.encode(data.toJson());

class MyProperties {
  List<SalePost>? salePosts;
  List<RentPost>? rentPosts;

  MyProperties({
    this.salePosts,
    this.rentPosts,
  });

  factory MyProperties.fromJson(Map<String, dynamic> json) => MyProperties(
        salePosts: json["sale_posts"] == null
            ? []
            : List<SalePost>.from(
                json["sale_posts"]!.map((x) => SalePost.fromJson(x))),
        rentPosts: json["rent_posts"] == null
            ? []
            : List<RentPost>.from(
                json["rent_posts"]!.map((x) => RentPost.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sale_posts": salePosts == null
            ? []
            : List<dynamic>.from(salePosts!.map((x) => x.toJson())),
        "rent_posts": rentPosts == null
            ? []
            : List<dynamic>.from(rentPosts!.map((x) => x.toJson())),
      };
}

class RentPost {
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

  RentPost({
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

  factory RentPost.fromJson(Map<String, dynamic> json) => RentPost(
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
        posttype: json["posttype"],
        property: json["property"] == null
            ? null
            : Property.fromJson(json["property"]),
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
  int? gym;
  int? pool;
  int? parking;
  int? securityCameras;
  int? elevator;
  int? wiFi;
  int? securityGard;
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
    this.roomCount,
    this.bathroomCount,
    this.kitchenCount,
    this.storey,
    this.balkony,
    this.gym,
    this.pool,
    this.parking,
    this.securityCameras,
    this.elevator,
    this.wiFi,
    this.securityGard,
    this.garden,
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
        roomCount: json["room_count"],
        bathroomCount: json["bathroom_count"],
        kitchenCount: json["kitchen_count"],
        storey: json["storey"],
        balkony: json["balkony"],
        gym: json["gym"],
        pool: json["pool"],
        parking: json["parking"],
        securityCameras: json["security_cameras"],
        elevator: json["elevator"],
        wiFi: json["Wi-Fi"],
        securityGard: json["security_gard"],
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
        "room_count": roomCount,
        "bathroom_count": bathroomCount,
        "kitchen_count": kitchenCount,
        "storey": storey,
        "balkony": balkony,
        "gym": gym,
        "pool": pool,
        "parking": parking,
        "security_cameras": securityCameras,
        "elevator": elevator,
        "Wi-Fi": wiFi,
        "security_gard": securityGard,
        "garden": garden,
      };
}

class SalePost {
  int? id;
  int? userId;
  int? viewPlanId;
  int? propertyId;
  int? price;
  int? visibility;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? posttype;
  Property? property;

  SalePost({
    this.id,
    this.userId,
    this.viewPlanId,
    this.propertyId,
    this.price,
    this.visibility,
    this.createdAt,
    this.updatedAt,
    this.posttype,
    this.property,
  });

  factory SalePost.fromJson(Map<String, dynamic> json) => SalePost(
        id: json["id"],
        userId: json["user_id"],
        viewPlanId: json["view_plan_id"],
        propertyId: json["property_id"],
        price: json["price"],
        visibility: json["visibility"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        posttype: json["posttype"],
        property: json["property"] == null
            ? null
            : Property.fromJson(json["property"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "view_plan_id": viewPlanId,
        "property_id": propertyId,
        "price": price,
        "visibility": visibility,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "posttype": posttype,
        "property": property?.toJson(),
      };
}
