import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/home/home_controller.dart';
import 'package:property_management_system/modules/property_detail/property_details_screen.dart';
import 'package:property_management_system/resources/assets_manager.dart';

class SlideShow extends StatelessWidget {
final int index ;
  SlideShow({super.key, required this.index});
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          Get.to(
            arguments: [
              _homeController.allProperties[index].id,
              _homeController.allProperties[index].posttype
            ],
            () => PropertyDetailsScreen(
              contextPropertyDetailsScreen: context,
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(8, 5, 8, 5),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImagesAssets.building,
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
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
