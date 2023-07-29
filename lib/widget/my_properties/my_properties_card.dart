import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/my_properties/my_properties_controller.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

class MyPropertiesCard extends StatelessWidget {
  final int index;

  MyPropertiesCard({required this.index, Key? key}) : super(key: key);
  final RxBool isHighlighted = true.obs;
  final RxBool isFavorite = false.obs;
  final settingController = Get.put(SettingController());
  final _propertiesController = Get.put(MyPropertiesController());

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: _propertiesController
                              .myPropertiesRent[index].visibility ==
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
                    text: _propertiesController
                                .myPropertiesRent[index].visibility ==
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
                      text: _propertiesController
                          .myPropertiesRent[index].propertyType,
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
                    text:
                        '\$${_propertiesController.myPropertiesRent[index].monthlyRent}',
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
                    text: _propertiesController
                        .myPropertiesRent[index].property.name,
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
                          text: _propertiesController
                              .myPropertiesRent[index].property.address,
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
                      isFavorite.value
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
    );

    // return Stack(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.symmetric(
    //         horizontal: AppPadding.p10,
    //       ),
    //       child: Container(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(
    //             15.0,
    //           ),
    //           border: Border.all(
    //             width: 0.8,
    //             color: ColorManager.ofWhite.withOpacity(0.2),
    //           ),
    //         ),
    //         child: Container(
    //           width: double.infinity,
    //           height: MediaQuery.of(context).size.height / 5.5,
    //           decoration: BoxDecoration(
    //             image: const DecorationImage(
    //               image: AssetImage(
    //                 "assets/images/building.jpg",
    //               ),
    //               fit: BoxFit.cover,
    //             ),
    //             borderRadius: BorderRadius.circular(
    //               15.0,
    //             ),
    //           ),
    //           child: ClipRRect(
    //             borderRadius: BorderRadius.circular(
    //               15.0,
    //             ),
    //             child: BackdropFilter(
    //               filter: ImageFilter.blur(
    //                 sigmaX: 1,
    //                 sigmaY: 1,
    //               ),
    //               child: Container(
    //                 color: Colors.transparent,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //     Positioned(
    //       left: MediaQuery.of(context).size.width / 1.18,
    //       top: MediaQuery.of(context).size.height / 100,
    //       child: InkWell(
    //         highlightColor: Colors.transparent,
    //         splashColor: Colors.transparent,
    //         onHighlightChanged: (value) {
    //           isHighlighted(!(isHighlighted.value));
    //         },
    //         onTap: () {
    //           isFavorite(!(isFavorite.value));
    //         },
    //         child: Obx(
    //           () {
    //             return AnimatedContainer(
    //               margin: EdgeInsets.all(isHighlighted.value ? 0 : 3),
    //               height: isHighlighted.value ? 35 : 23,
    //               width: isHighlighted.value ? 35 : 23,
    //               curve: Curves.fastLinearToSlowEaseIn,
    //               duration: const Duration(milliseconds: 300),
    //               decoration: BoxDecoration(
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.black.withOpacity(0.2),
    //                     blurRadius: 15,
    //                     offset: const Offset(
    //                       -4,
    //                       6,
    //                     ),
    //                   ),
    //                 ],
    //                 color: Theme.of(context).appBarTheme.backgroundColor,
    //
    //                 shape: BoxShape.circle,
    //               ),
    //               child: Icon(
    //                 isFavorite.value ? Icons.favorite : Icons.favorite_outline,
    //                 color: ColorManager.primary,
    //                 size: isHighlighted.value ? 22 : 19,
    //               ),
    //             );
    //           },
    //         ),
    //       ),
    //     ),
    //     Positioned(
    //       left: 10,
    //       top: 75,
    //       // top: MediaQuery.of(context).size.height / 10.37,
    //       // left: MediaQuery.of(context).size.width / 30,
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Container(
    //             padding: const EdgeInsets.only(left: AppPadding.p4),
    //             decoration: BoxDecoration(
    //               color: ColorManager.grey2.withOpacity(0.7),
    //               borderRadius: const BorderRadius.only(
    //                 bottomRight: Radius.circular(
    //                   5.0,
    //                 ),
    //                 topRight: Radius.circular(
    //                   5.0,
    //                 ),
    //               ),
    //             ),
    //             child: Row(
    //               children: [
    //                 Icon(
    //                   Icons.house_outlined,
    //                   color: ColorManager.primary,
    //                   size: AppSize.s16,
    //                 ),
    //                 TextUtils(
    //                   text: "HOUSE",
    //                   color: ColorManager.iconBackground,
    //                   fontWeight: FontWeightManager.medium,
    //                   fontSize: FontSize.s11,
    //                 ),
    //               ],
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 3.0,
    //           ),
    //           Container(
    //             padding: const EdgeInsets.only(left: AppPadding.p6),
    //             decoration: BoxDecoration(
    //               color: ColorManager.grey2.withOpacity(0.7),
    //               borderRadius: const BorderRadius.only(
    //                 bottomRight: Radius.circular(
    //                   5.0,
    //                 ),
    //                 topRight: Radius.circular(
    //                   5.0,
    //                 ),
    //               ),
    //             ),
    //             child: TextUtils(
    //               text: "\$2000",
    //               color: ColorManager.iconBackground,
    //               fontWeight: FontWeightManager.medium,
    //               fontSize: FontSize.s16,
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 3.0,
    //           ),
    //           Container(
    //             padding: const EdgeInsets.only(left: AppPadding.p6),
    //             decoration: BoxDecoration(
    //               color: ColorManager.grey2.withOpacity(0.7),
    //               borderRadius: const BorderRadius.only(
    //                 topRight: Radius.circular(
    //                   7.0,
    //                 ),
    //                 bottomLeft: Radius.circular(
    //                   15.0,
    //                 ),
    //               ),
    //             ),
    //             child: TextUtils(
    //               text: "Pretty Home",
    //               color: ColorManager.iconBackground,
    //               fontWeight: FontWeightManager.medium,
    //               fontSize: FontSize.s18,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     Positioned(
    //       left: 260,
    //       top: 122,
    //       // left: MediaQuery.of(context).size.width / 1.39,
    //       // top: MediaQuery.of(context).size.height / 6.33,
    //       child: Container(
    //         padding: const EdgeInsets.only(right: AppPadding.p6),
    //         decoration: BoxDecoration(
    //           color: ColorManager.grey2.withOpacity(0.7),
    //           borderRadius: const BorderRadius.only(
    //             topLeft: Radius.circular(
    //               7.0,
    //             ),
    //             bottomRight: Radius.circular(
    //               15.0,
    //             ),
    //           ),
    //         ),
    //         child: Row(
    //           children: [
    //             Icon(
    //               Icons.location_on_outlined,
    //               color: ColorManager.darkPrimary,
    //               size: AppSize.s18,
    //             ),
    //             TextUtils(
    //               fontFamily: "",
    //               text: "Damascus",
    //               color: ColorManager.ofWhite,
    //               fontWeight: FontWeightManager.semilight,
    //               fontSize: FontSize.s14,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
