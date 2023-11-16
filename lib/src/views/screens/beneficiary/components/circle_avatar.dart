import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';

import '../../../../../app_config/manager/font_manager.dart';

class BuildCircleAvatar extends StatelessWidget {
  final Color circleColor;
  final String accountName;

  const BuildCircleAvatar({
    Key? key,
    required this.circleColor,
    required this.accountName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: circleColor,
        ),
        child: Center(
          child: Text(
            accountName.isNotEmpty ? accountName[0].toUpperCase() : '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppFontSize.size20,
              color: AppColors.pureWhite,
            ),
          ),
        ),
      ),
    );
  }
}
