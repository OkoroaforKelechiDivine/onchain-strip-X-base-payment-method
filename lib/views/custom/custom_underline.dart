import 'package:flutter/material.dart';

class CustomUnderlinedText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  const CustomUnderlinedText({
    Key? key,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: CustomPaint(
        painter: UnderlinePainter(textStyle.color ?? Colors.black),
        child: Text(
          text,
          style: textStyle.copyWith(decoration: TextDecoration.none),
        ),
      ),
    );
  }
}

class UnderlinePainter extends CustomPainter {
  final Color color;

  UnderlinePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final startPoint = Offset(size.width * 0.3, size.height);
    final endPoint = Offset(size.width * 0.7, size.height);

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
