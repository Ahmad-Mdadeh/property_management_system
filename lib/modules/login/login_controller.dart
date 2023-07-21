import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:property_management_system/modules/base/base_screen.dart';
import 'package:property_management_system/resources/server_manager.dart';

class LoginController extends GetxController {
  String phoneNumber = '';

  // String numericPhoneNumber = '';

  RxString password = ''.obs;

  RxString userName = ''.obs;
  RxBool isObscured = true.obs;

  void initializeNumericPhoneNumber() {
    phoneNumber = phoneNumber.replaceAll(
      'PhoneNumber(countryISOCode: SY, countryCode: +963, number: ',
      '',
    );
    phoneNumber = phoneNumber.replaceAll(
      ')',
      '',
    );
  }

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future<void> logInWithPhoneNumber() async {
    try {
      var headers = {'Accept': 'application/json'};
      var url = Uri.parse(ServerSet.domainNameServer +
          ServerSet.authEndPoints.loginPhoneNumber);

      Map body = {
        'phone': phoneNumberController.text.trim(),
        'password': passwordController.text
      };

      http.Response response =
          await http.post(url, body: body, headers: headers);

      if (response.statusCode == 200) {
        print('Log in succefully');
        Get.off(
          () => BaseScreen(),
          arguments: phoneNumber,
          transition: Transition.fade,
          duration: const Duration(
            milliseconds: 1000,
          ),
        );
        phoneNumberController.clear();
        passwordController.clear();
      } else {
        // throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
        showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text('${jsonDecode(response.body)["Message"]}')],
            );
          },
        );
      }

      print(response.body);
    } catch (e) {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text('Error'),
            contentPadding: EdgeInsets.all(20),
            children: [Text(e.toString())],
          );
        },
      );
    }
  }
}
