// To parse this JSON data, do
//
//     final test = testFromJson(jsonString);

import 'dart:convert';

Test testFromJson(String str) => Test.fromJson(json.decode(str));

String testToJson(Test data) => json.encode(data.toJson());

class Test {
  dynamic status;
  String ?accessToken;

  Test({
    required this.status,
    required this.accessToken,
  });

  factory Test.fromJson(Map<String, dynamic> json) => Test(
    status: json["status"],
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "access_token": accessToken,
  };
}
