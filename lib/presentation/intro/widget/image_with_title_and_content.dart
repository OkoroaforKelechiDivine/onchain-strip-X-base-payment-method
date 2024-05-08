import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/font_weights.dart';

class ImageWithTitleAndContent extends StatelessWidget {
  final String image;
  final String title;
  final String content;

  const ImageWithTitleAndContent({
    Key? key,
    required this.image,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 300.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white.withOpacity(0.8),
                  Colors.white.withOpacity(0.7),
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.4),
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.2),
                ], // White to transparent
              ),
              color: AppColors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: AppFontWeight.bold,
                    color: AppColors.deepGreen,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.h),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.deepGreen,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 70.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
