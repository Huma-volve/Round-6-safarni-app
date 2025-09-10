import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CustomTotalPrice extends StatelessWidget {
  const CustomTotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Total price',
            style: AppStyles.textRegular16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 8),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '\$200.00',
                  style: AppStyles.textSemiBold17.copyWith(
                    color: AppColors.thirdColor,
                  ),
                ),
                TextSpan(
                  text: '/night',
                  style: AppStyles.textSemiBold15.copyWith(
                    color: AppColors.fifthColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
