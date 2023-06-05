import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:get/get.dart';
import 'package:panorama/panorama.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:rive/rive.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: const TextUtils(
          text: 'Panorama',
          fontWeight: FontWeightManager.regular,
          fontSize: FontSize.s20,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: Panorama(
              child: Image.asset(
                'assets/images/room.jpg',
              ),
            ),),
          ],
        ),
      ),
    );
  }
}
