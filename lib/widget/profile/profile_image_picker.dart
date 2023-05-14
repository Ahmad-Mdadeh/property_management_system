import 'package:flutter/material.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/color_manager.dart';

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4.5,
      child: Stack(
        children: [
          Positioned(
              top: 32,
              left: 119,
              child: Container(
                width: 127,
                height: 127,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorManager.primary,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
              )),
          const Positioned(
            top: 41,
            left: 128,
            child: CircleAvatar(
              radius: 55.0,
              backgroundImage: AssetImage(
                ImagesAssets.photo,
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 215,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: ColorManager.darkPrimary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {},
                icon: Icon(
                  Icons.edit_outlined,
                  color: ColorManager.white,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
