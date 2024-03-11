import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';

class BusinessInfoRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const BusinessInfoRow(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            title,
            color: AppColors.black,
            fontSize: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: AppText(
                    subtitle, // "gggggggggggggggggggbjhgguj hbiugjyh",
                    color: AppColors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
