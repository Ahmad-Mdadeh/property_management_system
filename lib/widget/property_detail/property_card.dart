import 'package:flutter/material.dart';
import 'package:property_management_system/widget/property_detail/circular_button.dart';
import 'package:property_management_system/widget/property_detail/text_tag.dart';

import '../../my_flutter_app_icons.dart';
import '../../resources/assets_manager.dart';
import '../../resources/values_manager.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: AppSize.s250,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              child: Image.asset(
                ImagesAssets.buliding,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: AppSize.s18,
            left: AppSize.s18,
            child: buildTag('Featured', AppSize.s80),
          ),
          Positioned(
            top: AppSize.s18,
            right: AppSize.s18,
            child: circularButton(Icons.location_city_outlined),
          ),
          Positioned(
              bottom: AppSize.s18,
              right: AppSize.s18,
              child: circularButton(MyFlutterApp.degrees360))
        ],
      ),
    );
  }
}
