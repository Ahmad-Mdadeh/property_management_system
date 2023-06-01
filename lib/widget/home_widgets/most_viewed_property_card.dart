import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../modules/property_detail/property_details_screen.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/text_manager.dart';
import '../../resources/values_manager.dart';
import '../property_details/circular_button.dart';
import '../property_details/text_tag.dart';

class MostViewedPropertyCard extends StatelessWidget {
  MostViewedPropertyCard({
    super.key,
  });
  final RxBool isHighlighted = true.obs;
  final RxBool isFavorite = false.obs;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Get.to(
              PropertyDetailsScreen(),
            );
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            height: MediaQuery.of(context).size.height / 2.8,
            width: MediaQuery.of(context).size.width / 2.2,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              color: ColorManager.darkPrimary,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      // child: Container(color: Colors.white),
                      // child: Shimmer.fromColors(
                      //   highlightColor: ColorManager.primary,
                      //   baseColor: ColorManager.darkPrimary,
                      //   period: const Duration(seconds: 1),
                      child: Image.asset(
                        ImagesAssets.building,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: AppSize.s20,
          left: AppSize.s10,
          child: buildTag(
              text: 'Featured',
              width: 53,
              height: 25,
              fontSize: 8,
              color: Colors.white),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height / 5,
            right: MediaQuery.of(context).size.width / 20,
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
                          color: ColorManager.darkPrimary.withOpacity(0.6),
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
                      isFavorite.value
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: ColorManager.primary,
                      size: isHighlighted.value ? 22 : 19,
                    ),
                  );
                },
              ),
            )
            // child: circularButton(
            //   icon: Icons.favorite_border_rounded,
            //   size: AppSize.s18,
            // ),
            ),
        Positioned(
          top: MediaQuery.of(context).size.height / 4.2,
          left: MediaQuery.of(context).size.width / 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_pin, color: ColorManager.primary),
                  TextUtils(
                      text: 'Property type',
                      color: ColorManager.lightGrey,
                      fontWeight: FontWeightManager.regular,
                      fontSize: FontSize.s14)
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 155,
              ),
              TextUtils(
                  text: '\$100000',
                  color: ColorManager.primary,
                  fontWeight: FontWeightManager.regular,
                  fontSize: FontSize.s14),
              SizedBox(
                height: MediaQuery.of(context).size.height / 155,
              ),
              TextUtils(
                  text: 'Property Name',
                  color: ColorManager.white,
                  fontWeight: FontWeightManager.regular,
                  fontSize: FontSize.s14),
              SizedBox(
                height: MediaQuery.of(context).size.height / 155,
              ),
              Row(
                children: [
                  Icon(Icons.not_listed_location_outlined,
                      color: Colors.grey.withOpacity(0.7), size: 18),
                  TextUtils(
                      text: 'Location',
                      color: Colors.grey.withOpacity(0.7),
                      fontWeight: FontWeightManager.semilight,
                      fontSize: FontSize.s12)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
