import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/transfer/transfer_viewmodel.dart';

import '../constants/font_weights.dart';

class AppToggleButtons extends StatelessWidget {
  final TransferOption selectedOption;
  final Function(TransferOption) onOptionSelected;
  final String firstText;
  final String secondText;

  const AppToggleButtons({
    Key? key,
    required this.selectedOption,
    required this.onOptionSelected,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () => onOptionSelected(TransferOption.NEW),
          child: Container(
            decoration: BoxDecoration(
              color: selectedOption == TransferOption.NEW ? AppColors.deepGreen : AppColors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: selectedOption == TransferOption.NEW ? AppColors.deepGreen : AppColors.transparentDeep,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: AppText(
              firstText,
              color: selectedOption == TransferOption.NEW ? Colors.white : AppColors.grey,
              fontWeight: selectedOption == TransferOption.NEW ? AppFontWeight.bold : AppFontWeight.light,
            ),
          ),
        ),
        SizedBox(width: 30.w),
        GestureDetector(
          onTap: () => onOptionSelected(TransferOption.BENEFICIARY),
          child: Container(
            decoration: BoxDecoration(
              color: selectedOption == TransferOption.BENEFICIARY ? AppColors.deepGreen : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: selectedOption == TransferOption.BENEFICIARY ? AppColors.deepGreen : AppColors.transparentDeep,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: AppText(
              secondText,
              color: selectedOption == TransferOption.BENEFICIARY ? Colors.white : AppColors.grey,
              fontWeight: selectedOption == TransferOption.BENEFICIARY ? AppFontWeight.bold : AppFontWeight.light,
            ),
          ),
        ),
      ],
    );
  }
}
