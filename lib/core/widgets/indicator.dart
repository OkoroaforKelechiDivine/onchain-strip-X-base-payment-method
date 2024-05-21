import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/cores.dart';

class CircleIndicator extends StatelessWidget {
  final String number;
  final String text;

  const CircleIndicator({
    Key? key,
    required this.number,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> splitText = text.split(' ');
    String firstPart = splitText[0];
    String secondPart = splitText.sublist(1).join(' ');

    return Column(
      children: [
        Container(
          width: 20.h,
          height: 20.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: AppText(
            number,
            color: AppColors.black,
            fontSize: 10.sp,
          ),
        ),
        SizedBox(height: 2.h),
        Column(
          children: [
            AppText(
              firstPart,
              color: AppColors.indicatorTextColor,
              fontSize: 10.sp,
            ),
            AppText(
              secondPart,
              color: AppColors.indicatorTextColor,
              fontSize: 10.sp,
            ),
          ],
        ),
      ],
    );
  }
}

class Underline extends StatelessWidget {
  const Underline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: SizedBox(
          height: 2.h,
          width: 50.w,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(
                  color: AppColors.grey,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
