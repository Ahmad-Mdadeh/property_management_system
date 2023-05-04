import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextUtils(
          text: "HOME",
          color: ColorManager.white,
          fontWeight: FontWeightManager.medium,
          fontSize: FontSize.s17,
        ),
        centerTitle: true,
        backgroundColor: ColorManager.lightPrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Center(
            child: Lottie.asset(
              "assets/json/loading.json",
              width: 250,
            ),
          ),
          const Text("Home")
        ],
      ),
    );
  }
}
