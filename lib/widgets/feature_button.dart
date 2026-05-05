import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/responsive.dart';
// import '../utils/app_text_styles.dart';

class FeatureButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  final double? fontSize;

  const FeatureButton({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onPressed,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: Responsive.setHeight(8)),
      // Adding a nice gradient and soft shadow to make these large options stand out
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color,
            color == AppColors.primary ? AppColors.accentBlue : color.withValues(alpha: 0.8)
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onPressed,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          overlayColor: WidgetStateProperty.all(Colors.transparent),

          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Responsive.setHeight(14),
              horizontal: Responsive.setWidth(20),
            ),
            child: Row(
              children: [
               
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: Colors.white, size: Responsive.setFontSize(28)),
                ),
                SizedBox(width: Responsive.setWidth(16)),
                
               
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize ?? Responsive.setFontSize(16.2),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.05,
                    ),
                  ),
                ),
                
             
                const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
