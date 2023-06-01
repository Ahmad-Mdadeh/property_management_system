import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:get/get.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:rive/rive.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StateMachineController? stateMachineController;
    RxBool isDarkMode = false.obs;
    RxBool isDarkMode2 = false.obs;
    timeDilation = 3;
    return Scaffold(
      appBar: AppBar(
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
          children: [
            // Expanded(child: Panorama(child: Image.asset('assets/images/panorama.jpg'),)),
            TextUtils(
              color: Theme.of(context).textTheme.bodyMedium!.color,
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
