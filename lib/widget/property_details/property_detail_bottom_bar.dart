import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';

import '../../resources/values_manager.dart';
import 'contact_button.dart';

class PropertyDetailBottomBar extends StatelessWidget {
 const PropertyDetailBottomBar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      height: AppSize.s60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildElevatedButton(
            'SMS',
            Icons.chat_outlined,
            context,
          ),
          buildElevatedButton(
            'Call',
            Icons.call_outlined,
            context,
          ),
          buildElevatedButton(
            'Chat',
            Icons.wechat_rounded,
            context,
          ),
        ],
      ),
    );
  }
}
