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
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppText(
            title,
            color: AppColors.black,
            fontSize: 12,
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
          const Divider(
            color: AppColors.lightGrey,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
