import 'dart:ui';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/resources/routes_manager.dart';
import 'package:property_management_system/utils/languages.dart';
import 'package:property_management_system/utils/theme_service.dart';

void main() async {
  // Languages languages = Languages();
  // String originalLanguaeg = window.locale.languageCode;

  WidgetsFlutterBinding.ensureInitialized();
  final themeService = await ThemeService.instance;
  var initTheme = themeService.initial;
  runApp(MyApp(
    themeData: initTheme,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: themeData,
      child: GetMaterialApp(
        locale: Locale('en'),
        translations: Languages(),
        fallbackLocale: Locale('en'),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.baseScreen,
        getPages: AppRoutes.getPages,
      ),
    );
  }
}
