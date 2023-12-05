import 'package:flutter/material.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';

class BuildTvProviderTextField extends StatefulWidget {
  const BuildTvProviderTextField({super.key});

  @override
  State<BuildTvProviderTextField> createState() =>
      _BuildTvProviderTextFieldState();
}

class _BuildTvProviderTextFieldState extends State<BuildTvProviderTextField> {
  TextEditingController cableTvProviderController = TextEditingController();

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
        controller: cableTvProviderController,
        decoration: InputDecoration(
          hintText: "Enter Decoder Number",
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
