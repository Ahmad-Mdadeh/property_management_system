import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/profile/profile_elevated_button.dart';
import 'package:property_management_system/widget/profile/profile_image_picker.dart';
import 'package:property_management_system/widget/profile/profile_text_from_filed.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorManager.primary,
            ),
          ),
          title: const TextUtils(
            text: "Edite My Profile",
            fontWeight: FontWeightManager.semiBold,
            fontSize: FontSize.s18,
            // color: Theme.of(context).appBarTheme.titleTextStyle!.color,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(
                AppSize.s24,
              ),
              bottomLeft: Radius.circular(
                AppSize.s24,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileImagePicker(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextUtils(
                      text: "Full Name",
                      fontWeight: FontWeightManager.light,
                      fontSize: FontSize.s16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: ProfileTextFromFiled(
                        textInputType: TextInputType.name,
                        function: () {},
                        validator: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const TextUtils(
                      text: "Email",
                      fontWeight: FontWeightManager.light,
                      fontSize: FontSize.s16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: ProfileTextFromFiled(
                        textInputType: TextInputType.emailAddress,
                        function: () {},
                        validator: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const TextUtils(
                      text: "Phone Number",
                      fontWeight: FontWeightManager.light,
                      fontSize: FontSize.s16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: ProfileTextFromFiled(
                        textInputType: TextInputType.phone,
                        function: () {},
                        validator: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const TextUtils(
                      text: "Address",
                      fontWeight: FontWeightManager.light,
                      fontSize: FontSize.s16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: ProfileTextFromFiled(
                        textInputType: TextInputType.streetAddress,
                        function: () {},
                        validator: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ProfileButton(
                      borderRadius: 16,
                      text: "Update Profile",
                      height: MediaQuery.of(context).size.height / 17,
                      function: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
