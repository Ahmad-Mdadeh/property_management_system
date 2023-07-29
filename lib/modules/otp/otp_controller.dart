import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:property_management_system/modules/base/base_screen.dart';
import 'package:property_management_system/modules/otp/otp_service.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

class OtpController extends GetxController {
  final OtpService _otpService = OtpService();
  late bool isVerification;

  String otp = "";

  var argument = Get.arguments;
  late String phoneNumber;
  late String userName;
  late String password;

  @override
  void onInit() {
    phoneNumber = argument[0];
    userName = argument[1];
    password = argument[2];
    super.onInit();
  }

  Future checkVerification() async {
    isVerification = await _otpService.userVerification(
      phoneNumber,
      userName,
      password,
      otp,
    );
  }

  void checkSubmitOtp() async {
    Get.dialog(
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
    await checkVerification();
    if (isVerification) {
      Get.back(closeOverlays: true);
      Get.dialog(
        Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/json/success.json",
                width: double.infinity,
                height: AppSize.s150,
              ),
            ],
          ),
        ),
      );
      Timer(
        const Duration(milliseconds: 950),
        () {
          Get.back(closeOverlays: true);
        },
      );
      Timer(
        const Duration(seconds: 1),
        () {
          Get.off(
            () => BaseScreen(),
            transition: Transition.fade,
            duration: const Duration(
              milliseconds: 700,
            ),
          );
        },
      );
    } else {
      Get.back(closeOverlays: true);
      Get.dialog(
        Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/json/error.json",
                width: double.infinity,
                height: AppSize.s150,
              ),
              Center(
                child: TextUtils(
                  color: ColorManager.error,
                  text: _otpService.message,
                  fontWeight: FontWeightManager.medium,
                  fontSize: FontSize.s20,
                ),
              ),
            ],
          ),
        ),
      );
      Timer(
        const Duration(seconds: 3),
            () {
          Get.back(closeOverlays: true);
        },
      );
    }
  }
}
