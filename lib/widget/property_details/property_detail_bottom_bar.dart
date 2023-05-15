import 'package:flutter/material.dart';
import 'package:property_management_system/resources/color_manager.dart';

import '../../resources/values_manager.dart';
import 'contact_button.dart';

class PropertyDetailBottomBar extends StatelessWidget {
  const PropertyDetailBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: ColorManager.darkPrimary,
      elevation: 8.0,
      height: AppSize.s60,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildElevatedButton('SMS', Icons.chat_outlined),
          buildElevatedButton('Call', Icons.call_outlined),
          buildElevatedButton('Chat', Icons.wechat_rounded),
        ],
      ),
    );
  }
}
