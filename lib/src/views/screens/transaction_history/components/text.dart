import 'package:flutter/cupertino.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';

class BuildTodayText extends StatelessWidget {
  const BuildTodayText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10, left: 30),
      child: Center(
        child: Text(
          'Today',
          style: TextStyle(
            color: AppColors.lightBlack,
            fontWeight: AppFontWeight.bold,
            fontSize: AppFontSize.size16,
          ),
        ),
      ),
    );
  }
}
