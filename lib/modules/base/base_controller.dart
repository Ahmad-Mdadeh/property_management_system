import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/chat.dart';
import 'package:property_management_system/modules/home/home_screen.dart';
import 'package:property_management_system/modules/notice.dart';
import 'package:property_management_system/modules/profile/profile_screen.dart';

class BaseController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final namePages = [
    HomeScreen(),
    Chat(),
    Notice(),
    ProfileScreen(),
  ].obs;
}
