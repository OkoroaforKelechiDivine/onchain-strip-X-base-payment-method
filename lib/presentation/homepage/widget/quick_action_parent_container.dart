import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/cores.dart';

import '../../../core/constants/font_weights.dart';

class QuickActionParentContainer extends StatelessWidget {
  final Widget child;
  final String text;

  const QuickActionParentContainer(
      {Key? key, required this.child, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 68.h,
        width: 68.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              child,
              SizedBox(height: 8.h),
              AppText(
                text,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
                alignment: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
