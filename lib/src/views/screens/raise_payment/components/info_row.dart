import 'package:flutter/cupertino.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';

class BuildInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const BuildInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label ',
          style: const TextStyle(
            fontSize: AppFontSize.size16,
            fontWeight: AppFontWeight.bold,
            color: AppColors.lightBlack,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.lightBlack,
            fontWeight: AppFontWeight.light,
            fontSize: AppFontSize.size16,
          ),
        )
      ],
    );
  }
}
