import 'package:flutter/material.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildElectricityProviderTextField extends StatefulWidget {
  const BuildElectricityProviderTextField({super.key});

  @override
  State<BuildElectricityProviderTextField> createState() =>
      _BuildElectricityProviderTextFieldState();
}

class _BuildElectricityProviderTextFieldState
    extends State<BuildElectricityProviderTextField> {
  TextEditingController electricityProviderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
        controller: electricityProviderController,
        decoration: InputDecoration(
          hintText: "Enter Meter Number",
          hintStyle: const TextStyle(
            color: AppColors.lightGrey,
            fontSize: AppFontSize.size14,
            fontWeight: AppFontWeight.light,
          ),
          filled: true,
          fillColor: AppColors.pureWhite,
          focusColor: AppColors.pureWhite,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
