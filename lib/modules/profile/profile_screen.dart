import 'package:flutter/material.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/profile/profile_elevated_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextUtils(
          text: "My Profile",
          color: ColorManager.white,
          fontWeight: FontWeightManager.semiBold,
          fontSize: FontSize.s18,
        ),
        backgroundColor: ColorManager.lightPrimary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(
              AppSize.s24,
            ),
            bottomLeft: Radius.circular(
              AppSize.s24,
            ),
          ),
        ),
      ),
      backgroundColor: ColorManager.dark,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Container(
                padding: const EdgeInsets.only(
                  top: AppPadding.p20,
                  left: AppPadding.p20,
                  right: AppPadding.p12,
                ),
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.16,
                decoration: BoxDecoration(
                  color: ColorManager.lightPrimary,
                  borderRadius: BorderRadius.circular(
                    AppSize.s18,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppPadding.p20,
                        right: AppPadding.p12,
                      ),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(
                              ImagesAssets.photo,
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppSize.s20,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextUtils(
                          text: "Ahmad Mdadeh",
                          color: ColorManager.white,
                          fontWeight: FontWeightManager.bold,
                          fontSize: FontSize.s18,
                        ),
                        const SizedBox(
                          height: AppSize.s8,
                        ),
                        TextUtils(
                          text: "ahmad@gmail.com",
                          color: ColorManager.white,
                          fontWeight: FontWeightManager.semiBold,
                          fontSize: FontSize.s12,
                        ),
                        const SizedBox(
                          height: AppSize.s8,
                        ),
                        ProfileButton(
                          borderRadius: 6,
                          color: ColorManager.black,
                          text: "Edit Profile",
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.074,
                          function: () {},
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppPadding.p24,
                      ),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorManager.grey1,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            7.0,
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: ColorManager.ofWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Container(
                padding: const EdgeInsets.only(
                  top: AppPadding.p20,
                ),
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.width * 3,
                decoration: BoxDecoration(
                  color: ColorManager.lightPrimary,
                  borderRadius: BorderRadius.circular(
                    AppSize.s18,
                  ),
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Divider(
                        color: ColorManager.grey1,
                        thickness: 0.5,
                      ),
                    ),
                  ),
                  itemCount: 13,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppPadding.p20,
                          right: AppPadding.p20,
                        ),
                        child: Container(
                          width: 45,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xff293d44),
                            image: const DecorationImage(
                              image: AssetImage(
                                ImagesAssets.searching,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(
                              AppSize.s8,
                            ),
                          ),
                        ),
                      ),
                      TextUtils(
                        text: "My Enquiry",
                        color: ColorManager.white,
                        fontWeight: FontWeightManager.medium,
                        fontSize: FontSize.s15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppPadding.p100,
                        ),
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorManager.grey1,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(
                              7.0,
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: ColorManager.ofWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
