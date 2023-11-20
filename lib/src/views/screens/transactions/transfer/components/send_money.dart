import 'package:flutter/cupertino.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../custom/custom_underline.dart';

class BuildSendMoneySection extends StatelessWidget {
  const BuildSendMoneySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CustomUnderlinedText(
            text: "Send Money",
            textStyle: TextStyle(
              fontSize: AppFontSize.size22,
              fontWeight: AppFontWeight.bold,
              color: AppColors.lightGreen,
            ),
          ),
        ),
      ],
    );
  }
}
