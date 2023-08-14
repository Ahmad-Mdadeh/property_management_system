import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_management_system/modules/profile/profile_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

class ProfileImagePicker extends StatelessWidget {
  ProfileImagePicker({Key? key}) : super(key: key);
  final _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4.5,
      child: Stack(
        children: [
          Positioned(
              top: 32,
              left: 119,
              child: Container(
                width: 127,
                height: 127,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).iconTheme.color!,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
              )),
          Obx(
            () {
              if (_profileController.isLoading.value) {
                return Positioned(
                  top: 41,
                  left: 128,
                  child: CircleAvatar(
                    radius: 55.0,
                    backgroundImage: NetworkImage(
                      _profileController.networkImage.value,
                    ),
                  ),
                );
              } else {
                return Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  right: MediaQuery.of(context).size.height * 0.21,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).iconTheme.color,
                  ),
                );
              }
            },
          ),
          Positioned(
            top: 120,
            left: 215,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).iconTheme.color!,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {
                  Get.dialog(
                    Dialog(
                      backgroundColor:
                          Theme.of(context).appBarTheme.backgroundColor,
                      insetAnimationCurve: Curves.slowMiddle,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          TextUtils(
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color!,
                            text: 'Choose picture from :',
                            fontWeight: FontWeightManager.bold,
                            fontSize: FontSize.s20,
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Theme.of(context).iconTheme.color,
                              ),
                              child: ListTile(
                                leading: Icon(
                                  Icons.image,
                                  color: ColorManager.white,
                                ),
                                title: Text(
                                  'Gallery',
                                  style: TextStyle(
                                    color: ColorManager.white,
                                  ),
                                ),
                                onTap: () {
                                  _profileController
                                      .getImage(ImageSource.gallery);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Theme.of(context).iconTheme.color,
                              ),
                              child: ListTile(
                                leading: Icon(
                                  Icons.camera,
                                  color: ColorManager.white,
                                ),
                                title: Text(
                                  'Camera',
                                  style: TextStyle(
                                    color: ColorManager.white,
                                  ),
                                ),
                                onTap: () {
                                  _profileController
                                      .getImage(ImageSource.camera);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.edit_outlined,
                  color: ColorManager.white,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
