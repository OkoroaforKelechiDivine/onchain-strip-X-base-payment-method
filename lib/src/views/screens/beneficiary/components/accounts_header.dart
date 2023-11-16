import 'package:flutter/cupertino.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';

class BuildNGNAccountsHeader extends StatelessWidget {
  const BuildNGNAccountsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        color: AppColors.pureWhite,
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "NGN Accounts",
            style: TextStyle(
              color: AppColors.lightBlack,
              fontWeight: AppFontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
