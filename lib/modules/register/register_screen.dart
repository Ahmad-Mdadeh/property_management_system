import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/login/login_screen.dart';
import 'package:property_management_system/modules/register/register_controller.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/strings_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/auth_widget/auth_elevated_button.dart';
import 'package:property_management_system/widget/auth_widget/auth_intl_phone_filed.dart';
import 'package:property_management_system/widget/auth_widget/auth_text_from_filed.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final _registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 15,
                    left: MediaQuery.of(context).size.width / 20,
                  ),
                  child: Image.asset(
                    ImagesAssets.registerPic,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 80,
                ),
                const TextUtils(
                  text: "Register now to use PropertUnity",
                  fontWeight: FontWeightManager.bold,
                  fontSize: FontSize.s22,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 80,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height / 80,
                  ),
                  child: const TextUtils(
                    textAlign: TextAlign.center,
                    text:
                        "Please enter your username & phone number, We will send you the OTP for verification.",
                    fontWeight: FontWeightManager.regular,
                    fontSize: FontSize.s14,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 55,
                    left: MediaQuery.of(context).size.width / 12,
                    right: MediaQuery.of(context).size.width / 12,
                  ),
                  child: AuthTextFromField(
                    function: (value) {
                      _registerController.userName = value;
                    },
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
                SizedBox(
                  height: MediaQuery.of(context).size.height / 80,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 12,
                    right: MediaQuery.of(context).size.width / 12,
                  ),
                  child: Obx(
                    () => AuthTextFromField(
                      labelFontWeight: FontWeightManager.medium,
                      labelFontSize: FontSize.s14,
                      filled: true,
                      labelText: "Enter your password",
                      obscureText: _registerController.isObscured.value,
                      prefixIcon: const Icon(
                        Icons.key,
                      ),
                      textInputType: TextInputType.visiblePassword,
                      function: (value) {
                        _registerController.password = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 8 characters long';
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        color: ColorManager.lightPrimary,
                        icon: Icon(
                          _registerController.isObscured.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          _registerController.isObscured(
                              !(_registerController.isObscured.value));
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 80,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 12,
                    right: MediaQuery.of(context).size.width / 12,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: AuthIntlPhoneField(
                      function: (value) {
                        _registerController.phoneNumber = value.toString();
                        _registerController.initializeNumericPhoneNumber();
                      },
                      validator: (value) {
                        if (!RegExp(validationPhone)
                            .hasMatch(_registerController.numericPhoneNumber)) {
                          return "invalid phone number";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextUtils(
                      text: 'Already have account?',
                      fontWeight: FontWeight.normal,
                      fontSize: AppSize.s14,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.off(
                          LoginScreen(),
                          transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 700),
                        );
                      },
                      child: TextUtils(
                        text: 'Log In',
                        color: ColorManager.primary,
                        fontWeight: FontWeightManager.semiBold,
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.011,
                ),
                AuthButton(
                  borderRadius: AppSize.s60,
                  text: "Continue",
                  width: MediaQuery.of(context).size.width * 0.83,
                  height: MediaQuery.of(context).size.height * 0.065,
                  function: () async {
                    if (formKey.currentState!.validate() &&
                        _registerController.numericPhoneNumber.isNotEmpty) {
                      _registerController.isContinueToOtp();
                    } else if (_registerController.password.isEmpty) {
                      Get.snackbar(
                        "Error",
                        "Please Enter Password",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else if (_registerController.phoneNumber.isEmpty) {
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
