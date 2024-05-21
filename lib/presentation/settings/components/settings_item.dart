import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/widgets/app_text.dart';

class SettingsItem extends StatelessWidget {
  final String iconPath;
  final Color? textColor;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final bool? logout;

  const SettingsItem({
    Key? key,
    this.textColor,
    required this.title,
    this.subtitle,
    required this.onTap,
    required this.iconPath,
    this.logout = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 27.h,
              width: 27.w,
            ),
            const SizedBox(width: 22),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title,
                    color: textColor ?? AppColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                  if (subtitle != null)
                    AppText(
                      subtitle!,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.welcomeGrey,
                    ),
                ],
              ),
            ),
            if (!logout!)
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.black,
              ),
          ],
        ),
      ),
    );
  }
}
