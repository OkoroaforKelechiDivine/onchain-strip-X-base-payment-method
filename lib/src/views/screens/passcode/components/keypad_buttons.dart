import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';

class BuildKeyPadButtons extends StatelessWidget {
  final Function(String) onButtonPressed;
  final List<String> enteredDigits;

  const BuildKeyPadButtons({
    Key? key,
    required this.onButtonPressed,
    required this.enteredDigits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      shrinkWrap: true,
      itemCount: 12,
      itemBuilder: (BuildContext context, int index) {
        final buttonText = [
          '1', '2', '3',
          '4', '5', '6',
          '7', '8', '9',
          'Sign out', '0', 'Delete',
        ][index];
        final isDeleteButtonDisabled = buttonText == 'Delete' && enteredDigits.isEmpty;
        return MaterialButton(
          onPressed: () {
            if (buttonText == 'Sign out') {
            } else if (!isDeleteButtonDisabled) {
              onButtonPressed(buttonText);
            }
          },
          child: isDeleteButtonDisabled ? Text(
            buttonText,
            style: TextStyle(
              fontSize: AppFontSize.size20,
              fontWeight: AppFontWeight.bold,
              fontFamily: GoogleFonts.alegreyaSans().fontFamily,
              color: AppColors.deepWhite,
            ),
            textAlign: TextAlign.center,
          ) : (buttonText == 'Sign out' || buttonText == 'Delete') ? OverflowBox(
            maxWidth: 100, alignment: Alignment.center,
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: AppFontSize.size20,
                fontWeight: buttonText == 'Sign out' ? AppFontWeight.bold : AppFontWeight.bold,
                fontFamily: GoogleFonts.alegreyaSans().fontFamily,
                color: buttonText == 'Sign out' ? AppColors.lightGreen : AppColors.lightBlack,
              ),
              textAlign: TextAlign.center,
            ),
          ) : Text(
            buttonText,
            style: TextStyle(
              fontSize: AppFontSize.size30,
              fontWeight: AppFontWeight.bold,
              fontFamily: GoogleFonts.alegreyaSans().fontFamily,
            ),
          ),
        );
      },
    );
  }
}