import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/resources/color_manager.dart';

class AuthTextFromField extends StatelessWidget {
  final TextInputType textInputType;
  final bool obscureText;
  final Function validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String labelText;
  final bool filled;
  final Color? color;
  final double fontSize;
  final FontWeight? fontWeight;

  const AuthTextFromField({super.key,
    required this.validator,
    required this.textInputType,
    required this.obscureText,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.labelText,
    required this.filled,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.065,
      child: TextFormField(
        style: const TextStyle(
          fontFamily:  'Outfit',
          color: Colors.black,
          fontSize: 17.0,
        ),
        cursorColor: Get.isDarkMode ? ColorManager.primary : ColorManager.primary,
        keyboardType: textInputType,
        obscureText: obscureText,
        validator: (value) => validator(value),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixIconColor: ColorManager.primary,
          suffixIcon: suffixIcon,
          fillColor: Colors.grey.shade200,
          filled: filled,
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.black54,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(
                0xFF097C7D,
              ),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF097C7D),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
        ),
      ),
    );
  }
}
