import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/models/auth.dart';
import 'package:property_management_system/resources/server_manager.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  String message = "";

  var url = Uri.parse(ServerSet.domainNameServer + ServerSet.registerEndPoints);

  Future registerWithPhoneNumber(
      String phone, String name, String password) async {
    try {
      var response = await http.post(
        url,
        body: {
          "phone": phone,
          "name": name,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        var status = authFromJson(response.body).status;
        return status;
      } else if (response.statusCode == 401) {
        message = authFromJson(response.body).message;

        var status = authFromJson(response.body).status;
        return status;
      }
    } catch (e) {
      Get.snackbar(
        "Error !",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        // backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
        colorText: Colors.white,
      );
    }
  }
}
