import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({
    super.key,
    required this.text,
    required this.isSelected,
    this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? AppColors.viewAllColor : Colors.white,
          foregroundColor: isSelected ? Colors.white : AppColors.viewAllColor,
          side: BorderSide(
            color: isSelected ? Colors.transparent : AppColors.viewAllColor,
            width: 1.2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}
