import 'package:flutter/material.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.073,
              decoration: BoxDecoration(
                color: ColorManager.lightPrimary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  left: 16.0,
                ),
                child: TextUtils(
                  text: "My Profile",
                  color: ColorManager.white,
                  fontWeight: FontWeightManager.medium,
                  fontSize: FontSize.s19,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
