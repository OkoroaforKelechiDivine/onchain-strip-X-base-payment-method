import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';

class InvoiceTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String status;

  const InvoiceTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
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
              AppAssets.receipt,
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
                "N ${formatBalance(double.parse(amount))}",
                fontSize: 16,
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
                color: const Color(0xFF4E5B70),
              ),
              const SizedBox(height: 5),
              AppText(
                status,
                fontSize: 12,
                color: AppColors.invoiceStatus,
              )
            ],
          )
        ],
      ),
    );
  }
}
