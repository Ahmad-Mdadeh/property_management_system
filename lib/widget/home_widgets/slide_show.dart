import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/property_detail/property_details_screen.dart';
import 'package:property_management_system/widget/properties/Properties_card.dart';
import 'package:shimmer/shimmer.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';

class SlideShow extends StatelessWidget {
  const SlideShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () => Get.to(PropertyDetailsScreen(contextPropertyDetailsScreen: context,)),
        child: Container(
          height: MediaQuery.of(context).size.height / 3,
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                ImagesAssets.building,
              ),
              fit: BoxFit.cover,
            ),
            color: ColorManager.primary,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
