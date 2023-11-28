import 'package:flutter/cupertino.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';

class BuildInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const BuildInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label:",
          style: const TextStyle(
            fontSize: AppFontSize.size16,
            fontWeight: AppFontWeight.bold,
            color: AppColors.lightBlack,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.lightBlack,
                  fontWeight: AppFontWeight.light,
                  fontSize: AppFontSize.size16,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
