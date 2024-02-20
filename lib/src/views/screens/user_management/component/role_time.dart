import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';

import '../../../../../core/cores.dart';

class RoleTile extends StatelessWidget {
  final String title;

  const RoleTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
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
          AppText(
            title,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }
}
