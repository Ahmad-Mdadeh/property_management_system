import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/properties/properties_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';

class PropertiesRentSellButton extends StatelessWidget {
  PropertiesRentSellButton({Key? key}) : super(key: key);
  final propertiesController = PropertiesController();

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
                if (propertiesController.isSelectedSell.value) {
                  propertiesController.isSelectedSell.value = false;
                } else {
                  propertiesController.isSelectedSell.value = true;
                  propertiesController.isSelectedRent.value = false;
                }
                print(propertiesController.isSelectedSell.value);
              },
              child: Container(
                width: 110,
                height: 40,
                decoration: BoxDecoration(
                  color: ColorManager.grey2.withOpacity(
                    0.15,
                  ),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  border: Border.all(
                    color: !propertiesController.isSelectedSell.value
                        ? ColorManager.ofWhite.withOpacity(0.4)
                        : ColorManager.primary,
                  ),
                ),
                child: Center(
                  child: TextUtils(
                    fontFamily: '',
                    text: "Sell",
                    color: ColorManager.white,
                    fontWeight: FontWeightManager.light,
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
                if (propertiesController.isSelectedRent.value) {
                  propertiesController.isSelectedRent.value = false;
                } else {
                  propertiesController.isSelectedRent.value = true;
                  propertiesController.isSelectedSell.value = false;
                }
                print(propertiesController.isSelectedRent.value);
              },
              child: Container(
                width: 110,
                height: 40,
                decoration: BoxDecoration(
                  color: ColorManager.grey2.withOpacity(
                    0.15,
                  ),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  border: Border.all(
                    color: !propertiesController.isSelectedRent.value
                        ? ColorManager.ofWhite.withOpacity(0.4)
                        : ColorManager.primary,
                  ),
                ),
                child: Center(
                  child: TextUtils(
                    fontFamily: '',
                    text: "Rent",
                    color: ColorManager.white,
                    fontWeight: FontWeightManager.light,
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
