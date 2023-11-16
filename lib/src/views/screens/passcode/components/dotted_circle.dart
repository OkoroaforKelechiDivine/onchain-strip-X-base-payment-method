import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';

class BuildDottedCircle extends StatelessWidget {
  final int index;
  final List<String> enteredDigits;
  const BuildDottedCircle({super.key, required this.index, required this.enteredDigits});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 20,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: enteredDigits.length > index ? AppColors.lightBlack : Colors.transparent,
        border: Border.all(
          color: AppColors.lightBlack,
        ),
      ),
    );
  }
}
