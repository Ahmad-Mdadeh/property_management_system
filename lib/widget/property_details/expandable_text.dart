import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

class ExpandableText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;

  ExpandableText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 14.0,
  });

  final RxBool _isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils(
          text: _isExpanded.value
              ? text
              : '${text.substring(0, 50)}...',
          color: color,
          fontWeight: fontWeight,
          fontSize:fontSize,
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
       Obx(() =>  GestureDetector(
         onTap: () {

           _isExpanded.value = !_isExpanded.value;

         },
         child: _isExpanded.value
             ? TextUtils(
           text: 'Read Less',
           color: ColorManager.primary,
           fontWeight: FontWeight.normal,
           fontSize: fontSize,
         )
             : TextUtils(
           text: 'Read More',
           color: ColorManager.primary,
           fontWeight: FontWeight.normal,
           fontSize: fontSize,
         ),
       ),),
      ],
    );
  }
}
