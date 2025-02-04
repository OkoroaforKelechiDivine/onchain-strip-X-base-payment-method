import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/cores.dart';

class UserTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String status;

  const UserTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 5),
                AppText(
                  subtitle,
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  color: AppColors.grey,
                )
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText(
                status,
                fontSize: 14,
                color: status == "Active"
                    ? AppColors.invoiceStatus
                    : AppColors.transRed,
              )
            ],
          )
        ],
      ),
    );
  }
}
