import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:property_management_system/modules/base/base_screen.dart';
import 'package:property_management_system/modules/login/login_service.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

class LoginController extends GetxController {
  final LoginService _loginService = LoginService();
  String phoneNumber = '';
  String numericPhoneNumber = '';
  String password = '';
  RxBool isObscured = true.obs;
  bool isLogin = false;

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

  Future checkSubmitLogin() async {
    isLogin = await _loginService.loginWithPhoneNumber(
      numericPhoneNumber,
      password,
    );
  }

  void checkIsLogin() async {
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
    await checkSubmitLogin();
    if (isLogin) {
      Get.back(closeOverlays: true);
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
        barrierDismissible: false,
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
              TextUtils(
                color: ColorManager.error,
                text: _loginService.message,
                fontWeight: FontWeightManager.regular,
                fontSize: FontSize.s13,
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
