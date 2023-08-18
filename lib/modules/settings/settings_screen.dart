import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/profile/profile_controller.dart';
import 'package:property_management_system/modules/profile/profile_screen.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/utils/theme.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:property_management_system/utils/theme_service.dart';
import 'package:property_management_system/widget/settings/setting_list.dart';
import 'package:property_management_system/widget/settings/setting_shimmer.dart';
import 'package:property_management_system/widget/settings/settings_elevated_button.dart';
import 'package:rive/rive.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  final RxBool x = true.obs;
  final _settingController = Get.put(SettingController());
  final _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return Scaffold(
      appBar: AppBar(
        actions: [
          ThemeSwitcher(
            clipper: const ThemeSwitcherCircleClipper(),
            builder: (context) => InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                _settingController.remove();
                _settingController.riveArtBoard?.addController(
                  _settingController.isLightMode.value
                      ? _settingController.controllerToLight
                      : _settingController.controllerToDark,
                );
                ThemeSwitcher.of(context).changeTheme(
                  theme: _settingController.isLightMode.value
                      ? getThemeDataDarkMode()
                      : getThemeDataLightMode(),
                  // isReversed: settingController.isLightMode.value ,
                );

                _settingController
                    .isLightMode(!(_settingController.isLightMode.value));
                final themeService = await ThemeService.instance;

                final themeName =
                    _settingController.isLightMode.value ? 'light' : 'dark';
                themeService.save(themeName);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.width / 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.darkPrimary,
                  ),
                  child: Obx(
                    () => _settingController.timer.value
                        ? Rive(
                            artboard: _settingController.riveArtBoard!,
                          )
                        : const SizedBox(),
                  ),
                ),
              ),
            ),
          ),
        ],
        title: TextUtils(
          text: 'my_profile'.tr,
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
        child: Obx(
          () {
            if (_profileController.isLoading.value) {
              return Column(
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
                            child: _settingController.getImage(context),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextUtils(
                                text:
                                    _profileController.infoProfile.user!.name!,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                                fontWeight: FontWeightManager.bold,
                                fontSize: FontSize.s18,
                              ),
                              const SizedBox(
                                height: AppSize.s8,
                              ),
                              TextUtils(
                                text: "ahmad@gmail.com",
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                fontWeight: FontWeightManager.semiBold,
                                fontSize: FontSize.s12,
                              ),
                              const SizedBox(
                                height: AppSize.s8,
                              ),
                              SettingsButton(
                                borderRadius: 6,
                                color: Theme.of(context).iconTheme.color,
                                text: 'edit_profile'.tr,
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.width * 0.074,
                                function: () {
                                  Get.to(
                                    () => ProfileScreen(),
                                  );
                                },
                              ),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            enableFeedback: false,
                            onTap: () {
                              Get.to(
                                () => ProfileScreen(),
                              );
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
                        bottom: AppPadding.p20,
                      ),
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
                      child: SettingList(),
                    ),
                  ),
                ],
              );
            } else {
              return ShimmerSetting();
            }
          },
        ),
      ),
    );
  }

}
