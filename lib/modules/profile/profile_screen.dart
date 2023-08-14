import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/profile/profile_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/strings_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/profile/profile_elevated_button.dart';
import 'package:property_management_system/widget/profile/profile_image_picker.dart';
import 'package:property_management_system/widget/profile/profile_text_from_filed.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final _profileController = Get.put(ProfileController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Form(
        key: _formKey,
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
            title: TextUtils(
              text: "edit_profile".tr,
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
                ProfileImagePicker(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p18,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextUtils(
                        text: 'full_name'.tr,
                        fontWeight: FontWeightManager.light,
                        fontSize: FontSize.s16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: ProfileTextFromFiled(
                          hintText: _profileController.infoProfile.user!.name!,
                          textInputType: TextInputType.name,
                          function: (value) {
                            _profileController.name = value;
                          },
                          validator: (value) {
                            if (!RegExp(validationName).hasMatch(value)) {
                              return "invalid name";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      // TextUtils(
                      //   text: 'email'.tr,
                      //   fontWeight: FontWeightManager.light,
                      //   fontSize: FontSize.s16,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //     vertical: 8.0,
                      //   ),
                      //   child: ProfileTextFromFiled(
                      //     hintText: "ahmad@gmail.com",
                      //     textInputType: TextInputType.emailAddress,
                      //     function: () {},
                      //     validator: () {},
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 10.0,
                      // ),
                      // TextUtils(
                      //   text: 'phone_number'.tr,
                      //   fontWeight: FontWeightManager.light,
                      //   fontSize: FontSize.s16,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //     vertical: 8.0,
                      //   ),
                      //   child: ProfileTextFromFiled(
                      //     hintText: _profileController.infoProfile.user!.phone!,
                      //     textInputType: TextInputType.phone,
                      //     function: () {},
                      //     validator: () {},
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ProfileButton(
                        borderRadius: 16,
                        text: 'edit_profile'.tr,
                        height: MediaQuery.of(context).size.height / 17,
                        function: () async{
                          if (_formKey.currentState!.validate()) {
                            _profileController.checkUpdate();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
