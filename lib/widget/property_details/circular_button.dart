import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/property_detail/degrees360.dart';
import 'package:property_management_system/resources/values_manager.dart';

class CircularDegrees360Button extends StatelessWidget {
  final BuildContext context;
  final Color color;
  final Color colorIcon;
  final IconData icon;
  final double size;

  const CircularDegrees360Button({
    Key? key,
    required this.color,
    required this.colorIcon,
    required this.icon,
    required this.size,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () =>  Degrees360Screen(context360: context),
        );
      },
      child: Container(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
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
}
