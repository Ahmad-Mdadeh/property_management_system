import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/resources/color_manager.dart';

class AuthTextFromField extends StatelessWidget {
  final TextInputType textInputType;
  final bool obscureText;
  final Function validator;
  final Function function;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String labelText;
  final bool filled;
  final Color? color;
  final double labelFontSize;
  final FontWeight? labelFontWeight;

  const AuthTextFromField({
    super.key,
    required this.validator,
    required this.function,
    required this.textInputType,
    required this.obscureText,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.labelText,
    required this.filled,
    required this.color,
    required this.labelFontSize,
    required this.labelFontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        onChanged: (value) => function(value),
        cursorColor:
            Get.isDarkMode ? ColorManager.primary : ColorManager.primary,
        keyboardType: textInputType,
        obscureText: obscureText,
        validator: (value) => validator(value),
        style: TextStyle(
          height: MediaQuery.of(context).size.height * 0.0013,
          fontFamily: 'Outfit',
          color: Colors.black,
          fontSize: 17.0,
        ),
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          prefixIcon: prefixIcon,
          prefixIconColor: ColorManager.primary,
          suffixIcon: suffixIcon,
          fillColor: Colors.grey.shade200,
          filled: filled,
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.black54,
            fontSize: labelFontSize,
            fontWeight: labelFontWeight,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.primary,
            ),
            borderRadius: const BorderRadius.all(
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
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
