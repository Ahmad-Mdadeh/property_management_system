import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

class PropertiesCard extends StatelessWidget {
  PropertiesCard({Key? key}) : super(key: key);
  final RxBool isHighlighted = true.obs;
  final RxBool isFavorite = false.obs;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p10,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15.0,
              ),
              border: Border.all(
                width: 0.8,
                color: ColorManager.ofWhite.withOpacity(0.2),
              ),
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 5.5,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/building.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(
                  15.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  15.0,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX:1,
                    sigmaY:1,
                  ),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 1.18,
          top: MediaQuery.of(context).size.height / 100,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onHighlightChanged: (value) {
              isHighlighted(!(isHighlighted.value));
            },
            onTap: () {
              isFavorite(!(isFavorite.value));
            },
            child: Obx(
              () {
                return AnimatedContainer(
                  margin: EdgeInsets.all(isHighlighted.value ? 0 : 3),
                  height: isHighlighted.value ? 35 : 23,
                  width: isHighlighted.value ? 35 : 23,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.darkPrimary.withOpacity(0.6 ),
                        blurRadius: 15,
                        offset: const Offset(
                          -4,
                          6,
                        ),
                      ),
                    ],
                    color: ColorManager.darkPrimary.withOpacity(
                      0.85,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isFavorite.value ? Icons.favorite : Icons.favorite_outline,
                    color: ColorManager.lightPrimary,
                    size: isHighlighted.value ? 22 : 19,
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 75,
          // top: MediaQuery.of(context).size.height / 10.37,
          // left: MediaQuery.of(context).size.width / 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: AppPadding.p4),
                decoration: BoxDecoration(
                  color: ColorManager.grey2.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(
                      5.0,
                    ),
                    topRight: Radius.circular(
                      5.0,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.house_outlined,
                      color: ColorManager.lightPrimary,
                      size: AppSize.s16,
                    ),
                    TextUtils(
                      text: "HOUSE",
                      color: ColorManager.iconBackground,
                      fontWeight: FontWeightManager.medium,
                      fontSize: FontSize.s11,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Container(
                padding: const EdgeInsets.only(left: AppPadding.p6),
                decoration: BoxDecoration(
                  color: ColorManager.grey2.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(
                      5.0,
                    ),
                    topRight: Radius.circular(
                      5.0,
                    ),
                  ),
                ),
                child: TextUtils(
                  text: "\$2000",
                  color: ColorManager.iconBackground,
                  fontWeight: FontWeightManager.medium,
                  fontSize: FontSize.s16,
                ),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Container(
                padding: const EdgeInsets.only(left: AppPadding.p6),
                decoration: BoxDecoration(
                  color: ColorManager.grey2.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(
                      7.0,
                    ),
                    bottomLeft: Radius.circular(
                      15.0,
                    ),
                  ),
                ),
                child: TextUtils(
                  text: "Pretty Home",
                  color: ColorManager.iconBackground,
                  fontWeight: FontWeightManager.medium,
                  fontSize: FontSize.s18,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 260,
          top: 122,
          // left: MediaQuery.of(context).size.width / 1.39,
          // top: MediaQuery.of(context).size.height / 6.33,
          child: Container(
            padding: const EdgeInsets.only(right: AppPadding.p6),
            decoration: BoxDecoration(
              color: ColorManager.grey2.withOpacity(0.7),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  7.0,
                ),
                bottomRight: Radius.circular(
                  15.0,
                ),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: ColorManager.darkPrimary,
                  size: AppSize.s18,
                ),
                TextUtils(
                  fontFamily: "",
                  text: "Damascus",
                  color: ColorManager.ofWhite,
                  fontWeight: FontWeightManager.semilight,
                  fontSize: FontSize.s14,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
