import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CustomCompreItem extends StatelessWidget {
  const CustomCompreItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              AppImages.parisEvening,
              width: 103,
              height: 103,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Paris Evening Cruise",
                  style: AppStyles.poppins14px500WGray800.copyWith(
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "10:00 AM - 1:00 PM | \$50",
                  style: AppStyles.poppins14px600WGray600,
                ),
                const SizedBox(height: 6),
                Text(
                  "Enjoy a romantic evening cruise in Paris.",
                  style: AppStyles.poppins14px400WGray500.copyWith(
                    fontSize: 13,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
