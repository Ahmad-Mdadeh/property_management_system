import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/base/base_screen.dart';
import 'package:property_management_system/modules/login/login_controller.dart';
import 'package:property_management_system/modules/otp/otp_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return Form(
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
              TextUtils(
                text: "Sign in to use our app",
                color: ColorManager.black,
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
                child: TextUtils(
                  textAlign: TextAlign.center,
                  text:
                      "Please enter your full name & phone number, We will send you the OTP for verification.",
                  color: ColorManager.grey2,
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
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 12,
                  right: MediaQuery.of(context).size.width / 12,
                ),
                child: AuthTextFromField(
                  labelFontWeight: FontWeightManager.medium,
                  color: ColorManager.black,
                  labelFontSize: FontSize.s14,
                  filled: true,
                  labelText: "Enter your password",
                  obscureText: loginController.isObsecured.value,
                  prefixIcon: const Icon(
                    Icons.key,
                  ),
                  textInputType: TextInputType.visiblePassword,
                  function: (value) {
                    loginController.password.value = value;
                  },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Password is required';
                    }

                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }

                    if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}|:;<>,.?/~]).{8,}$')
                        .hasMatch(value)) {
                      return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
                    }

                    return null;
                  },
                  suffixIcon: Obx(
                    () => IconButton(
                      icon: Icon(
                        loginController.isObsecured.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        loginController.isObsecured.value =
                            !loginController.isObsecured.value;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const TextUtils(
                      text: 'Don\'t have an account ?',
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                  GestureDetector(
                    onTap: () {
                      Get.off(RegisterScreen());
                    },
                    child: TextUtils(
                      text: 'Register',
                      color: ColorManager.primary,
                      fontWeight: FontWeightManager.semiBold,
                      fontSize: FontSize.s16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              AuthButton(
                color: ColorManager.primary,
                borderRadius: AppSize.s60,
                text: "Log In",
                width: MediaQuery.of(context).size.width * 0.83,
                height: MediaQuery.of(context).size.height * 0.071,
                function: () {
                  if (formKey.currentState!.validate() &&
                      loginController.numericPhoneNumber.isNotEmpty) {
                    Get.off(
                      () => BaseScreen(),
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
    );
  }
}
