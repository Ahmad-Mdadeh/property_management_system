import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/home/home_controller.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({Key? key}) : super(key: key);
  final _settingController = Get.put(SettingController());
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15.0,
          ),
          border: _settingController.isLightMode.value
              ? Border.all(
                  color: ColorManager.black.withOpacity(0.05),
                )
              : null,
          color: Theme.of(context).appBarTheme.backgroundColor,
        ),
        child: TextField(
          controller: _homeController.searchController,
          onChanged: (value) {
            _homeController.inputSearch.value = value;
            _homeController.getResultsPropertiesSearch();
          },
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium!.color,
            fontFamily: 'Outfit',
          ),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Theme.of(context).textTheme.bodySmall!.color,
              fontFamily: 'Outfit',
              fontSize: FontSize.s14,
            ),
            hintText: "Search you're looking for".tr,
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).iconTheme.color,
            ),
            suffixIcon: _homeController.inputSearch.isNotEmpty
                ? IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      _homeController.clearSearch();
                    },
                    icon: const Icon(Icons.close),
                    color: Theme.of(context).iconTheme.color,
                  )
                : null,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
          ),
          cursorColor: ColorManager.primary,
        ),
      ),
    );
  }
}
