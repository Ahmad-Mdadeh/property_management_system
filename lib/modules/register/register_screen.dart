import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/login/login_screen.dart';
import 'package:property_management_system/modules/register/register_controller.dart';
import 'package:property_management_system/modules/otp/otp_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterController());
    return ThemeSwitchingArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 20,
                    left: MediaQuery.of(context).size.width / 20,
                  ),
                  child: Image.asset(
                    ImagesAssets.logInPic,
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
                      registerController.userName.value = value;
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
                      obscureText: registerController.isObscured.value,
                      prefixIcon: const Icon(
                        Icons.key,
                      ),
                      textInputType: TextInputType.visiblePassword,
                      function: (value) {
                        registerController.password.value = value;
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Password is required';
                        }

                        // if (value.length < 8) {
                        //   return 'Password must be at least 8 characters long';
                        // }

                        // if (!RegExp(validationPassword).hasMatch(value)) {
                        //   return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
                        // }

                        return null;
                      },
                      suffixIcon: IconButton(
                        color: ColorManager.lightPrimary,
                        icon: Icon(
                          registerController.isObscured.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          registerController.isObscured(
                              !(registerController.isObscured.value));
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
                        registerController.phoneNumber = value.toString();
                        registerController.initializeNumericPhoneNumber();
                      },
                      validator: (value) {
                        if (!RegExp(validationPhone)
                            .hasMatch(registerController.numericPhoneNumber)) {
                          return "invalid phone number";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextUtils(
                        text: 'Already have account?',
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                    SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.off(LoginScreen());
                      },
                      child: TextUtils(
                        text: 'Log In',
                        color: ColorManager.primary,
                        fontWeight: FontWeightManager.semiBold,
                        fontSize: FontSize.s16,
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
                  height: MediaQuery.of(context).size.height * 0.071,
                  function: () {
                    if (formKey.currentState!.validate() &&
                        registerController.numericPhoneNumber.isNotEmpty) {
                      registerController.registerWithPhoneNumber(); //
                      // Get.off(
                      //   () => OtpScreen(),
                      //   arguments: registerController.numericPhoneNumber,
                      //   transition: Transition.fade,
                      //   duration: const Duration(
                      //     milliseconds: 1000,
                      //   ),
                      // );
                    } else if (registerController.password.value.isEmpty) {
                      Get.snackbar(
                        "Error",
                        "Please Enter Password",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else if (registerController.phoneNumber.isEmpty) {
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
