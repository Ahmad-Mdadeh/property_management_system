import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/property_detail/property_details_screen.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/property_details/text_tag.dart';

class HomePropertyCard extends StatelessWidget {
  HomePropertyCard({super.key});

  final RxBool isHighlighted = true.obs;
  final RxBool isFavorite = false.obs;

  @override
  Widget build(BuildContext context) {
    return buildHomePropertyCard(context);
  }

  Stack buildHomePropertyCard(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Get.to(
              PropertyDetailsScreen(
                contextPropertyDetailsScreen: context,
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            height: MediaQuery.of(context).size.height / 2.8,
            width: MediaQuery.of(context).size.width / 1.5,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
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
            width: 65,
            height: 27,
            fontSize: 10,
            color: Theme.of(context).iconTheme.color!,
          ),
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
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    shape: BoxShape.circle,
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
                  ),
                  child: Icon(
                    isFavorite.value ? Icons.favorite : Icons.favorite_outline,
                    color: Theme.of(context).iconTheme.color,
                    size: isHighlighted.value ? 22 : 19,
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 4.2,
          left: MediaQuery.of(context).size.width / 25,
          child: Column(
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
                    text: 'House',
                    color: Theme.of(context).textTheme.bodySmall!.color,
                    fontWeight: FontWeightManager.semilight,
                    fontSize: FontSize.s12,
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 150,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: TextUtils(
                  text: '\$100000',
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeightManager.regular,
                  fontSize: FontSize.s18,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 150,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: TextUtils(
                    text: 'Property Name',
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                    fontWeight: FontWeightManager.regular,
                    fontSize: FontSize.s14),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 150,
              ),
              Row(
                children: [
                  Icon(
                    Icons.not_listed_location_outlined,
                    color: Theme.of(context).textTheme.bodySmall!.color,
                    size: 18,
                  ),
                  TextUtils(
                      text: 'Location',
                      color: Theme.of(context).textTheme.bodySmall!.color,
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
