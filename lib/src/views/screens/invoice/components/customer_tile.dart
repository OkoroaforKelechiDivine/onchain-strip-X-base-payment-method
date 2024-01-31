import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';

import '../../../../../core/cores.dart';

class CustomerTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomerTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.invoiceIconBg,
              borderRadius: BorderRadius.circular(100),
            ),
            child: SvgPicture.asset(
              AppAssets.customer,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
              const SizedBox(height: 5),
              AppText(
                subtitle,
                fontSize: 12,
                color: AppColors.grey,
              )
            ],
          ),
        ],
      ),
    );
  }
}
