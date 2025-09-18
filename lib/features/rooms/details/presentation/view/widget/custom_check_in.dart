import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CustomCheckIN extends StatelessWidget {
  const CustomCheckIN({
    required this.isActive,
    required this.day,
    required this.date,
    super.key,
  });
  final bool isActive;
  final String day, date;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: isActive ? const Color(0xFFEBF5FF) : Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.80, color: Color(0xFFE5E7EB)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  day,
                  textAlign: TextAlign.center,
                  style: AppStyles.textMedium13(context: context).copyWith(
                    color: isActive
                        ? AppColors.thirdColor
                        : AppColors.seventhColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  date,
                  textAlign: TextAlign.center,
                  style: AppStyles.textMedium17(context: context).copyWith(
                    color: isActive
                        ? AppColors.thirdColor
                        : AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
