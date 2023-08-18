import 'package:flutter/material.dart';
import 'package:property_management_system/resources/color_manager.dart';

class ProfileTextFromFiled extends StatelessWidget {
  final TextInputType textInputType;
  final Function validator;
  final Function function;
  final String hintText;
  final IconData icon;
  final Color color;
  final double ?width;

  const ProfileTextFromFiled({required this.textInputType,
    required this.validator,
    required this.function,
    required this.hintText,
    required this.icon, required this.color, this.width=double.infinity, super.key,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width,
      child: TextFormField(
        onChanged: (value) => function(value),
        validator: (value) => validator(value),
        keyboardType: textInputType,
        style: TextStyle(
          fontFamily: 'Outfit',
          color: Theme
              .of(context)
              .textTheme
              .bodyLarge!
              .color,
          fontSize: 17.0,
        ),
        decoration: InputDecoration(
          prefixIconColor: color,
          prefixIcon: Icon(icon),
          hintText: hintText,
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
              color: ColorManager.darkPrimary,
            ),
            borderRadius: const BorderRadius.all(
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
