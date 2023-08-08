import 'package:animated_theme_switcher/animated_theme_switcher.dart';
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
    return ThemeSwitchingArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: IntlPhoneField(
          onChanged: (value) => function(value),
          validator: (value) => validator(value),
          dropdownTextStyle: const TextStyle(
            fontWeight: FontWeightManager.medium,
          ),
          initialCountryCode: 'SY',
          cursorColor: ColorManager.primary,
          style: TextStyle(
            height: MediaQuery.of(context).size.height * 0.0013,
          ),
          cursorHeight: 20,
          disableLengthCheck: true,
          dropdownIcon: Icon(
            Icons.arrow_drop_down,
            color: Theme.of(context).iconTheme.color,
          ),
          decoration:  InputDecoration(
            filled: true,
            label: const Text(
              'phone number',
            ),
            labelStyle: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium!.color,
              fontFamily: 'Outfit',
              fontSize: FontSize.s14,
              fontWeight: FontWeightManager.medium,
            ),
            // hintText:  'phone number',
            enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).iconTheme.color!,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
            ),
            focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).iconTheme.color!,
              ),
              borderRadius: const BorderRadius.all(
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
      ),
    );
  }
}
