import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/home_widgets/property_type_button.dart';

class PropertyTypesScreen extends StatelessWidget {
  PropertyTypesScreen({super.key});

  final settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        backgroundColor: ColorManager.dark,
        appBar: AppBar(
          elevation: 0,
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
            color: ColorManager.white,
            fontSize: 20,
            fontWeight: FontWeight.normal,
            text: 'Property Categories',
          ),
          backgroundColor: ColorManager.darkPrimary,
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
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: MediaQuery.of(context).size.width / 50,
              mainAxisSpacing: MediaQuery.of(context).size.height / 80,
              mainAxisExtent: MediaQuery.of(context).size.height / 8,
              childAspectRatio: 80,
            ),
            children: [
              TabBarPropertyButton(
                text: 'Villa',
                icon: Icons.villa_rounded,
                color: ColorManager.primary,
                colorIcon: Theme.of(context).iconTheme.color!,
                colorText: Theme.of(context).textTheme.bodyMedium!.color!,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}