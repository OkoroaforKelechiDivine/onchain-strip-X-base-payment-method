import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/font_weights.dart';
import '../../../core/widgets/app_text.dart';

class ReceivedMessageBuilder {
  Widget buildReceivedMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 64, bottom: 8),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.dirtyTransparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 12),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const AppText("N350,000", color: AppColors.lightYellow, fontWeight: AppFontWeight.bold),
                        AppText("Opay/JADESOLA AGBANIDAREGO/Top up", fontSize: 14.sp),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText("13/04/2024", color: AppColors.transparentDeep, fontSize: 12.sp),
                          AppText("1:45pm",  color: AppColors.transparentDeep, fontSize: 12.sp)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}