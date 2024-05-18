import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/homepage/widget/dashed_border_container.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int, CarouselPageChangedReason) onPageChanged;

  const CarouselWidget({
    Key? key,
    required this.currentIndex,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: true,
          enableInfiniteScroll: true,
          viewportFraction: 1,
          onPageChanged: onPageChanged,
        ),
        items: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.deepGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppText(
                      'Account Balance',
                      fontSize: 12.sp,
                      color: AppColors.demonicGreen,
                    ),
                    const Spacer(),
                    Image.asset(AppAssets.eye),
                  ],
                ),
                AppText(
                  '₦ 24,607,034.02',
                  color: AppColors.white,
                  fontSize: 32.sp,
                  fontWeight: AppFontWeight.bold,
                  fontFamily: GoogleFonts.inter().fontFamily,
                ),
                //SizedBox(height: 3.h),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.transparent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: AppText(
                      "A/C no: 0625806532",
                      color: AppColors.white,
                    ),
                  ),
                ),
                Spacer(),
                //SizedBox(height: 10.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'Account Name',
                      fontSize: 12.sp,
                      color: AppColors.demonicGreen,
                    ),
                    AppText(
                      'Okoroafor Oladipupo Alex',
                      fontSize: 12.sp,
                      color: AppColors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          DashedBorderContainer(
            strokeWidth: 2,
            dashWidth: 5,
            backgroundColor: AppColors.skyGreen,
            dashGap: 5,
            child: Center(
              child: Container(
                height: 100.h,
                width: 130.w,
                decoration: BoxDecoration(
                    color: AppColors.transparentDeep,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.add),
                      SizedBox(height: 10.h),
                      AppText(
                        'Create a Sub',
                        color: AppColors.deepGreen,
                        fontSize: 16.sp,
                        fontWeight: AppFontWeight.bold,
                      ),
                      AppText(
                        "Account",
                        color: AppColors.deepGreen,
                        fontSize: 16.sp,
                        fontWeight: AppFontWeight.bold,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
