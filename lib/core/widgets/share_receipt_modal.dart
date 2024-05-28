import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/colors.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';

import '../cores.dart';

class ShareReceiptModal extends StatelessWidget {
  final String title;
  final Function() onShareImage;
  final Function() onSharePDF;

  const ShareReceiptModal(
      {super.key,
      required this.title,
      required this.onShareImage,
      required this.onSharePDF});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      //height: 200.h,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 4,
                width: 45.w,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: AppText(
              title,
              color: AppColors.deepGreen,
              fontWeight: AppFontWeight.extraBold,
              fontSize: 14.sp,
            )),
            ListTile(
                contentPadding: const EdgeInsets.only(top: 20),
                title: Center(
                    child: AppText(
                  "Share as Image",
                  fontSize: 14.sp,
                  color: AppColors.grey,
                  fontWeight: AppFontWeight.extraBold,
                )),
                onTap: onShareImage),
            ListTile(
              title: Center(
                  child: AppText(
                "Share as PDF",
                fontSize: 14.sp,
                color: AppColors.grey,
                fontWeight: AppFontWeight.extraBold,
              )),
              onTap: onSharePDF,
            ),
          ],
        ),
      ),
    );
  }
}
