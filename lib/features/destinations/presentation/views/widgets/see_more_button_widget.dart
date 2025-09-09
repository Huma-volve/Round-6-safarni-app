import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class SeeMoreButtonWidget extends StatelessWidget {
  const SeeMoreButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(right: 16, left: 16, bottom: 24),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.blue700Color),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        'See More',
        style: AppStyles.font12SemiBold.copyWith(
          color: AppColors.blue700Color,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
