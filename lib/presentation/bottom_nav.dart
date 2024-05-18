import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/utilities/permission.dart';
import 'package:stacked/stacked.dart';

import 'bottom_nav_vm.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => BottomNavViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 20.0,
            selectedFontSize: 14.0,
            unselectedFontSize: 14.0,
            enableFeedback: true,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedIconTheme: const IconThemeData(
              color: AppColors.lightGreen,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppAssets.home,
                  width: 24.w,
                  height: 24.h,
                  // color: currentRoute == navigationService.push(TransactionHistory()) ? AppColors.skyBlue : null,
                ),
                label: '',
                backgroundColor: AppColors.lightGrey,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppAssets.activity,
                  width: 24.w,
                  height: 24.h,
                  // color: currentRoute == navigationService.push(TransactionHistory()) ? AppColors.skyBlue : null,
                ),
                label: '',
                backgroundColor: AppColors.lightGrey,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppAssets.setting,
                  width: 24.w,
                  height: 24.h,
                  // color: currentRoute == navigationService.push(TransactionHistory()) ? AppColors.skyBlue : null,
                ),
                label: '',
                backgroundColor: AppColors.lightGrey,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppAssets.userProfile,
                  width: 24.w,
                  height: 24.h,
                  // color: currentRoute == navigationService.push(TransactionHistory()) ? AppColors.skyBlue : null,
                ),
                label: '',
                backgroundColor: AppColors.lightGrey,
              ),
            ],
            currentIndex: model.currentIndex,
            selectedItemColor: AppColors.lightGreen,
            onTap: model.updateIndex,
          ),
          body: model.children[model.currentIndex],
        );
      },
    );
  }
}
