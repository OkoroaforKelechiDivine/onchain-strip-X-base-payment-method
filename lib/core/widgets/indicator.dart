import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/cores.dart';

class CircleIndicator extends StatelessWidget {
  final String number;
  final String text;
  final Color? circleColor;
  final Color? textColor;
  final bool boldText;

  const CircleIndicator({
    Key? key,
    required this.number,
    required this.text,
    this.circleColor,
    this.textColor,
    this.boldText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> splitText = text.split(' ');
    String firstPart = splitText[0];
    String secondPart = splitText.sublist(1).join(' ');
    bool showImage = circleColor != null && circleColor != AppColors.grey;
    Color borderColor = circleColor ?? AppColors.grey;
    Color numberColor = showImage ? Colors.transparent : (textColor ?? AppColors.black);

    return Column(
      children: [
        Container(
          width: 20.h,
          height: 20.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: circleColor ?? Colors.transparent,
            border: Border.all(
              color: borderColor,
            ),
          ),
          alignment: Alignment.center,
          child: showImage ? Image.asset(
            AppAssets.check ?? '',
            width: 10.h,
            height: 10.w,
            fit: BoxFit.cover,
          ) : AppText(
            number,
            color: numberColor,
            fontSize: 10.sp,
            fontWeight: boldText ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        SizedBox(height: 2.h),
        Column(
          children: [
            AppText(
              firstPart,
              color: textColor ?? AppColors.indicatorTextColor,
              fontSize: 10.sp,
              fontWeight: boldText ? FontWeight.bold : FontWeight.normal,
            ),
            AppText(
              secondPart,
              color: textColor ?? AppColors.indicatorTextColor,
              fontSize: 10.sp,
              fontWeight: boldText ? FontWeight.bold : FontWeight.normal,
            ),
          ],
        ),
      ],
    );
  }
}

class Underline extends StatelessWidget {
  final Color? color;

  const Underline({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: SizedBox(
          height: 2.h,
          width: 50.w,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(
                  color: color ?? AppColors.grey,
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
