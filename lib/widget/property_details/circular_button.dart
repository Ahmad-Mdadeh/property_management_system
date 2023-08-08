import 'package:flutter/material.dart';
import 'package:property_management_system/resources/values_manager.dart';

GestureDetector circularButton({required IconData icon, required double size ,required Color  color,required Color  colorIcon,}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      decoration: BoxDecoration(
          color: color, shape: BoxShape.circle),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p6),
        child: Icon(
          icon,
          color: colorIcon,
          size: size,
        ),
      ),
    ),
  );
}
