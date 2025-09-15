import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({
    required this.text, required this.isSelected, super.key,
    this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: onTap,
        color: isSelected ? AppColors.viewAllColor : Colors.white,
        textColor: isSelected ? Colors.white : AppColors.viewAllColor,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: isSelected ? Colors.transparent : AppColors.viewAllColor,
            width: 1.2,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
