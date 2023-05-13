import 'package:flutter/material.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';

class ProfileButton extends StatelessWidget {
  final Color? color;
  final String text;
  final double height;
  final double borderRadius;
  final Function() function;

  const ProfileButton({
    super.key,
    required this.borderRadius,
    required this.color,
    required this.text,
    required this.height,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              fontWeight: FontWeightManager.medium,
              fontSize: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
