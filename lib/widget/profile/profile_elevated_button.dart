import 'package:flutter/material.dart';
import 'package:property_management_system/resources/text_manager.dart';

class ProfileButton extends StatelessWidget {
  final Color? color;
  final String text;
  final double width;
  final double height;
  final double borderRadius;
  final Function() function;

  const ProfileButton({
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
              fontSize: 13.0,
            ),
            const SizedBox(
              width: 4,
            ),
            const Icon(
              Icons.edit_note_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
