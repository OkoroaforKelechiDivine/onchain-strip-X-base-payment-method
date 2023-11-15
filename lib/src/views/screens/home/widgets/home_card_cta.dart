import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app_config/manager/theme_manager.dart';
import '../../../../../core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/core/cores.dart';

class HomeCardCTA extends StatelessWidget {
  final void Function()? onPressed;
  final String asset;
  final String title;
  final Color? textColor;
  final double? fontSize;
  const HomeCardCTA(
      {super.key,
      this.onPressed,
      required this.asset,
      required this.title,
      this.textColor, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.deepWhite,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: IconButton(
            icon: Image.asset(asset),
            onPressed: onPressed ?? () {},
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: sans(
              color: textColor ?? Colors.white,
            fontSize: fontSize ?? 14.sp
          ),
        ),
      ],
    );
  }
}
