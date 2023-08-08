// To parse this JSON data, do
//
//     final myProperties = myPropertiesFromJson(jsonString);

import 'dart:convert';

MyProperties myPropertiesFromJson(String str) => MyProperties.fromJson(json.decode(str));

String myPropertiesToJson(MyProperties data) => json.encode(data.toJson());

class MyProperties {
  List<Post> salePosts;
  List<Post> rentPosts;

  MyProperties({
    required this.salePosts,
    required this.rentPosts,
  });

  factory MyProperties.fromJson(Map<String, dynamic> json) => MyProperties(
    salePosts: List<Post>.from(json["sale_posts"].map((x) => Post.fromJson(x))),
    rentPosts: List<Post>.from(json["rent_posts"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sale_posts": List<dynamic>.from(salePosts.map((x) => x.toJson())),
    "rent_posts": List<dynamic>.from(rentPosts.map((x) => x.toJson())),
  };
}

class Post {
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
  int? price;

  Post({
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
    this.price,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
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
    "price": price,
  };
}
