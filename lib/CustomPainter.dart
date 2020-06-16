import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  final Offset center;
  MyCustomPainter(this.center);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.deepOrange;

    canvas.drawCircle(center, 5.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
