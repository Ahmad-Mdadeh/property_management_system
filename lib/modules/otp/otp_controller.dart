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
  late RxBool isVerification;

  String otp = "";

  var argument = Get.arguments;
  late String phoneNumber;

  @override
  void onInit() {
    phoneNumber = "argument";
    super.onInit();
  }

  Future checkVerification() async {
    isVerification =
        await _otpService.userVerification(otp, "Ahmad", "12345678");
  }

  void checkSubmit() async {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSize.s14,
          ),
        ),
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
    if (isVerification.value) {
      Get.back(closeOverlays: true);
      Get.dialog(
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.s14,
            ),
          ),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.s14,
            ),
          ),
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(
                    7.0,
                  ),
                ),
                child: Center(
                  child: TextUtils(
                    color: ColorManager.error,
                    text: _otpService.message,
                    fontWeight: FontWeightManager.medium,
                    fontSize: FontSize.s20,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
