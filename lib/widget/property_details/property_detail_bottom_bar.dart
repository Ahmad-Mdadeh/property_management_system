import 'package:flutter/material.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/property_details/contact_button.dart';

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
