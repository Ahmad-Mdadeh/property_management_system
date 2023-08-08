import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/text_manager.dart';
import '../../resources/values_manager.dart';

class FilterButton extends StatelessWidget {
  final IconData icon;
  final String type;
  final bool isSelected;
  final Function onTap;

  const FilterButton({super.key,
    required this.icon,
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        enableFeedback: false,
        onTap: () => onTap,
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 21,
          decoration: BoxDecoration(
            color: isSelected ? ColorManager.primary : ColorManager.darkPrimary,
            borderRadius: BorderRadius.circular(
              15.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: AppSize.s22,
                color: isSelected
                    ? ColorManager.darkPrimary
                    : ColorManager.primary,
              ),
              const SizedBox(
                width: 5.0,
              ),
              TextUtils(
                text: type,
                color:
                    isSelected ? ColorManager.darkPrimary : ColorManager.white,
                fontWeight: FontWeightManager.light,
                fontSize: FontSize.s16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
