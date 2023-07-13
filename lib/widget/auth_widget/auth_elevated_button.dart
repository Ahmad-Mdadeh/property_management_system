import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:property_management_system/resources/text_manager.dart';

class AuthButton extends StatelessWidget {
  final Color? color;
  final String text;
  final double width;
  final double height;
  final double borderRadius;
  final Function() function;

  const AuthButton({
    super.key,
    required this.borderRadius,
     this.color,
    required this.text,
    required this.width,
    required this.height,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        width: width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).iconTheme.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadius,
              ),
            ),
          ),
          onPressed: function,
          child: TextUtils(
            text: text,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}
