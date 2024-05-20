import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import '../constants/colors.dart';

class BottomNavigationBarBuilder extends StatelessWidget {
  const BottomNavigationBarBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)!.settings.name;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: 0,
              selectedItemColor: AppColors.deepGreen,
              unselectedItemColor: AppColors.white,
              backgroundColor: AppColors.white,
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
              // onTap: (int index) {
              //   switch (index) {
              //     case 0:
              //       Navigator.pushNamed(context, '/popular_screen');
              //       break;
              //     case 1:
              //       Navigator.pushNamed(context, '/sign_up');
              //       break;
              //     case 2:
              //       Navigator.pushNamed(context, '/home');
              //       break;
              //     case 3:
              //       Navigator.pushNamed(context, '/settings');
              //       break;
              //   }
              // },
            ),
          ),
        ),
      ),
    );
  }
}
