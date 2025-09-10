import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class PriceAndBookingContainer extends StatelessWidget {
  const PriceAndBookingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            spreadRadius: 2,
            blurRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              text: 'Total price',

              style: AppStyles.font15Regular.copyWith(fontSize: 16),
              children: [
                TextSpan(
                  text: '\n\$150.00',
                  style: AppStyles.font12SemiBold.copyWith(
                    fontSize: 17,
                    color: AppColors.blue700Color,
                  ),
                ),
                TextSpan(
                  text: '/per person',
                  style: AppStyles.font12SemiBold.copyWith(
                    fontSize: 13,
                    color: AppColors.grey500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.blue700Color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Book Now',
              style: AppStyles.font12SemiBold.copyWith(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
