import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utilities/app_fonts.dart';

class BuildTransferCard extends StatelessWidget {
  final String text;
  final String routeName;

  const BuildTransferCard({super.key, required this.text, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side:  BorderSide(
                color: AppColors.lightGreen,
                width: 2.w
            ),
          ),
          child: GestureDetector(
            onTap: () {
            },
            child: Center(
              child: Text(
                  text,
                  style: sans(color: AppColors.lightGreen)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
