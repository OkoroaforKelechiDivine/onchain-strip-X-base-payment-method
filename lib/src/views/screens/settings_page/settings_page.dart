import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/utilities/general_util.dart';
import 'package:pay_me_mobile/data/datasources/local/base/local_storage_service.dart';
import 'package:pay_me_mobile/src/views/screens/auth/login_screen.dart';
import 'package:pay_me_mobile/src/views/screens/request_pos_account/request_pos_account.dart';
import 'package:pay_me_mobile/src/views/screens/settings_page/change_password/change_password.dart';
import 'package:pay_me_mobile/src/views/screens/settings_page/set_transaction_pin/set_transaction_pin_page.dart';
import 'package:pay_me_mobile/src/views/screens/settings_page/settings_viewmodel.dart';
import 'package:pay_me_mobile/src/views/screens/settings_page/update_passcode/update_passcode_page.dart';
import 'package:pay_me_mobile/src/views/screens/settings_page/update_transaction_pin/update_transaction_pin_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/cores.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) {
        final user = appGlobals.user!;
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: const AppText('Settings'),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                //const SizedBox(height: 28.0),
                // UserIcon.image(
                //   url:
                //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPfO37MK81JIyR1ptwqr_vYO3w4VR-iC2wqQ&usqp=CAU',
                //   height: 150,
                //   width: 150,
                // ),
                // const UserAvatar(
                //   url:
                //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPfO37MK81JIyR1ptwqr_vYO3w4VR-iC2wqQ&usqp=CAU',
                //   height: 150,
                //   width: 150,
                // ),
                const SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.grey.withOpacity(.2),
                  ),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: Column(
                    children: [
                      singleItem(
                        icon: Icons.person,
                        text: '${user.firstName} ${user.lastName}',
                        onTap: () {},
                      ),
                      singleItem(
                        icon: Icons.business,
                        text: '${user.business}',
                        onTap: () async {},
                      ),
                      singleItem(
                        icon: Icons.emergency,
                        text: 'Set Transaction Limit',
                        onTap: () async {},
                      ),
                      singleItem(
                        icon: Icons.payment,
                        text: appGlobals.user!.isTransactionPinSet ?? false
                            ? 'Change Transaction pin'
                            : "Set Transaction pin",
                        onTap: () async {
                          final isSetTransactionPin =
                              appGlobals.user!.isTransactionPinSet ?? false;
                          if (isSetTransactionPin) {
                            navigationService
                                .push(const UpdateTransactionPinPage());
                          } else {
                            navigationService
                                .push(const SetTransactionPinPage());
                          }
                        },
                      ),
                      singleItem(
                        icon: Icons.password,
                        text: 'Change Password',
                        onTap: () async {
                          navigationService.push(const ChangePasswordScreen());
                        },
                      ),
                      singleItem(
                        icon: Icons.pin,
                        text: 'Change Passcode',
                        onTap: () async {
                          navigationService.push(const UpdatePasscodePage());
                        },
                      ),
                      singleItem(
                        icon: Icons.device_hub,
                        text: 'Request for POS Device',
                        onTap: () async {
                          navigationService
                              .push(const RequestPOSOrAccountView());
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.grey.withOpacity(.2),
                  ),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: Column(
                    children: [
                      singleItem(
                        icon: Icons.star,
                        text: 'Recommend this app',
                        onTap: () {
                          Share.share(
                              'Check out PayMe on Playstore https://play.google.com/store/apps/details?id=com.systemShift.pay_me_mobile');
                        },
                      ),
                      singleItem(
                        icon: Icons.chat,
                        text: 'Feedbacks',
                        subtitle: 'Report bugs, feedback or suggestion',
                        onTap: () async {
                          launchUrlStart(
                              url:
                                  "mailto:tech@systemshift.africa?subject=Reporting%Bug&body=Hi%SystemShift");
                        },
                      ),
                      singleItem(
                        icon: Icons.star,
                        text: 'Rate this app',
                        subtitle: '5 star would mean a lot :)',
                        onTap: () {
                          launchUrlStart(
                              url:
                                  "https://play.google.com/store/apps/details?id=com.systemShift.pay_me_mobile");
                        },
                      ),
                      singleItem(
                        icon: Icons.play_arrow,
                        text: 'Other apps from us',
                        onTap: () async {
                          launchUrlStart(
                              url:
                                  "https://play.google.com/store/apps/developer?id=kxSplash");
                        },
                      ),
                      singleItem(
                        icon: CupertinoIcons.lock_shield_fill,
                        text: 'Privacy Policy',
                        onTap: () {
                          launchUrlStart(
                              url:
                                  "https://systemshift.africa/privacy-policy/");
                        },
                      ),
                      singleItem(
                        icon: Icons.logout,
                        text: 'Log Out',
                        onTap: () async {
                          await LocalStorageService.clear();
                          navigationService
                              .pushAndRemoveUntil(const LoginScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget singleItem(
    {required IconData icon,
    required String text,
    String? subtitle,
    required Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.grey.withOpacity(.2)),
            padding: const EdgeInsets.all(8),
            child: Icon(
              icon,
              color: AppColors.lightGreen,
            ),
          ),
          const SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text,
                fontSize: 18,
                color: AppColors.black,
              ),
              Visibility(
                visible: subtitle != null,
                child: AppText(
                  subtitle ?? '',
                  fontSize: 16,
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
