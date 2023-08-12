// To parse this JSON data, do
//
//     final auth = authFromJson(jsonString);

import 'dart:convert';

Favorites favoritesFromJson(String str) => Favorites.fromJson(json.decode(str));

String favoritesToJson(Favorites data) => json.encode(data.toJson());

class Favorites {
  bool success;
  String message;


  Favorites({
    required this.success,
    required this.message,
  });

  factory Favorites.fromJson(Map<String, dynamic> json) => Favorites(
    success: json["success"],
    message: json["message"],

  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
