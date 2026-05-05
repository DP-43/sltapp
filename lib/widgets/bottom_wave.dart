import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class BottomWavePainter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    const Color lightBlue = AppColors.accentBlue;
    const Color darkBlue = AppColors.primary;
    
    final paint = Paint()..style = PaintingStyle.fill;

    final path1 = Path()
      ..moveTo(0, size.height * 0.33)
      ..quadraticBezierTo(size.width * 0.1, size.height * 0.91, size.width * 0.22, size.height * 0.60)
      ..quadraticBezierTo(size.width * 0.34, size.height * 0.33, size.width * 0.48, size.height * 0.85)
      ..quadraticBezierTo(size.width * 0.62, size.height * 1.16, size.width * 0.78, size.height * 0.58)
      ..quadraticBezierTo(size.width * 0.9, size.height * 0.25, size.width, size.height * 0.55)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close(); 

    paint.color = lightBlue;
    canvas.drawPath(path1, paint); 

    final path2 = Path()
      ..moveTo(0, size.height * 0.51)
      ..quadraticBezierTo(size.width * 0.16, size.height * 1.06, size.width * 0.28, size.height * 0.71)
      ..quadraticBezierTo(size.width * 0.42, size.height * 0.40, size.width * 0.56, size.height * 0.96)
      ..quadraticBezierTo(size.width * 0.7, size.height * 1.26, size.width * 0.84, size.height * 0.71)
      ..quadraticBezierTo(size.width * 0.94, size.height * 0.43, size.width, size.height * 0.71)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    paint.color = darkBlue.withValues(alpha: 0.9);
    canvas.drawPath(path2, paint); 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
