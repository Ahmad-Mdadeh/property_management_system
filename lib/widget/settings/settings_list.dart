import 'package:flutter/material.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

class SittingsList extends StatelessWidget {
  const SittingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      child: Row(
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
                image: const DecorationImage(
                  image: AssetImage(
                    ImagesAssets.searching,
                  ),
                ),
                borderRadius: BorderRadius.circular(
                  AppSize.s8,
                ),
              ),
            ),
          ),
          TextUtils(
            text: "My Enquiry",
            color: ColorManager.white,
            fontWeight: FontWeightManager.medium,
            fontSize: FontSize.s15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p103,
            ),
            child: Container(
              width: 33,
              height: 33,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorManager.grey1,
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
        ],
      ),
    );
  }
}
