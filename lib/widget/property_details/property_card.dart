import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/utils/my_flutter_app_icons.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/property_details/circular_button.dart';
import 'package:property_management_system/widget/property_details/text_tag.dart';

class PropertyCard extends StatelessWidget {
  PropertyCard({
    super.key,
  });

  final RxBool isHighlighted = true.obs;
  final RxBool isFavorite = false.obs;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: AppSize.s225,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Image.asset(
                ImagesAssets.building,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: AppSize.s18,
            left: AppSize.s18,
            child: buildTag(
                text: 'Featured',
                color: ColorManager.darkPrimary,
                width: AppSize.s80,
                height: 31,
                fontSize: 12),
          ),
          Positioned(
            top: AppSize.s18,
            right: AppSize.s18,
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
            ),
          ),
          Positioned(
            bottom: AppSize.s18,
            right: AppSize.s18,
            child: circularButton(
                icon: MyFlutterApp.degrees360, size: AppSize.s24),
          )
        ],
      ),
    );
  }
}
