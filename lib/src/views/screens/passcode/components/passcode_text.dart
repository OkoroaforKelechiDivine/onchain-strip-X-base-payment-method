import 'package:flutter/cupertino.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';

class BuildPasscodeText extends StatelessWidget {
  const BuildPasscodeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Enter Passcode",
      style: TextStyle(
        fontSize: AppFontSize.size18,
        color: AppColors.lightGrey,
        fontWeight: AppFontWeight.light,
      ),
    );
  }
}
