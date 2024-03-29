import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:property_management_system/modules/base/base_controller.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/widget/navigation/rive_utils.dart';
import 'package:rive/rive.dart';

class CustomAnimatedBottomBar extends StatelessWidget {
  CustomAnimatedBottomBar({super.key});

  final baseController = Get.put(BaseController());
  final settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    StateMachineController? stateMachineController;
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        border: settingController.isLightMode.value
            ? Border.all(
                color: Theme.of(context).colorScheme.primaryContainer,
              )
            : null,
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            8,
          ),
          topRight: Radius.circular(
            8,
          ),
        ),
      ),
      padding: const EdgeInsets.all(
        12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
            bottomNav.length,
            (index) => InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                baseController.selectedIndex.value = index;
                select.value = bottomNav[index];
                bottomNav[index].input?.change(true);
                await Future.delayed(
                  const Duration(seconds: 1),
                );
                bottomNav[index].input?.change(false);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.height * 0.055,
                    child: Obx(
                      () => Opacity(
                        opacity: bottomNav[index] == select.value ? 1 : 0.35,
                        child: RiveAnimation.asset(
                          "assets/rive/animated_icon.riv",
                          artboard: bottomNav[index].artBoard,
                          stateMachines: [bottomNav[index].stateMachineName],
                          onInit: (p0) {
                            stateMachineController =
                                StateMachineController.fromArtboard(
                              p0,
                              bottomNav[index].stateMachineName,
                            );
                            if (stateMachineController == null) {
                              return;
                            } else {
                              p0.addController(stateMachineController!);
                              bottomNav[index].input = stateMachineController
                                  ?.findSMI("active") as SMIBool;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Obx(
                    () => Opacity(
                      opacity: bottomNav[index] == select.value ? 1 : 0.35,
                      child: TextUtils(
                        text: nameIcon[index].tr,
                        color: const Color(
                          0XFF2DC8C8,
                        ),
                        fontWeight: FontWeightManager.regular,
                        fontSize: 9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
