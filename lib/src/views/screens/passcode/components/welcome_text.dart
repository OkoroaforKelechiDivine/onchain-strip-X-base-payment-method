import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';

class BuildWelcomeText extends StatelessWidget {
  const BuildWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        children: [
          Text(
            "Welcome Back",
            style: TextStyle(
              fontSize: AppFontSize.size22,
              color: AppColors.lightBlack,
              fontFamily: GoogleFonts.alegreyaSans().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
