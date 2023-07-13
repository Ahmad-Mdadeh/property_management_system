import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/base/base_screen.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/auth_widget/auth_elevated_button.dart';
import 'package:property_management_system/widget/auth_widget/auth_otp_field.dart';
import 'otp_controller.dart';

class OtpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _otpController = Get.put(OtpController());

  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.p56,
                  left: AppPadding.p32,
                ),
                child: SvgPicture.asset(
                  'assets/images/otp.svg',
                ),
              ),
              const SizedBox(
                height: AppSize.s50,
              ),
              const TextUtils(
                text: "OTP Verification",
                fontWeight: FontWeightManager.bold,
                fontSize: FontSize.s22,
              ),
              const SizedBox(
                height: AppSize.s12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p28,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const TextUtils(
                      textAlign: TextAlign.center,
                      text: "Please enter sent OTP to",
                      fontWeight: FontWeightManager.regular,
                      fontSize: FontSize.s14,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextUtils(
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      text: _otpController.phoneNumber,
                      fontWeight: FontWeightManager.bold,
                      fontSize: FontSize.s14,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.p37,
                ),
                child: Form(
                  key: _formKey,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppPadding.p8,
                      horizontal: AppPadding.p28,
                    ),
                    child: AuthOTPField(),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive the code?",
                    style: TextStyle(
                      fontSize: FontSize.s14,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.snackbar(
                      "Successfully",
                      "OTP resend!!",
                    ),
                    child: Text(
                      "RESEND",
                      style: TextStyle(
                        color: ColorManager.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.s15,
                      ),
                    ),
                  )
                ],
              ),
              AuthButton(
                borderRadius: AppSize.s60,
                text: "Submit",
                width: MediaQuery.of(context).size.width * 0.83,
                height: MediaQuery.of(context).size.height * 0.071,
                function: () => Get.off(
                  () => BaseScreen(),
                  transition: Transition.fade,
                  duration: const Duration(
                    milliseconds: 700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
