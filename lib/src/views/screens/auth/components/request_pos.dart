import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/src/views/screens/request_pos_account/request_pos_account.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';

class BuildRequestForPOS extends StatelessWidget {
  const BuildRequestForPOS({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigationService.push(const RequestPOSOrAccountView());
      },
      child: Center(
        child: Text(
          "Doesn't have an account? Register",
          style: GoogleFonts.alegreyaSans(
            textStyle: const TextStyle(
              color: AppColors.lightGrey,
              fontSize: AppFontSize.size18,
              fontWeight: AppFontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
