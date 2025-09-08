import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_style.dart';

class CustomTotalPrice extends StatelessWidget {
  const CustomTotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total price',
          style: AppStyle.textRegular16.copyWith(color: AppColors.primaryColor),
        ),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '\$200.00',
                style: AppStyle.textSemiBold17.copyWith(
                  color: AppColors.thirdColor,
                ),
              ),
              TextSpan(
                text: '/night',
                style: AppStyle.textSemiBold15.copyWith(
                  color: AppColors.fifthColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
