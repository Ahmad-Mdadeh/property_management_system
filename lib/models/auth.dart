// To parse this JSON data, do
//
//     final auth = authFromJson(jsonString);

import 'dart:convert';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
  bool status;
  String message;
  String? accessToken;

  Auth({
    required this.status,
    required this.message,
     this.accessToken,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
    status: json["status"],
    message: json["message"],
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "access_token": accessToken,
  };
}
