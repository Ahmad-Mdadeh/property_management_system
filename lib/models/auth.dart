// To parse this JSON data, do
//
//     final auth = authFromJson(jsonString);

import 'dart:convert';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
  bool success;
  String message;
  String? accessToken;

  Auth({
    required this.success,
    required this.message,
     this.accessToken,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
    success: json["success"],
    message: json["message"],
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "access_token": accessToken,
  };
}
