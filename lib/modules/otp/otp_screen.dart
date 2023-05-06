<<<<<<< Updated upstream
=======
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/base/base_screen.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/text_manager.dart';
import '../../resources/values_manager.dart';
import '../../widget/auth_widget/auth_elevated_button.dart';
import '../../widget/auth_widget/auth_otp_field.dart';

import 'otp_controller.dart';

class OTPScreen extends GetView<OTPController> {
  final _formKey = GlobalKey<FormState>();
  OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(
          top: AppPadding.p56,
          left: AppPadding.p32,
        ),
        child: Image.asset(
          ImagesAssets.logInPic,
        ),
      ),
      const SizedBox(
        height: AppSize.s32,
      ),
      TextUtils(
        text: "OTP Verification",
        color: ColorManager.black,
        fontWeight: FontWeightManager.bold,
        fontSize: FontSize.s22,
      ),
      const SizedBox(
        height: AppSize.s16,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p28,
        ),
        child: TextUtils(
          textAlign: TextAlign.center,
          text: "Please enter sent OTP to ",
          color: ColorManager.grey2,
          fontWeight: FontWeightManager.regular,
          fontSize: FontSize.s14,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: const Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppPadding.p8, horizontal: AppPadding.p28),
              child: AuthOTPField()),
        ),
      ),
      SlideCountdownClock(
        duration: const Duration(minutes: 1),
      ),
      const SizedBox(
        height: AppSize.s32,
      ),
      AuthButton(
        color: ColorManager.primary,
        borderRadius: AppSize.s60,
        text: "Submit",
        width: 300,
        height: 55,
        function: () => Get.to(
          () => BaseScreen(),
          transition: Transition.fade,
          duration: const Duration(
            milliseconds: 700,
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Didn't receive the code? ",
            style: TextStyle(color: Colors.black54, fontSize: 15),
          ),
          TextButton(
            onPressed: () => const SnackBar(content: Text("OTP resend!!")),
            child: const Text(
              "RESEND",
              style: TextStyle(
                  color: Color(0xFF91D3B3),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          )
        ],
      ),
    ])));
  }
}
>>>>>>> Stashed changes
