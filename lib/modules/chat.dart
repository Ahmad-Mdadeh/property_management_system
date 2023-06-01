import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:get/get.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/utils/theme.dart';

class Chat extends StatelessWidget {
  Chat({Key? key}) : super(key: key);
  RxBool isDarkMode = true.obs;

  @override
  Widget build(BuildContext context) {
    timeDilation = 3;
    return Scaffold(
      appBar: AppBar(
        actions: [
          ThemeSwitcher(
            builder: (context) => IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {
                ThemeSwitcher.of(context).changeTheme(
                  theme: isDarkMode.value
                      ? getThemeDataDarkMode()
                      : getThemeDataLightMode(),
                );
                isDarkMode(!(isDarkMode.value));
              },
              icon: Icon(
                isDarkMode.value ? Icons.mode_night_outlined : Icons.sunny,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(
              AppSize.s24,
            ),
            bottomLeft: Radius.circular(
              AppSize.s24,
            ),
          ),
        ),
        title: const TextUtils2(
          text: 'Chat',
          fontWeight: FontWeightManager.bold,
          fontSize: FontSize.s16,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            TextUtils2(
              text: 'You have pushed the button this many times:',
              fontWeight: FontWeightManager.bold,
              fontSize: FontSize.s16,
            ),
          ],
        ),
      ),
    );
  }
}
