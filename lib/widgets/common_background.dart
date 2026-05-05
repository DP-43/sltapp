import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'decorative_bubble.dart';
import 'bottom_wave.dart';

class CommonBackground extends StatelessWidget {
  final Widget child; 

  const CommonBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Stack(
      children: [
    
        Positioned(
          top: screenHeight * 0.11,
          left: screenWidth * 0.06,
          child: DecorativeBubble(size: screenWidth * 0.11, color: AppColors.accentBlue.withValues(alpha: 0.12)),
        ),
        Positioned(
          top: screenHeight * 0.09,
          right: screenWidth * 0.18,
          child: DecorativeBubble(size: screenWidth * 0.12, color: AppColors.primary.withValues(alpha: 0.08)),
        ),
        Positioned(
          top: screenHeight * 0.37,
          right: screenWidth * 0.06,
          child: DecorativeBubble(size: screenWidth * 0.22, color: AppColors.accentBlue.withValues(alpha: 0.08)),
        ),
        Positioned(
          bottom: screenHeight * 0.24,
          left: screenWidth * 0.11,
          child: DecorativeBubble(size: screenWidth * 0.17, color: AppColors.primary.withValues(alpha: 0.06)),
        ),
    
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: CustomPaint(
            size: Size(double.infinity, screenHeight * 0.14),
            painter: BottomWavePainter(),
          ),
        ),

        child,
      ],
    );
  }
}
