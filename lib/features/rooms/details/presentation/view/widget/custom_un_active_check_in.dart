import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CustomUnActiveCheckIN extends StatelessWidget {
  const CustomUnActiveCheckIN({required this.isActive, super.key});
  final bool isActive;
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
                  'Tue',
                  textAlign: TextAlign.center,
                  style: AppStyles.textMedium13.copyWith(
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
                  '6 Oct',
                  textAlign: TextAlign.center,
                  style: AppStyles.textMedium17.copyWith(
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
