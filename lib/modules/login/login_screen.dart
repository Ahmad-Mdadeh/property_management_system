import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/login/login_controller.dart';
import 'package:property_management_system/modules/otp/otp_screen.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/strings_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/auth_widget/auth_elevated_button.dart';
import 'package:property_management_system/widget/auth_widget/auth_intl_phone_filed.dart';
import 'package:property_management_system/widget/auth_widget/auth_text_from_filed.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Form(
      key: formKey,
      child: ThemeSwitchingArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
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
                 const TextUtils(
                  text: "Sign in to use our app",
                  fontWeight: FontWeightManager.bold,
                  fontSize: FontSize.s22,
                ),
                const SizedBox(
                  height: AppSize.s16,
                ),
                  const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p28,
                  ),
                  child: TextUtils(
                    textAlign: TextAlign.center,
                    text: "Please enter your full name & phone number, We will send you the OTP for verification.",
                    fontWeight: FontWeightManager.regular,
                    fontSize: FontSize.s14,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppPadding.p12,
                    left: AppPadding.p32,
                    right: AppPadding.p32,
                  ),
                  child: AuthTextFromField(
                    function: (value) {
                      loginController.userName.value = value;
                    },
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                    labelFontWeight: FontWeightManager.medium,
                    labelFontSize: FontSize.s14,
                    filled: true,
                    labelText: "Enter your name",
                    obscureText: false,
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                    validator: (value) {
                      if (!RegExp(validationName).hasMatch(value)) {
                        return "invalid name";
                      } else {
                        return null;
                      }
                    },
                    suffixIcon: null,
                    textInputType: TextInputType.name,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s14,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p32,
                    right: AppPadding.p32,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: AuthIntlPhoneField(
                      function: (value) {
                        loginController.phoneNumber = value.toString();
                        loginController.initializeNumericPhoneNumber();
                      },
                      validator: (value) {
                        if (!RegExp(validationPhone)
                            .hasMatch(loginController.numericPhoneNumber)) {
                          return "invalid phone number";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s32,
                ),
                AuthButton(
                  borderRadius: AppSize.s60,
                  text: "Continue",
                  width: MediaQuery.of(context).size.width * 0.83,
                  height: MediaQuery.of(context).size.height * 0.071,
                  function: () {
                    if (formKey.currentState!.validate() &&
                        loginController.numericPhoneNumber.isNotEmpty) {
                      Get.off(
                        () => OtpScreen(),
                        arguments: loginController.numericPhoneNumber,
                        transition: Transition.fade,
                        duration: const Duration(
                          milliseconds: 1000,
                        ),
                      );
                    } else if (loginController.userName.value.isNotEmpty) {
                      Get.snackbar(
                        "Error",
                        "Please Enter Your Phone Number",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
