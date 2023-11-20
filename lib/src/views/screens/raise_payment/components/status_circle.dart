import 'package:flutter/cupertino.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';

class BuildStatusCircle extends StatelessWidget {
  final String status;

  const BuildStatusCircle({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color circleColor = AppColors.brightGreen;

    if (status == 'Declined') {
      circleColor = AppColors.errorRed;
    } else if (status == 'Pending') {
      circleColor = AppColors.dullOrange;
    }
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: circleColor,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          status,
          style: TextStyle(
            fontSize: AppFontSize.size12,
            color: circleColor,
            fontWeight: AppFontWeight.bold,
          ),
        ),
      ],
    );
  }
}
