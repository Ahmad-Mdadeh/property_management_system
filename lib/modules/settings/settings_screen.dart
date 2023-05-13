import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/profile/profile_screen.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/settings/settings_elevated_button.dart';
import 'package:property_management_system/widget/settings/settings_list.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  final RxBool x = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextUtils(
          text: "My Profile",
          color: ColorManager.white,
          fontWeight: FontWeightManager.semiBold,
          fontSize: FontSize.s18,
        ),
        backgroundColor: ColorManager.lightPrimary,
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
      backgroundColor: ColorManager.dark,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.p24,
                bottom: AppPadding.p24,
                left: AppPadding.p20,
                right: AppPadding.p20,
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  top: AppPadding.p20,
                  left: AppPadding.p20,
                  right: AppPadding.p12,
                ),
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.16,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0Xff43464d),
                    width: 2,
                  ),
                  color: ColorManager.lightPrimary,
                  borderRadius: BorderRadius.circular(
                    AppSize.s18,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppPadding.p20,
                        right: AppPadding.p12,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width /6.4,
                        height: MediaQuery.of(context).size.width /6.4,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(
                              ImagesAssets.photo,
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppSize.s20,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextUtils(
                          text: "Ahmad Mdadeh",
                          color: ColorManager.white,
                          fontWeight: FontWeightManager.bold,
                          fontSize: FontSize.s18,
                        ),
                        const SizedBox(
                          height: AppSize.s8,
                        ),
                        TextUtils(
                          text: "ahmad@gmail.com",
                          color: ColorManager.white,
                          fontWeight: FontWeightManager.semiBold,
                          fontSize: FontSize.s12,
                        ),
                        const SizedBox(
                          height: AppSize.s8,
                        ),
                        SettingsButton(
                          borderRadius: 6,
                          color: ColorManager.lightTeal,
                          text: "Edit Profile",
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.074,
                          function: () {
                            Get.to(() => ProfileScreen());
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      enableFeedback: false,
                      onTap: () {
                        Get.to(() => ProfileScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppPadding.p24,
                        ),
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0Xff43464d),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(
                              7.0,
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: ColorManager.ofWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: AppPadding.p24,
                left: AppPadding.p20,
                right: AppPadding.p20,
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  top: AppPadding.p20,
                ),
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.width * 3,
                decoration: BoxDecoration(
                  color: ColorManager.lightPrimary,
                  borderRadius: BorderRadius.circular(
                    AppSize.s18,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: AppPadding.p20,
                            right: AppPadding.p20,
                          ),
                          child: Container(
                            width: 40,
                            height: 43,
                            decoration: BoxDecoration(
                              color: const Color(0xff293d44),
                              borderRadius: BorderRadius.circular(
                                AppSize.s8,
                              ),
                            ),
                            child: Icon(
                              Icons.dark_mode_outlined,
                              color: ColorManager.lightTeal,
                              size: 30,
                            ),
                          ),
                        ),
                        TextUtils(
                          text: "Dark Mode",
                          color: ColorManager.white,
                          fontWeight: FontWeightManager.medium,
                          fontSize: FontSize.s15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: AppPadding.p87,
                          ),
                          child: Obx(
                                () => Switch(
                              value: x.value,
                              onChanged: (value) => {x.value = value},
                              activeColor: ColorManager.lightTeal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Divider(
                          color: ColorManager.grey1,
                          thickness: 0.5,
                        ),
                      ),
                    ),

                    ListView.separated(
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Divider(
                            color: ColorManager.grey1,
                            thickness: 0.5,
                          ),
                        ),
                      ),
                      itemCount: 13,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => const SittingsList(),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
