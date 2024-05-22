import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/font_weights.dart';
import '../../../core/widgets/app_text.dart';

class SentMessageBuilder {
  Widget buildSentMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 64, bottom: 8),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.deepGreen,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText("N350,000", color: AppColors.white, fontWeight: AppFontWeight.bold),
                    AppText("Top up", fontSize: 14.sp, color: AppColors.white),
                  ],
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText("13/04/2024", color: AppColors.transparent, fontSize: 12.sp),
                      AppText("1:45pm", color: AppColors.transparent, fontSize: 12.sp)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}