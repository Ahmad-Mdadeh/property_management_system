import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/create_post/create_post_screen.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/settings/language_list.dart';

class SettingList extends StatelessWidget {
  SettingList({Key? key}) : super(key: key);
  final _settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LanguageList(),
        Divider(
          color: ColorManager.grey1,
          thickness: 0.5,
        ),
        InkWell(
          onTap: () => Get.defaultDialog(
            barrierDismissible: false,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: 'Log Out From App',
            titleStyle: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium!.color!,
              fontSize: FontSize.s18,
              fontWeight: FontWeightManager.bold,
            ),
            radius: 10.0,
            middleText: 'Are you sure you want to log out ?',
            middleTextStyle: TextStyle(
              color: ColorManager.white,
              fontSize: 15.0,
            ),
            textCancel: 'No',
            cancelTextColor: Colors.white,
            onCancel: () {
              Get.back();
            },
            buttonColor: Theme.of(context).iconTheme.color,
            textConfirm: 'Yes',
            confirmTextColor: Colors.white,
            onConfirm: () {
              _settingController.signOutFromApp();
            },
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 25,
                  right: MediaQuery.of(context).size.width / 25,
                ),
                child: Container(
                  width: 40,
                  height: 43,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    borderRadius: BorderRadius.circular(
                      AppSize.s8,
                    ),
                  ),
                  child: const Icon(
                    Icons.logout,
                  ),
                ),
              ),
              TextUtils(
                text: 'Sign Out'.tr,
                color: Theme.of(context).textTheme.bodyMedium!.color,
                fontWeight: FontWeightManager.medium,
                fontSize: FontSize.s14,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
              ),
            ],
          ),
        ),
        Divider(
          color: ColorManager.grey1,
          thickness: 0.5,
        ),
        InkWell(
          onTap: () {
            Get.to(
              () => CreatePostScreen(buildContext: context),
            );
          },
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 25,
                  right: MediaQuery.of(context).size.width / 25,
                ),
                child: Container(
                  width: 40,
                  height: 43,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    borderRadius: BorderRadius.circular(
                      AppSize.s8,
                    ),
                  ),
                  child: const Icon(
                    Icons.create_outlined,
                  ),
                ),
              ),
              TextUtils(
                text: 'Create Post'.tr,
                color: Theme.of(context).textTheme.bodyMedium!.color,
                fontWeight: FontWeightManager.medium,
                fontSize: FontSize.s14,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
