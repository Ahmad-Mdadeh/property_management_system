import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';

class AuthIntlPhoneField extends StatelessWidget {
  final Function validator;
  final Function function;

  const AuthIntlPhoneField({
    super.key,
    required this.validator,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      onChanged: (value) => function(value),
      validator: (value) => validator(value),
      dropdownTextStyle: const TextStyle(
        fontWeight: FontWeightManager.medium,
      ),
      initialCountryCode: 'SY',
      cursorColor: ColorManager.primary,
      style: TextStyle(
        height:  MediaQuery.of(context).size.height *0.0013,
        color: ColorManager.black,
      ),
      cursorHeight: 20,
      disableLengthCheck: true,
      dropdownIcon: Icon(
        Icons.arrow_drop_down,
        color: ColorManager.primary,
      ),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        label: const Text(
          'phone number',
          style: TextStyle(
            fontFamily: 'Outfit',
            fontWeight: FontWeightManager.medium,
            fontSize: FontSize.s14,
          ),
        ),
        labelStyle: const TextStyle(
          color: Colors.black54,
          fontSize: FontSize.s14,
          fontWeight: FontWeightManager.medium,
        ),
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF097C7D),
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
    );
  }
}
