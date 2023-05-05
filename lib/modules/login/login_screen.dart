import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/base/base_screen.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
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
    return Form(
      key: formKey,
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
              TextUtils(
                text: "Sign in to use our app",
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
                  text:
                      "Please enter your full name & phone number, We will send you the OTP for verification.",
                  color: ColorManager.grey2,
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
                  fontWeight: FontWeightManager.medium,
                  color: ColorManager.black,
                  fontSize: FontSize.s14,
                  filled: true,
                  labelText: "Enter your name",
                  obscureText: false,
                  prefixIcon: const Icon(
                    Icons.person,
                  ),
                  validator: () {},
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
                  child: const AuthIntlPhoneField(),
                ),
              ),
              const SizedBox(
                height: AppSize.s32,
              ),
              AuthButton(
                color: ColorManager.primary,
                borderRadius: AppSize.s60,
                text: "Continue",
                width: 300,
                height: 55,
                function: () => Get.to(
                  () =>  BaseScreen(),
                  transition: Transition.fadeIn,
                  duration: const Duration(
                    milliseconds: 1200,
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
