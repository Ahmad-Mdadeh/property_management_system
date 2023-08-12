import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/favorites/favorites_controller.dart';
import 'package:property_management_system/modules/property_detail/property_details_screen.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/utils/scroll_glow.dart';

class FavoritesListWidget extends StatelessWidget {
  FavoritesListWidget({Key? key}) : super(key: key);
  final FavoritesController _favoritesController =
      Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).iconTheme.color,
      onRefresh: () async {
        _favoritesController.refreshIndicator();
      },
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
          itemCount: _favoritesController.favoritesProperties.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: AppSize.s7,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Get.to(
                () => PropertyDetailsScreen(
                    contextPropertyDetailsScreen: context),
                arguments: [
                  _favoritesController.favoritesProperties[index].id,
                  _favoritesController.favoritesProperties[index].posttype,
                ],
              );
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                    border: Border.all(
                      width: 1.5,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5.5,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          ImagesAssets.building,
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
                          sigmaX: 0,
                          sigmaY: 0,
                        ),
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  left: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.33,
                    padding: const EdgeInsets.only(
                      left: AppPadding.p3,
                      bottom: AppPadding.p2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(
                          17.0,
                        ),
                        bottomLeft: Radius.circular(
                          15.0,
                        ),
                      ),
                      color: ColorManager.grey2.withOpacity(0.7),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextUtils(
                          textOverflow: TextOverflow.ellipsis,
                          text: _favoritesController
                              .favoritesProperties[index].property!.name!,
                          color: ColorManager.iconBackground,
                          fontWeight: FontWeightManager.medium,
                          fontSize: FontSize.s16,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Theme.of(context).iconTheme.color!,
                              size: AppSize.s18,
                            ),
                            Expanded(
                              child: TextUtils(
                                textOverflow: TextOverflow.ellipsis,
                                fontFamily: "",
                                text: _favoritesController
                                    .favoritesProperties[index]
                                    .property!
                                    .address!,
                                color: ColorManager.ofWhite,
                                fontWeight: FontWeightManager.semilight,
                                fontSize: FontSize.s14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
              .animate(

                delay: 150.ms,
              )
              .slideX(
                begin: 1,
                duration: 1000.ms,
                curve: Curves.fastLinearToSlowEaseIn,
              )
              .fadeIn(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 1500),
              ),
        ),
      ),
    );
  }
}
