import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/auth_widget/auth_elevated_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.p100,
                left: AppPadding.p32,
              ),
              child: Image.asset(ImagesAssets.phoneNumber),
            ),
            const SizedBox(
              height: AppSize.s73,
            ),
            TextUtils(
              text: "Enter your phone number",
              color: ColorManager.black,
              fontWeight: FontWeightManager.bold,
              fontSize: FontSize.s22,
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
              child: TextUtils(
                textAlign: TextAlign.center,
                text:
                    "Please enter the phone number we will send the OTP in this phone number.",
                color: ColorManager.grey2,
                fontWeight: FontWeightManager.regular,
                fontSize: FontSize.s14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.p28,
                left: AppPadding.p32,
                right: AppPadding.p32,
              ),
              child: IntlPhoneField(
                initialCountryCode: 'SY',
              ),
            ),
            const SizedBox(height: AppSize.s32,),
            AuthButton(
              borderRadius: AppSize.s12,
              color: ColorManager.primary,
              text: "Continue",
              width: 353,
              height: 55,
              function: (){},
            ),
          ],
        ),
      ),
    );
  }
}
