import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String hint;
  final IconData icon;
  final List<T> items;
  final T? value;
  final void Function(T?) onChanged;
  final String Function(T) itemLabelBuilder;
  final EdgeInsetsGeometry? margin;
  final double iconSize;

  const CustomDropdown({
    super.key,
    required this.hint,
    required this.icon,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.itemLabelBuilder,
    this.margin,
    this.iconSize = 20.0,
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
      child: DropdownButtonFormField<T>(
        isExpanded: true,
        initialValue: value,
        items: items.map((item) => DropdownMenuItem(
          value: item, 
          child: Text(
            itemLabelBuilder(item),
            softWrap: true,
            maxLines: null,
          )
        )).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.textSecondary),
          prefixIcon: Icon(icon, color: AppColors.primary, size: iconSize),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        ),
      ),
    );
  }
}
