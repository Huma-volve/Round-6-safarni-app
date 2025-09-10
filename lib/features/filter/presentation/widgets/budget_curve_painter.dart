import 'dart:ui';

import 'package:flutter/material.dart';

class BudgetCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.shade100
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.15, size.height * 0.7, size.width * 0.25, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.35, size.height * 0.1, size.width * 0.45, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.55, size.height * 0.3, size.width * 0.65, size.height * 0.15);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.05, size.width * 0.85, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.92, size.height * 0.4, size.width, size.height * 0.6);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}