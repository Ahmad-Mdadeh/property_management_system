// To parse this JSON data, do
//
//     final createPost = createPostFromJson(jsonString);

import 'dart:convert';

CreatePost createPostFromJson(String str) => CreatePost.fromJson(json.decode(str));

String createPostToJson(CreatePost data) => json.encode(data.toJson());

class CreatePost {
  bool? success;
  String? message;
  Post? post;

  CreatePost({
    this.success,
    this.message,
    this.post,
  });

  factory CreatePost.fromJson(Map<String, dynamic> json) => CreatePost(
    success: json["success"],
    message: json["message"],
    post: json["post"] == null ? null : Post.fromJson(json["post"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "post": post?.toJson(),
  };
}

class Post {
  int? id;
  int? userId;
  dynamic viewPlanId;
  int? propertyId;
  int? price;
  int? visibility;
  int? monthlyRent;
  int? maxDuration;
  dynamic approval;
  dynamic rejectionPurpose;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? posttype;
  Property? property;

  Post({
    this.id,
    this.userId,
    this.viewPlanId,
    this.propertyId,
    this.price,
    this.visibility,
    this.monthlyRent,
    this.maxDuration,
    this.approval,
    this.rejectionPurpose,
    this.createdAt,
    this.updatedAt,
    this.posttype,
    this.property,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    userId: json["user_id"],
    viewPlanId: json["view_plan_id"],
    propertyId: json["property_id"],
    price: json["price"],
    visibility: json["visibility"],
    monthlyRent: json["monthly_rent"],
    maxDuration: json["max_duration"],
    approval: json["approval"],
    rejectionPurpose: json["rejection_purpose"],
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
    "price": price,
    "visibility": visibility,
    "monthly_rent": monthlyRent,
    "max_duration": maxDuration,
    "approval": approval,
    "rejection_purpose": rejectionPurpose,
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
  dynamic latitude;
  dynamic longitude;
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
  dynamic wiFi;
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
    latitude: json["latitude"],
    longitude: json["longitude"],
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
