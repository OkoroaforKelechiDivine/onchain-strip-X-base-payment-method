import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';
import 'package:pay_me_mobile/core/cores.dart';

import '../../../../core/constants/colors.dart';

class GenderSelectionWidget extends StatefulWidget {
  final int? selectedIndex;
  final ValueChanged<int?>? onChanged;

  const GenderSelectionWidget({
    Key? key,
    this.selectedIndex,
    this.onChanged,
  }) : super(key: key);

  @override
  _GenderSelectionWidgetState createState() => _GenderSelectionWidgetState();
}

class _GenderSelectionWidgetState extends State<GenderSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 75.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.darkWhite, width: 1),
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  'Gender',
                  color: AppColors.grey,
                  fontWeight: AppFontWeight.bold,
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    _buildGenderOption(0, 'Male'),
                    SizedBox(width: 100.w),
                    _buildGenderOption(1, 'Female'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderOption(int index, String gender) {
    return GestureDetector(
      onTap: () {
        widget.onChanged?.call(index);
        setState(() {});
      },
      child: Row(
        children: [
          Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: widget.selectedIndex == index
                    ? AppColors.demonicGreen
                    : AppColors.black,
              ),
              color: AppColors.white,
            ),
            child: Center(
              child: Container(
                width: 10.w,
                height: 10.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.white,
                  ),
                  color: widget.selectedIndex == index
                      ? AppColors.demonicGreen
                      : AppColors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            gender,
            style: TextStyle(
              fontSize: 15.sp,
              color: widget.selectedIndex == index
                  ? AppColors.grey
                  : AppColors.grey,
              fontFamily: GoogleFonts.spectral().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
