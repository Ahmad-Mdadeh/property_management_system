import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/text_manager.dart';
import '../../resources/values_manager.dart';
import '../property_details/circular_button.dart';
import '../property_details/text_tag.dart';

class MostViewedPropertyCard extends StatelessWidget {
  const MostViewedPropertyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                    //   highlightColor: ColorManager.lightPrimary,
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
          top: 148,
          right: AppSize.s18,
          child: circularButton(
              icon: Icons.favorite_border_rounded, size: AppSize.s18),
        ),
        Positioned(
          top: 170,
          left: 14,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_pin, color: ColorManager.lightPrimary),
                  TextUtils(
                      text: 'Property type',
                      color: ColorManager.lightGrey,
                      fontWeight: FontWeightManager.regular,
                      fontSize: FontSize.s14)
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 150,
              ),
              TextUtils(
                  text: '\$100000',
                  color: ColorManager.lightPrimary,
                  fontWeight: FontWeightManager.regular,
                  fontSize: FontSize.s14),
              SizedBox(
                height: MediaQuery.of(context).size.height / 150,
              ),
              TextUtils(
                  text: 'Property Name',
                  color: ColorManager.white,
                  fontWeight: FontWeightManager.regular,
                  fontSize: FontSize.s14),
              SizedBox(
                height: MediaQuery.of(context).size.height / 150,
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
