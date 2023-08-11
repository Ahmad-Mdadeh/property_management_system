import 'package:flutter/material.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

class BuildPropertyRate extends StatelessWidget {
  final IconData icon;
  final String name;
  final String rate;
  final BuildContext context;

  const BuildPropertyRate(
      {required this.name,
      required this.icon,
      required this.context,
      required this.rate,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              height: AppSize.s40,
              width: AppSize.s40,
              child: Icon(
                icon,
                color: Theme.of(context).iconTheme.color,
              ),
            )),
        const SizedBox(
          width: AppSize.s12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtils(
                text: name,
                color: Theme.of(context).textTheme.bodyMedium!.color,
                fontWeight: FontWeightManager.regular,
                fontSize: FontSize.s14),
            TextUtils(
              text: rate,
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontWeight: FontWeightManager.regular,
              fontSize: FontSize.s16,
            ),
          ],
        )
      ],
    );
  }
}
