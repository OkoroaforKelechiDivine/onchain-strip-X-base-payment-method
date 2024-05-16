import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/core/constants/colors.dart';

import 'dashed_border.dart';

class DashedBorderContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashGap;
  final double borderRadius;
  final Color backgroundColor;

  const DashedBorderContainer({
    Key? key,
    required this.child,
    this.color = AppColors.grey,
    this.strokeWidth = 2,
    this.dashWidth = 10,
    this.dashGap = 5,
    this.borderRadius = 10,
    this.backgroundColor = AppColors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        color: color,
        strokeWidth: strokeWidth,
        dashWidth: dashWidth,
        dashGap: dashGap,
      ),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}
