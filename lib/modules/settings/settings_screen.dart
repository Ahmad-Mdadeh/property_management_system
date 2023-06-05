import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/profile/profile_screen.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/utils/theme.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:property_management_system/widget/settings/settings_elevated_button.dart';
import 'package:property_management_system/widget/settings/settings_list.dart';
import 'package:rive/rive.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  final RxBool x = true.obs;

  final settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.5;
    return Scaffold(
      appBar: AppBar(
        actions: [
          ThemeSwitcher(
            clipper: const ThemeSwitcherCircleClipper(),
            builder: (context) => InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                settingController.remove();
                settingController.riveArtBoard?.addController(
                  settingController.isLightMode.value
                      ? settingController.controllerToLight
                      : settingController.controllerToDark,
                );
                ThemeSwitcher.of(context).changeTheme(
                  theme: settingController.isLightMode.value
                      ? getThemeDataDarkMode()
                      : getThemeDataLightMode(),

                );

                settingController
                    .isLightMode(!(settingController.isLightMode.value));
              },
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width / 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.darkPrimary,
                    ),
                    child: settingController.timer.value
                        ? Rive(
                            artboard: settingController.riveArtBoard!,
                          )
                        : const SizedBox(),
                  ),
                ),
              ),
            ),
          ),
        ],
        title: const TextUtils(
          text: "My Profile",
          fontWeight: FontWeightManager.regular,
          fontSize: FontSize.s20,
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
                    color: Theme.of(context).colorScheme.primaryContainer,
                    width: 2,
                  ),
                    color: Theme.of(context).appBarTheme.backgroundColor,
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
                        width: MediaQuery.of(context).size.width / 6.4,
                        height: MediaQuery.of(context).size.width / 6.4,
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
                              color: Theme.of(context).textTheme.bodyMedium!.color,
                          fontWeight: FontWeightManager.bold,
                          fontSize: FontSize.s18,
                        ),
                        const SizedBox(
                          height: AppSize.s8,
                        ),
                        TextUtils(
                          text: "ahmad@gmail.com",
                          color: Theme.of(context).textTheme.bodySmall!.color,
                          fontWeight: FontWeightManager.semiBold,
                          fontSize: FontSize.s12,
                        ),
                        const SizedBox(
                          height: AppSize.s8,
                        ),
                        SettingsButton(
                          borderRadius: 6,
                          color: Theme.of(context).iconTheme.color,
                          text: "Edit Profile",
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.074,
                          function: () {
                            Get.to(() => const ProfileScreen());
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      enableFeedback: false,
                      onTap: () {
                        Get.to(() => const ProfileScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: AppPadding.p10,
                          bottom: AppPadding.p24,
                        ),
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(
                              7.0,
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
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
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(
                    AppSize.s18,
                  ),
                ),
                child: Column(
                  children: [
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
                    Divider(
                      color: ColorManager.grey1,
                      thickness: 0.5,
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
