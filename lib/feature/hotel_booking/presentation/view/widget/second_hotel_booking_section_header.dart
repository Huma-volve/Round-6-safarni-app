import 'package:flutter/material.dart';
import 'package:safarni/core/utils/app_colors.dart';
import 'package:safarni/core/utils/app_style.dart';

class SecondHotelBookingSectionHeader extends StatelessWidget {
  const SecondHotelBookingSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recommendation',
              style: AppStyle.textMedium17.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              'View all',
              style: AppStyle.textMedium15.copyWith(
                color: AppColors.sixthColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
