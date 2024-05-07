import 'package:flutter/cupertino.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(image),
        Text(
          title,
          style: TextStyle(
              fontSize: 30.sp,
              fontWeight: AppFontWeight.bold,
              color: AppColors.deepGreen
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5.h),
        Text(
          content,
          style: TextStyle(
              fontSize: 15.sp,
              color: AppColors.deepGreen
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
