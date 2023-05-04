import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/base/base_controller.dart';
import 'package:property_management_system/modules/home/home_screen.dart';
import 'package:property_management_system/modules/login/login_screen.dart';
import 'package:property_management_system/widget/navigation/custom_animated_bottom_bar.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({Key? key}) : super(key: key);
  final baseController = Get.put(BaseController());
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      bottomNavigationBar: CustomAnimatedBottomBar(),
      body: Obx(
        () => IndexedStack(
          index: baseController.selectedIndex.value,
          children: baseController.namePages,
        ),
      ),
    );
  }
}
