import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/filters/filters_screen.dart';
import 'package:property_management_system/modules/home/home_controller.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/home_widgets/elment_search.dart';
import 'package:property_management_system/widget/home_widgets/home_elment.dart';
import 'package:property_management_system/widget/home_widgets/search_text_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _homeController = Get.put(HomeController());
  final settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: TextUtils(
          text: 'home'.tr,
          fontWeight: FontWeightManager.regular,
          fontSize: FontSize.s20,
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Row(
                    children: [
                      SearchTextField(),
                      SizedBox(width: MediaQuery.of(context).size.width / 35),
                      Container(
                        decoration: BoxDecoration(
                          border: settingController.isLightMode.value
                              ? Border.all(
                                  color: ColorManager.black.withOpacity(0.05),
                                )
                              : null,
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ),
                          color: Theme.of(context).appBarTheme.backgroundColor,
                        ),
                        // margin: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.filter_list,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          onPressed: () {
                            Get.to(
                              FiltersScreen(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                if (_homeController.inputSearch.value.isEmpty) ...[
                  HomeElement()
                ] else ...[
                  _homeController.allProperties.isNotEmpty
                      ? ElementSearch()
                      : Center(
                          child: Image.asset(
                            "assets/images/search_empty_dark.png",
                          ),
                        ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
