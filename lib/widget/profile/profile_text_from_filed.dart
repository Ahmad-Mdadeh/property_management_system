import 'package:flutter/material.dart';
import 'package:property_management_system/resources/color_manager.dart';

class ProfileTextFromFiled extends StatelessWidget {
  final TextInputType textInputType;
  final Function validator;
  final Function function;

  const ProfileTextFromFiled(
      {required this.textInputType,
      required this.validator,
      required this.function,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:(value) => function,
      validator: (value) => validator(value),
      keyboardType: textInputType,
      style: const TextStyle(
        fontFamily: 'Outfit',
        color: Colors.white,
        fontSize: 17.0,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.grey3.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            13.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey1, width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.lightTeal,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
      ),
    );
  }
}
