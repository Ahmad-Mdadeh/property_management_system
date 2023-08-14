import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/login/login_controller.dart';
import 'package:property_management_system/modules/register/register_screen.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/color_manager.dart';
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
  final _loginController = Get.put(LoginController());

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
                    top: MediaQuery.of(context).size.height / 20,
                    left: MediaQuery.of(context).size.width / 20,
                  ),
                  child: SvgPicture.asset(
                    ImagesAssets.logInWelcome,
                    height: MediaQuery.of(context).size.height * 0.46,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 80,
                ),
                const TextUtils(
                  text: "Sign in to use our app",
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
                        "Please enter your full name & phone number, We will send you the OTP for verification.",
                    fontWeight: FontWeightManager.regular,
                    fontSize: FontSize.s14,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 40,
                    left: MediaQuery.of(context).size.width / 12,
                    right: MediaQuery.of(context).size.width / 12,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: AuthIntlPhoneField(
                      function: (value) {
                        _loginController.phoneNumber = value.toString();
                        _loginController.initializeNumericPhoneNumber();
                      },
                      validator: (value) {
                        if (!RegExp(validationPhone)
                            .hasMatch(_loginController.numericPhoneNumber)) {
                          return "invalid phone number";
                        } else {
                          return null;
                        }
                      },
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
                  child: Obx(
                    () => AuthTextFromField(
                      labelFontWeight: FontWeightManager.medium,
                      labelFontSize: FontSize.s14,
                      filled: true,
                      labelText: "Enter your password",
                      obscureText: _loginController.isObscured.value,
                      prefixIcon: const Icon(
                        Icons.key,
                      ),
                      textInputType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 8 characters long';
                        }

                        return null;
                      },
                      function: (value) {
                        _loginController.password = value;
                      },
                      suffixIcon: IconButton(
                        color: ColorManager.lightPrimary,
                        icon: Icon(
                          _loginController.isObscured.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          _loginController
                              .isObscured(!(_loginController.isObscured.value));
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextUtils(
                      text: 'Don\'t have an account ?',
                      fontWeight: FontWeight.normal,
                      fontSize: AppSize.s14,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.off(
                          RegisterScreen(),
                          transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 700),
                        );
                      },
                      child: TextUtils(
                        text: 'Register',
                        color: ColorManager.primary,
                        fontWeight: FontWeightManager.semiBold,
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                AuthButton(
                  borderRadius: AppSize.s60,
                  text: "LogIn",
                  width: MediaQuery.of(context).size.width * 0.83,
                  height: MediaQuery.of(context).size.height * 0.065,
                  function: () {
                    if (formKey.currentState!.validate()) {
                      _loginController.checkIsLogin();
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
