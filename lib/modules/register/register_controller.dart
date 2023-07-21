import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/otp/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:property_management_system/resources/server_manager.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  String phoneNumber = '';

  String numericPhoneNumber = '';

  RxString userName = ''.obs;

  Rx password = ''.obs;

  RxBool isObscured = true.obs;

  void initializeNumericPhoneNumber() {
    phoneNumber = phoneNumber.replaceAll(
      'PhoneNumber(countryISOCode: SY, countryCode: +963, number: ',
      '',
    );
    numericPhoneNumber = phoneNumber.replaceAll(
      ')',
      '',
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithPhoneNumber() async {
    try {
      var headers = {'Accept': 'application/json'};
      var url = Uri.parse(ServerSet.domainNameServer +
          ServerSet.authEndPoints.registerPhoneNumber);
      print(url);
      Map body = {
        "phone": phoneNumberController.text,
        "name": nameController.text,
        "password": passwordController.text
      };

      http.Response response =
          await http.post(url, body: body, headers: headers);

      print(response.statusCode);

      if (response.statusCode == 200) {
        Get.off(
          () => OtpScreen(),
          arguments: phoneNumberController.value,
          transition: Transition.fade,
          duration: const Duration(
            milliseconds: 1000,
          ),
        );
        nameController.clear();
        phoneNumberController.clear();
        passwordController.clear();
      } else {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return const SimpleDialog(
              title: Text('Error occured'),
              contentPadding: EdgeInsets.all(20),
              children: [
                Text('Try change the name'),
              ],
            );
          },
        );
      }
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
 // Future<void> registerWithPhoneNumber() async {
  //   var headers = {'Content-Type': 'application/json'};
  //   var request = http.Request(
  //       'POST',
  //       Uri.parse(ServerSet.domainNameServer +
  //           ServerSet.authEndPoints.loginPhoneNumber));
  //   request.body = json.encode(
  //     {
  //       "phone": phoneNumberController,
  //       "name": nameController,
  //       "password": passwordController
  //     }.toString(),
  //   );
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //     Get.off(
  //       BaseScreen(),
  //     );
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }