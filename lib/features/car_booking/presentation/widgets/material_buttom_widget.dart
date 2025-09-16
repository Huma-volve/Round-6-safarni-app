import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';

class MaterialButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MaterialButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColors.viewAllColor,
      textColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
