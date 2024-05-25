import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/widgets/app_bar.dart';
import 'package:pay_me_mobile/data/datasources/local/base/local_storage_service.dart';
import 'package:pay_me_mobile/presentation/auth/sign_in/sign_in_view.dart';
import 'package:pay_me_mobile/presentation/settings/components/settings_item.dart';
import 'package:pay_me_mobile/presentation/settings/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SettingViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const PaymeAppBar(
                    isBack: false,
                    title: "Settings",
                  ),
                  Center(
                    child: Image.asset(
                      AppAssets.userProfile,
                      height: 36.h,
                      width: 36.w,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Center(
                    child: AppText(
                      "Nduka John Mark",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Center(
                    child: AppText(
                      "T2",
                      fontSize: 14,
                      color: AppColors.profileLightGreen,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: AppRectangle(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      color: AppColors.profileLightGreen.withOpacity(0.2),
                      radius: 100,
                      child: const AppText(
                        "Upgrade",
                        fontSize: 12,
                        color: AppColors.profileLightGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AppText(
                      "General",
                      fontSize: 14,
                      color: AppColors.welcomeGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SettingsItem(
                    iconPath: AppAssets.resetPass,
                    title: "Reset Password",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SettingsItem(
                    iconPath: AppAssets.transactLimit,
                    title: "Set Transaction Limit",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SettingsItem(
                    iconPath: AppAssets.requePos,
                    title: "Request for POS Device",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SettingsItem(
                    iconPath: AppAssets.feedBack,
                    title: "Feedbacks",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SettingsItem(
                    iconPath: AppAssets.recommendIcon,
                    title: "Recommend this App",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SettingsItem(
                    iconPath: AppAssets.otherApp,
                    title: "Other Apps From Us",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SettingsItem(
                    iconPath: AppAssets.aboutPayme,
                    title: "PayMe",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AppText(
                      "Security",
                      fontSize: 14,
                      color: AppColors.welcomeGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SettingsItem(
                    iconPath: AppAssets.privacy,
                    title: "Privacy Policy",
                    subtitle: "Choose what data you share with us",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SettingsItem(
                    iconPath: AppAssets.loginPin,
                    title: "Reset Login Pin",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SettingsItem(
                    iconPath: AppAssets.transacPin,
                    title: "Reset Transaction Pin",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SettingsItem(
                    iconPath: AppAssets.logOut,
                    title: "Log Out",
                    textColor: Colors.red,
                    onTap: () async {
                      await LocalStorageService.clear();
                      navigationService.pushAndRemoveUntil(const SignInView());
                    },
                    logout: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
