import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panorama/panorama.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

class Degrees360Screen extends StatelessWidget {
  final BuildContext context360;

  const Degrees360Screen({
    Key? key,
    required this.context360,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        leading: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context360).iconTheme.color,
          ),
        ),
        backgroundColor: Theme.of(context360).appBarTheme.backgroundColor,

        title: TextUtils(
          color: Theme.of(context360).textTheme.bodyLarge!.color,
          text: 'Degrees 360',
          fontWeight: FontWeightManager.regular,
          fontSize: FontSize.s20,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Panorama(
                child: Image.asset(
                  'assets/images/room.jpg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
