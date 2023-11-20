import 'package:flutter/material.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildPhoneNumberTextField extends StatefulWidget {
  const BuildPhoneNumberTextField({super.key});

  @override
  State<BuildPhoneNumberTextField> createState() => _BuildPhoneNumberTextFieldState();
}

class _BuildPhoneNumberTextFieldState extends State<BuildPhoneNumberTextField> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGrey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          controller: phoneNumberController,
          decoration: InputDecoration(
            hintText: "Enter Phone number",
            hintStyle: const TextStyle(
                color: AppColors.lightGrey,
                fontSize: AppFontSize.size14,
                fontWeight: AppFontWeight.light),
            filled: true,
            fillColor: AppColors.pureWhite,
            focusColor: AppColors.pureWhite,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          keyboardType: TextInputType.number,
          maxLength: 11,
        ),
      ),
    );
  }
}
