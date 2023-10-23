import 'dart:math';
import 'package:flutter/material.dart';

class DottedCircleBorder extends StatelessWidget {
  final double radius;
  final double borderWidth;
  final Widget? child;

  const DottedCircleBorder(
      {super.key, required this.radius, required this.borderWidth, this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(2 * (radius + borderWidth), 2 * (radius + borderWidth)),
      painter: DottedCirclePainter(radius, borderWidth),
      child: child,
    );
  }
}

class DottedCirclePainter extends CustomPainter {
  final double radius;
  final double borderWidth;

  DottedCirclePainter(this.radius, this.borderWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white70 // Border color
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..strokeCap = StrokeCap.round;

    const double spacing = 5.0; // Adjust the spacing between dots

    // Calculate the number of dots needed
    final double circumference = 2 * radius * 3.14159265359;
    final int numberOfDots = (circumference / spacing).round();

    // Draw the dotted border
    for (int i = 0; i < numberOfDots; i++) {
      double radians = (i / numberOfDots) * 3.14159265359 * 2;
      double x = radius + radius * cos(radians);
      double y = radius + radius * sin(radians);

      canvas.drawCircle(Offset(x, y), borderWidth / 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}