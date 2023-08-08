import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:property_management_system/modules/otp/otp_screen.dart';
import 'package:property_management_system/modules/register/register_service.dart';
import 'package:property_management_system/resources/values_manager.dart';

class RegisterController extends GetxController {
  String phoneNumber = '';
  String password = '';
  String userName = '';
  RxBool isObscured = true.obs;
  String numericPhoneNumber = '';
  RxBool checkRegister = false.obs;
  final RegisterService _registerService = RegisterService();

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

  Future checkRegisterWithPhoneNumber() async {
    checkRegister.value = await _registerService.registerWithPhoneNumber(
      numericPhoneNumber,
      userName,
      password,
    );
  }
  void isContinueToOtp() async {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/json/loading.json",
              width: double.infinity,
              height: AppSize.s150,
            ),
          ],
        ),
      ),
    );
    await checkRegisterWithPhoneNumber();
    if (checkRegister.value) {
      Get.back(closeOverlays: true);
      Get.snackbar(
        "Success",
        "Please Waiting for OTP Verification",
        snackPosition: SnackPosition.TOP,
      );
      Get.off(
        () => OtpScreen(),
        arguments: [
          numericPhoneNumber,
          userName,
          password,
        ],
        transition: Transition.fade,
        duration: const Duration(
          milliseconds: 1000,
        ),
      );
    } else {
      Get.snackbar(
        "Error !",
        "A user with the entered phone number already exists",
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
