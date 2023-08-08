import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/chat.dart';
import 'package:property_management_system/modules/home/home_screen.dart';
import 'package:property_management_system/modules/my_properties/my_properties_screen.dart';
import 'package:property_management_system/modules/settings/settings_screen.dart';

class BaseController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  List<Widget> namePages = [
     HomeScreen(),
    const Chat(),
    MyPropertiesScreen(),
    SettingScreen(),
  ].obs;
}
