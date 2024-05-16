import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/colors.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/widgets/app_text.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String profilePictureUrl;

  const ProfileAppBar({
    required this.userName,
    required this.profilePictureUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            SizedBox(
              height: 30.h,
              child: CircleAvatar(
                backgroundImage: AssetImage(profilePictureUrl),
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText('Hello ', fontSize: 16.sp),
                    AppText(userName, fontSize: 16.sp, fontWeight: AppFontWeight.bold),
                  ],
                ),
                AppText('Your finances are looking good', fontSize: 12.sp, color: AppColors.demonicGreen,),
              ],
            ),
            const Spacer(),
            Image.asset(AppAssets.notification)
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
