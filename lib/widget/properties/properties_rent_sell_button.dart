import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/properties/properties_controller.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';

class PropertiesRentSellButton extends StatelessWidget {
  PropertiesRentSellButton({Key? key}) : super(key: key);
  final propertiesController = Get.put(PropertiesController());
  final settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              enableFeedback: false,
              onTap: () {
                propertiesController.isSelectedSell(
                    !(propertiesController.isSelectedSell.value));

                propertiesController.isSelectedRent.value = false;
              },
              child: Container(
                width: 110,
                height: 40,
                decoration: BoxDecoration(
                    color: !propertiesController.isSelectedSell.value
                        ? ColorManager.grey2.withOpacity(
                            0.15,
                          )
                        : ColorManager.lightPrimary.withOpacity(0.13),
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    border: settingController.isLightMode.value
                        ? Border.all(
                            color: !propertiesController.isSelectedSell.value
                                ? ColorManager.black.withOpacity(0.4)
                                : ColorManager.primary,
                            width: 0.8,
                          )
                        : Border.all(
                            color: !propertiesController.isSelectedSell.value
                                ? ColorManager.ofWhite.withOpacity(0.4)
                                : ColorManager.primary,
                          )),
                child: Center(
                  child: TextUtils(
                    fontFamily: '',
                    text: "Sell",
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                    fontWeight: FontWeightManager.semilight,
                    fontSize: FontSize.s20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              enableFeedback: false,
              onTap: () {
                propertiesController.isSelectedRent(
                    !(propertiesController.isSelectedRent.value));
                propertiesController.isSelectedSell.value = false;
              },
              child: Container(
                width: 110,
                height: 40,
                decoration: BoxDecoration(
                    color: !propertiesController.isSelectedRent.value
                        ? ColorManager.grey2.withOpacity(
                            0.15,
                          )
                        : ColorManager.lightPrimary.withOpacity(0.13),
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    border: settingController.isLightMode.value
                        ? Border.all(
                            color: !propertiesController.isSelectedRent.value
                                ? ColorManager.black.withOpacity(0.4)
                                : ColorManager.primary,
                            width: 0.8,
                          )
                        : Border.all(
                            color: !propertiesController.isSelectedRent.value
                                ? ColorManager.ofWhite.withOpacity(0.4)
                                : ColorManager.primary,
                          )),
                child: Center(
                  child: TextUtils(
                    fontFamily: '',
                    text: "Rent",
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                    fontWeight: FontWeightManager.semilight,
                    fontSize: FontSize.s20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
