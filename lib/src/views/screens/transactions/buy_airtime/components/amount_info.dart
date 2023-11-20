import 'package:flutter/cupertino.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildAmountInfo extends StatelessWidget {
  const BuildAmountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Amount',
            style: TextStyle(
              fontSize: AppFontSize.size16,
              color: AppColors.lightBlack,
              fontWeight: AppFontWeight.bold,
            ),
          ),
          Text(
            'Balance: NGN7,361.87',
            style: TextStyle(
              fontSize: AppFontSize.size16,
              color: AppColors.lightBlack,
              fontWeight: AppFontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
