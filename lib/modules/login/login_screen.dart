import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                top: AppPadding.p56,
                left: AppPadding.p32,
              ),

              child: Image.asset(ImagesAssets.logInPic,),

            ),
            const SizedBox(
              height: AppSize.s73,
            ),
            TextUtils(
              text: "Sign in to use our app",
              color: ColorManager.black,
              fontWeight: FontWeightManager.bold,
              fontSize: FontSize.s22,
              fontFamily: 'Outfit',
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28,),
              child: TextUtils(
                textAlign: TextAlign.center,
                text:
                    "Please enter your full name & phone number, We will send you the OTP for verification.",
                color: ColorManager.grey2,
                fontWeight: FontWeightManager.regular,
                fontSize: FontSize.s14,
                fontFamily: 'Outfit',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.p28,
                left: AppPadding.p32,
                right: AppPadding.p32,
              ),
              child: IntlPhoneField(
                dropdownTextStyle: const TextStyle(fontWeight: FontWeightManager.medium,),
                initialCountryCode: 'SY',
                cursorColor: ColorManager.primary,
                style: TextStyle(color: ColorManager.primary,),
                cursorHeight: 20,
                disableLengthCheck: true,
                dropdownIcon:
                    Icon(Icons.arrow_drop_down, color: ColorManager.primary,),

                decoration: const InputDecoration(
                    label: Text('phone number',
                        style: TextStyle(
                            fontFamily: 'Outfit', color: Color(0xFF097C7D,),),),
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Color(0xFF097C7D),
                    focusColor: Color(0xFF097C7D),
                    hoverColor: Color(0xFF097C7D),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF097C7D,),),
                        borderRadius: BorderRadius.all(Radius.circular(10,),),),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF097C7D,),),
                        borderRadius: BorderRadius.all(Radius.circular(10,),),),),
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
              function: () {},

            ),
          ],
        ),
      ),
    );
  }
}
