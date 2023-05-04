import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/resources/routes_manager.dart';
import 'package:property_management_system/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.getPages,

    );
  }
}
