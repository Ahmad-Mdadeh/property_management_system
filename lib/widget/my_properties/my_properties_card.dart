import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/favorites/favorites_controller.dart';
import 'package:property_management_system/modules/home/home_controller.dart';
import 'package:property_management_system/modules/my_properties/my_properties_controller.dart';
import 'package:property_management_system/modules/property_detail/property_details_screen.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

class MyPropertiesCard extends StatelessWidget {
  final int index;

  MyPropertiesCard({required this.index, Key? key}) : super(key: key);

  final settingController = Get.put(SettingController());
  final _myPropertiesController = Get.put(MyPropertiesController());
  final _favoritesController = Get.put(FavoritesController());
  final RxBool isHighlighted = true.obs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          arguments: _myPropertiesController.isSelectedRent.value
              ? [
                  _myPropertiesController.postRent[index].id,
                  _myPropertiesController.postRent[index].posttype
                ]
              : [
                  _myPropertiesController.postSale[index].id,
                  _myPropertiesController.postSale[index].posttype,
                ],
          () => PropertyDetailsScreen(
            contextPropertyDetailsScreen: context,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 7,
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
          border: Border.all(
            color: Theme.of(context).colorScheme.primaryContainer,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 9.5,
                  width: MediaQuery.of(context).size.width / 3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                    image: const DecorationImage(
                      image: AssetImage(
                        ImagesAssets.building,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: MediaQuery.of(context).size.height / 35,
                  width: MediaQuery.of(context).size.width / 3.5,
                  decoration: BoxDecoration(
                    color: _myPropertiesController.isSelectedRent.value
                        ? _myPropertiesController.postRent[index].visibility ==
                                0
                            ? Colors.orange
                            : Colors.green
                        : _myPropertiesController.postSale[index].visibility ==
                                0
                            ? Colors.orange
                            : Colors.green,
                    borderRadius: BorderRadius.circular(
                      7,
                    ),
                  ),
                  child: Center(
                    child: TextUtils(
                      color: ColorManager.white,
                      text: _myPropertiesController.isSelectedRent.value
                          ? _myPropertiesController
                                      .postRent[index].visibility ==
                                  0
                              ? "Deactivate"
                              : "Active"
                          : _myPropertiesController
                                      .postSale[index].visibility ==
                                  0
                              ? "Deactivate"
                              : "Active",
                      fontWeight: FontWeightManager.medium,
                      fontSize: FontSize.s14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: AppSize.s10,
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.house_outlined,
                        color: Theme.of(context).iconTheme.color,
                        size: AppSize.s18,
                      ),
                      TextUtils(
                        text: _myPropertiesController.isSelectedRent.value
                            ? _myPropertiesController.postRent[index].posttype!
                            : _myPropertiesController.postSale[index].posttype!,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                        fontWeight: FontWeightManager.semilight,
                        fontSize: FontSize.s12,
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 155,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: TextUtils(
                      text: _myPropertiesController.isSelectedRent.value
                          ? '\$${_myPropertiesController.postRent[index].monthlyRent}'
                          : '\$${_myPropertiesController.postSale[index].price}',
                      color: Theme.of(context).iconTheme.color,
                      fontWeight: FontWeightManager.regular,
                      fontSize: FontSize.s16,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 155,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: TextUtils(
                      textOverflow: TextOverflow.ellipsis,
                      text: _myPropertiesController.isSelectedRent.value
                          ? '${_myPropertiesController.postRent[index].propertyId}'
                          : '${_myPropertiesController.postSale[index].propertyId}',
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                      fontWeight: FontWeightManager.regular,
                      fontSize: FontSize.s18,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 155,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.not_listed_location_outlined,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                        size: 18,
                      ),
                      Expanded(
                        child: TextUtils(
                            textOverflow: TextOverflow.ellipsis,
                            text: "32",
                            color: Theme.of(context).textTheme.bodySmall!.color,
                            fontWeight: FontWeightManager.semilight,
                            fontSize: FontSize.s12),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                bottom: AppPadding.p56,
                right: AppPadding.p10,
              ),
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onHighlightChanged: (value) {
                  isHighlighted(!(isHighlighted.value));
                },
                onTap: () {
                  _favoritesController.postType =
                      _myPropertiesController.isSelectedRent.value
                          ? _myPropertiesController.postRent[index].posttype!
                          : _myPropertiesController.postSale[index].posttype!;
                  _favoritesController.idProperties =
                      _myPropertiesController.isSelectedRent.value
                          ? _myPropertiesController.postRent[index].id!
                          : _myPropertiesController.postSale[index].id!;
                  _favoritesController.addOrRemoveFavoritesProperties();
                },
                child: Obx(
                  () {
                    return AnimatedContainer(
                      margin: EdgeInsets.all(
                        isHighlighted.value ? 0 : 3,
                      ),
                      height: isHighlighted.value ? 35 : 23,
                      width: isHighlighted.value ? 35 : 23,
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(
                              -2,
                              4,
                            ),
                          ),
                        ],
                        color: Theme.of(context).appBarTheme.backgroundColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _favoritesController.idList.contains(
                                _myPropertiesController.isSelectedRent.value
                                    ? _myPropertiesController.postRent[index].id
                                    : _myPropertiesController
                                        .postSale[index].id)
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
          ],
        ),
      ),
    );
  }
}
