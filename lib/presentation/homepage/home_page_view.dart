import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/homepage/widget/carousel.dart';
import 'package:pay_me_mobile/presentation/homepage/widget/quick_action.dart';
import 'package:pay_me_mobile/presentation/homepage/widget/service.dart';
import 'package:pay_me_mobile/presentation/homepage/widget/transaction_history.dart';
import 'package:stacked/stacked.dart';

import 'home_page_view_model.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomePageViewModel(),
      builder: (context, model, child) {
        String userName = model.getUserName();
        String userProfilePicture = model.getUserProfilePicture();
        List<Widget> indicators = List.generate(
          2,
          (index) => Container(
            width: 5,
            height: 5,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: model.currentCarouselIndex == index
                  ? AppColors.deepGreen
                  : AppColors.grey,
            ),
          ),
        );
        return Scaffold(
          backgroundColor: AppColors.scaffoldBg,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30.h,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(userProfilePicture),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppText(
                                  'Hello ',
                                  fontSize: 16.sp,
                                  color: AppColors.black,
                                ),
                                AppText(userName,
                                    fontSize: 16.sp,
                                    color: AppColors.black,
                                    fontWeight: AppFontWeight.bold),
                              ],
                            ),
                            AppText(
                              'Your finances are looking good',
                              fontSize: 12.sp,
                              color: AppColors.demonicGreen,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Image.asset(AppAssets.notification)
                      ],
                    ),
                  ),
                  CarouselWidget(
                    currentIndex: model.currentCarouselIndex,
                    onPageChanged: (index, reason) {
                      model.setCarouselIndex(index);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: indicators,
                  ),
                  SizedBox(height: 10.h),
                  const QuickActions(),
                  SizedBox(height: 30.h),
                  const ServiceSection(),
                  SizedBox(height: 30.h),
                  const TransactionHistory(),
                ],
              ),
            ),
          ),
          // bottomNavigationBar: const BottomNavigationBarBuilder(),
        );
      },
    );
  }
}
