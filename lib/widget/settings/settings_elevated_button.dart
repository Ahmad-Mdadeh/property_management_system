import 'package:flutter/material.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';

class SettingsButton extends StatelessWidget {
  final Color? color;
  final String text;
  final double width;
  final double height;
  final double borderRadius;
  final Function() function;

  const SettingsButton({
    super.key,
    required this.borderRadius,
    required this.color,
    required this.text,
    required this.width,
    required this.height,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius,
            ),
          ),
        ),
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextUtils(
              text: text,
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 10.8,
            ),
            const SizedBox(
              width: 5,
            ),
            Icon(
              Icons.edit_note_outlined,
              color: ColorManager.white,
            ),
          ],
        ),
      ),
    );
  }
}
