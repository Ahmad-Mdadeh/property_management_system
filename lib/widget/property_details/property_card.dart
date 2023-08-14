import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/favorites/favorites_controller.dart';
import 'package:property_management_system/modules/property_detail/property_details_controller.dart';
import 'package:property_management_system/utils/my_flutter_app_icons.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/property_details/circular_button.dart';
import 'package:property_management_system/widget/property_details/text_tag.dart';

class PropertyCard extends StatelessWidget {
  PropertyCard({super.key});

  final _favoritesController = Get.put(FavoritesController());
  final _propertyDetailsController = Get.put(PropertyDetailsController());
  final RxBool isHighlighted = true.obs;

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
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: Image.asset(
              ImagesAssets.building,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: AppSize.s14,
            left: AppSize.s14,
            child: buildTag(
              text: 'featured'.tr,
              color: Theme.of(context).iconTheme.color!,
              width: AppSize.s80,
              height: 31,
              fontSize: 12,
            ),
          ),
          Positioned(
            top: AppSize.s14,
            right: AppSize.s14,
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onHighlightChanged: (value) {
                isHighlighted(!(isHighlighted.value));
              },
              onTap: () {
                _favoritesController.postType =
                _propertyDetailsController.postType;
                _favoritesController.idProperties =
                _propertyDetailsController.id;
                _favoritesController.addOrRemoveFavoritesProperties();
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
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 15,
                          offset: const Offset(
                            -4,
                            6,
                          ),
                        ),
                      ],
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _favoritesController.idList.contains(
                        _propertyDetailsController.id,
                      )
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: Theme.of(context).iconTheme.color,
                      size: isHighlighted.value ? 22 : 19,
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: AppSize.s14,
            right: AppSize.s14,
            child: CircularDegrees360Button(
              context: context,
              colorIcon: Theme.of(context).iconTheme.color!,
              color: Theme.of(context).appBarTheme.backgroundColor!,
              icon: MyFlutterApp.degrees360,
              size: AppSize.s24,
            ),
          )
        ],
      ),
    );
  }
}
