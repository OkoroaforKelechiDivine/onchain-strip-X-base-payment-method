import 'package:flutter/cupertino.dart';

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashGap;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashGap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Drawing horizontal dashes
    for (double i = dashWidth; i < size.width - dashWidth; i += dashWidth + dashGap * 3) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + dashWidth, 0),
        paint,
      );
      canvas.drawLine(
        Offset(i, size.height),
        Offset(i + dashWidth, size.height),
        paint,
      );
    }

    // Drawing vertical dashes
    for (double i = dashWidth; i < size.height - dashWidth; i += dashWidth + dashGap * 3) {
      canvas.drawLine(
        Offset(0, i),
        Offset(0, i + dashWidth),
        paint,
      );
      canvas.drawLine(
        Offset(size.width, i),
        Offset(size.width, i + dashWidth),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
