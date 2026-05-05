import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool isPassword;
  final bool? obscureText;
  final VoidCallback? onToggleVisibility;
  final EdgeInsetsGeometry? margin;
  final int? maxLines;
  final ValueChanged<String>? onChanged;
  final int? minLines;
  final double iconSize;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIconWidget;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.obscureText,
    this.onToggleVisibility,
    this.margin,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
    this.iconSize = 18.0,
    this.readOnly = false,
    this.onTap,
    this.suffixIconWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04), 
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText ?? isPassword,
        maxLines: maxLines,
        minLines: minLines,
        onChanged: onChanged,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hint,
          hintMaxLines: 1,
          hintStyle: const TextStyle(
            color: AppColors.textSecondary,
            overflow: TextOverflow.ellipsis,
          ),
          prefixIcon: Icon(icon, color: AppColors.primary, size: iconSize), 
          suffixIcon: isPassword 
              ? IconButton(
                  icon: Icon(
                    (obscureText ?? true) ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.textSecondary,
                    size: iconSize,
                  ),
                  onPressed: onToggleVisibility,
                )
              : suffixIconWidget,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none, 
          ),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    );
  }
}
